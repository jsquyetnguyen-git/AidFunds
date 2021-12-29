 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- Header -->
<c:import url="../header.jsp">
	<c:param name="pagetitle" value="Lịch sử quyên góp"></c:param>
</c:import>
<body id="page-top">
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/HomeController">
                <img src="${pageContext.request.contextPath}/media/logo/logo.png" alt="logo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto py-4 py-lg-0">
                    <li class="nav-item fw-bolder"><a class="nav-link" href="${pageContext.request.contextPath}/HomeController">Trang chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Liên hệ</a></li>
                    <c:choose>
					    <c:when test="${empty userlogging}">
					    	<c:set var="login" value=""/>
					    	<c:set var="username" value="d-none"/>
					    </c:when>    
					    <c:otherwise>
					    	<c:set var="login" value="d-none"/>
							<c:set var="username" value=""/>
					    </c:otherwise>				
					</c:choose>
                    <li class="nav-item ${login}"><a class="nav-link" href="${pageContext.request.contextPath}/HomeController?action=login">Đăng nhập</a></li>               
                    <div>
						<ul class="navbar-nav me-2 mt-2 ${username}">
							<li class="nav-item dropdown">
					          <a class="nav-link dropdown-toggle pt-0 text-uppercase" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><span class="me-1">
					          	<i class="far fa-user-circle"></i></span>${userlogging.firstName}</a>
					          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					            <li><a class="dropdown-item ${display}" href="${pageContext.request.contextPath}/view/user/user-profile.jsp"><i class="fas fa-users-cog me-1"></i>Hồ sơ</a></li>
					            <li><a class="dropdown-item ${display}" href="${pageContext.request.contextPath}/HistoryDonationController?id=${userlogging.accountId}">
					            	<i class="fas fa-history me-2"></i>Lịch sử quyên góp</a></li>
					            <li><a class="dropdown-item ${display}" href="${pageContext.request.contextPath}/HomeController?action=change"><i class="fas fa-sync me-2"></i>Đổi mật khẩu</a></li>
					            <li><hr class="dropdown-divider"></li>
					            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/HomeController?action=logout"><i class="far fa-share-square me-2"></i>Đăng xuất</a></li>
					          </ul>
					        </li>
						</ul>
                    </div>
                </ul>
            </div>
        </div>
    </nav>
    
    <header class="submasthead">
    </header>

	<div class="container mt-4 mb-5">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}/HomeController">Trang chủ</a></li>
				<li class="breadcrumb-item active" aria-current="page">Lịch sử</li>
			</ol>
		</nav>
		<div class="table-heading">
			<div>
				<h4 class="mt-5 pt-5 mb-3 border-top">Lịch sử quyên góp</h4>
			</div>
			<ul>
				<li>Tổng số lượt quyên góp: ${total.count} lượt</li>
				<li>Tổng số tiền đã quyên góp: <fmt:formatNumber type="number" value="${total.amout}" /> VND</li>
			</ul>
		</div>

		<div class="card mb-4 mt-4">
			<div class="card-header">
				<i class="far fa-clock me-1"></i> Lịch sử các lượt quyên góp
			</div>
			<div class="card-body table-responsive">
				<table id="datatable">
					<thead>
						<tr>
							<th class="camp-title">Tên chiến dịch</th>
							<th>Mã chiến dịch</th>
							<th>Thời gian</th>
							<th>Số tiền (VND)</th>
							<th>Phương thức</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${campRecordList}" var="rc">
							<tr>
								<td>${rc.campaignName}</td>
								<td>${rc.recordId}</td>
								<td>${rc.donationDate}</td>
								<td><fmt:formatNumber type="number" value="${rc.amount}" />
								</td>
								<td class="text-capitalize">${rc.method}</td>
								<td class="text-capitalize">${rc.status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="../footer.jsp"/>