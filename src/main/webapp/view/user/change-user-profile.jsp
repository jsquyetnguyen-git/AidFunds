 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!-- Header -->
<c:import url="../header.jsp">
	<c:param name="pagetitle" value="Thay đổi thông tin tài khoản"></c:param>
</c:import>
<body id="page-top">
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/HomeController"> <img src="${pageContext.request.contextPath}/media/logo/logo.png">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> Menu <i class="fas fa-bars ms-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto py-4 py-lg-0">
					<li class="nav-item fw-bolder"><a class="nav-link"
						href="${pageContext.request.contextPath}/HomeController">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/HistoryDonationController?id=${userlogging.accountId}">Lịch sử quyên góp</a></li>
					<li class="nav-item"><a class="nav-link" href="#contact">Liên hệ</a></li>
					<c:choose>
						<c:when test="${empty userlogging}">
							<c:set var="login" value="" />
							<c:set var="username" value="d-none" />
						</c:when>
						<c:otherwise>
							<c:set var="login" value="d-none" />
							<c:set var="username" value="" />
						</c:otherwise>
					</c:choose>
					<li class="nav-item ${login}"><a class="nav-link"
						href="${pageContext.request.contextPath}/HomeController?action=login">Đăng nhập</a></li>
					<div>
						<ul class="navbar-nav me-2 mt-2 ${username}">
							<li class="nav-item dropdown"><a class="nav-link dropdown-toggle pt-0 text-uppercase" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
								aria-expanded="false"><span class="me-1"><i class="far fa-user-circle"></i></span>${userlogging.firstName}</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item ${display}" href="${pageContext.request.contextPath}/view/user/user-profile.jsp"><i
										class="fas fa-users-cog me-1"></i>Hồ sơ</a></li>
								<li><a class="dropdown-item ${display}" href="${pageContext.request.contextPath}/HistoryDonationController?id=${userlogging.accountId}"><i
										class="fas fa-history me-2"></i>Lịch sử quyên góp</a></li>
								<li><a class="dropdown-item ${display}" href="${pageContext.request.contextPath}/HomeController?action=change"><i
										class="fas fa-sync me-2"></i>Đổi mật khẩu</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/HomeController?action=logout"><i
										class="far fa-share-square me-2"></i>Đăng xuất</a></li>
							</ul></li>
						</ul>
					</div>
				</ul>
			</div>
		</div>
	</nav>

	<header class="submasthead">
    </header>
    
   	<div class="container profile mt-4 mb-5">
   		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/HomeController">Trang chủ</a></li>
		    <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa hồ sơ</li>
		  </ol>
		</nav>
		<form id="add" class="row g-3 p-2 mt-4 card" method="post" action="${pageContext.request.contextPath}/ChangeProfileController">
			<div class="d-flex">
				<div class="ms-1">
					<c:choose>
						<c:when test="${empty userlogging.avatar}">
							<c:set var="avatar" value="/CKFinderJava/userfiles/images/avatar/unnamed_150x200.jpg" />
						</c:when>
						<c:otherwise>
							<c:set var="avatar" value="${userlogging.avatar}" />
						</c:otherwise>
					</c:choose>
					<img class="border" alt="avatar" src="${avatar}" style="height:200px"/>					
				</div>
				<div id="lert" class="ms-5"></div>
			</div>
			<button style="width:80px" type="button" class="btn btn-secondary btn-sm ms-5" data-bs-toggle="modal" data-bs-target="#changeavatar">Thay ảnh</button>
			<input type="hidden" class="form-control" id="id" name="id" value="${userlogging.accountId}">
			<div class="mb-2 mt-3 row">
				<label for="email" class="col-4 col-md-2 col-form-label">Email</label>
				<div class="col-8 col-md-10">
					<input type="text" readonly class="form-control" id="email" name="email" value="${userlogging.email}">
				</div>
			</div>
			<div class="mb-2 mt-3 row">
				<label for="password" class="col-4 col-md-2 col-form-label">Mật khẩu</label>
				<div class="col-4 col-md-2">
					<input type="password" readonly class="form-control form-control-sm"
						id="password" name="password" value="${userlogging.password}">
				</div>
				<div class="col-4 col-md-8 ${display}">
					<a href="${pageContext.request.contextPath}/HomeController?action=change">
						<button type="button" class="btn btn-sm btn-light rounded-pill">Đổi mật khẩu</button>
					</a>
				</div>
			</div>
			<div class="mb-2 mt-3 row">
				<label for="firstname" class="col-4 col-md-2 col-form-label">Tên</label>
				<div class="col-8 col-md-10 text-capitalize">
					<input type="text" class="form-control name" id="firstname" name="firstname" value="${userlogging.firstName}">
				</div>
			</div>
			<div class="mb-2 mt-3 row">
				<label for="lastname" class="col-4 col-md-2 col-form-label">Họ</label>
				<div class="col-8 col-md-10 text-capitalize">
					<input type="text" class="form-control name" id="lastname" name="lastname" value="${userlogging.lastName}">
				</div>
			</div>
			<div class="mb-2 mt-3 row">
				<label for="gender" class="col-4 col-md-2 col-form-label">Giới Tính</label>
				<div class="col-8 col-md-10">
					<c:choose>
						<c:when test="${userlogging.gender == 1}">
							<c:set var="male" value="selected" />
						</c:when>
						<c:otherwise>
							<c:set var="female" value="selected" />
						</c:otherwise>
					</c:choose>
					<select class="form-select" id="gender" name="gender">
						<option value="0" ${female}>Nữ</option>
						<option value="1" ${male}>Nam</option>
					</select>
				</div>
			</div>
			<div class="mb-2 mt-3 row">
				<label for="address" class="col-4 col-md-2 col-form-label">Địa Chỉ</label>
				<div class="col-8 col-md-10">
					<input type="text" class="form-control" id="address" name="address" value="${userlogging.address}">
				</div>
			</div>
			<div class="mb-2 mt-3 row ${display}">
				<label for="registerDate" class="col-4 col-md-2 col-form-label">Ngày đăng ký</label>
				<div class="col-8 col-md-10">
				<input type="text" readonly class="form-control" id="registerDate" name="registerDate" value="${userlogging.registerdate}">
				</div>
			</div>
			<div class="mb-2 mt-3 row">
				<label for="phonenumber" class="col-4 col-md-2 col-form-label">Số điện thoại</label>
				<div class="col-8 col-md-10">
					<input type="text" class="form-control" id="phonenumber" name="phonenumber" value="${userlogging.phoneNumber}">
				</div>
			</div>
			<div class="text-center">
				<button type="button" class="btn btn-primary" id="saveprofile">Save</button>
				<button type="reset" class="btn btn-secondary">Reset</button>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="changeprofile" tabindex="-1" aria-hidden="true">
				<div class="modal-dialog">
				    <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title">Xác nhận</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					    </div>
					    <div class="modal-body">
					        <h6>Nhấn xác nhận để thay đổi thông tin.</h6>
					    </div>
					    <div class="modal-footer">
					        <button type="submit" class="btn btn-primary">Xác nhận</button>
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
					    </div>
				    </div>
				</div>
			</div>
   		</form>
   		
   		<!-- Change avatar -->
   		<form method="post" action="${pageContext.request.contextPath}/ChangeAvatar" enctype="multipart/form-data">
		<div class="modal fade" id="changeavatar" tabindex="-1" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Chọn ảnh</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<p class="text-danger" id="avatarerror"></p>
		        <input class="form-control form-control-sm mb-3" id="avatar" name="avatar" type="file" accept="image/*">
		        <input type="hidden" class="form-control" name="id" value="${userlogging.accountId}">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
		        <button type="submit" id="submitavatar" class="btn btn-primary">Xác nhận</button>
		      </div>
		    </div>
		  </div>
		</div>
		</form>
   		
	</div>

	<!-- Footer -->
	<jsp:include page="../footer.jsp"/>