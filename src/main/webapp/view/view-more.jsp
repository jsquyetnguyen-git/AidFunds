<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- Header -->
<c:import url="header.jsp">
	<c:param name="pagetitle" value="${campaign.title}"></c:param>
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
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/HistoryDonationController?id=${userlogging.accountId}">Lịch sử quyên góp</a></li>
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
					<c:if test="${userlogging.admin==1}">
						<c:set var="display" value="d-none" />
					</c:if>
					<li class="nav-item ${login}"><a class="nav-link"
						href="${pageContext.request.contextPath}/HomeController?action=login">Đăng nhập</a></li>
					<div>
						<ul class="navbar-nav me-2 mt-2 ${username}">
							<li class="nav-item dropdown"> <a class="nav-link dropdown-toggle pt-0 text-uppercase" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false"><span class="me-1"><i class="far fa-user-circle"></i>
							</span>${userlogging.firstName}</a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item ${display}"
										href="${pageContext.request.contextPath}/view/user/user-profile.jsp">Hồ sơ</a></li>
									<li><a class="dropdown-item ${display}" href="${pageContext.request.contextPath}/HistoryDonationController?id=${userlogging.accountId}">Lịch sử quyên góp</a></li>
									<li><a class="dropdown-item ${display}" href="${pageContext.request.contextPath}/HomeController?action=change">Đổi mật khẩu</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="${pageContext.request.contextPath}/HomeController?action=logout">Đăng xuất</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</ul>
			</div>
		</div>
	</nav>

	<header class="submasthead"> </header>

	<div class="container mt-5 mb-5">
		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/HomeController">Trang chủ</a></li>
		    <li class="breadcrumb-item active" aria-current="page">Quyên góp</li>
		  </ol>
		</nav>
		
		<h3>${campaign.title}</h3>
		<a href="#!"><span class="badge bg-primary"><i
				class="fas fa-thumbs-up me-1"></i>Like</span></a> <a href="#!"><span
			class="badge bg-primary"><i class="fas fa-share"></i>Share</span></a>

		<div class="mt-2">
			<p class="text-muted">${campaign.description}</p>
		</div>

		<div class="container">
			<div class="row">
				<div class="row g-2">
					<div class="col-md-7 col-lg-8 pe-4">
						${campaign.content}
					</div>

					<div class="col-md-5 col-lg-4">
						<div class="position-sticky" style="top: 5rem;">
							<div class="p-4 bg-light shadow rounded">
								<h4 class="">Quyên góp</h4>
								<p class="mb-0">Chọn số tiền bạn muốn quyên góp và phương thức thực hiện quyên góp. </p>
								<div class="camp-status mt-2">Trạng thái: ${campaign.status}</div>
								<c:set var="phantram" value="${Math.ceil(campaign.currentMoney*100/campaign.targetMoney)}"/>
	                            <div class="progress mt-3">
								  <div class="progress-bar" role="progressbar" style="width: ${phantram}%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">${phantram}%</div>
								</div>
								<div class="text-center camp-status">
									<fmt:formatNumber type = "number" value = "${campaign.currentMoney}"/>/<fmt:formatNumber type = "number" value = "${campaign.targetMoney}"/>
								</div>	
								<div class="border w-100 mt-2 mb-2"></div>
								<div>
									<h6><span><i class="fas fa-money-check-alt me-1"></i></span>Số tiền quyên góp</h6>
									<p class="text-danger" id="moneyerror"></p>
								</div>
								<div class="text-muted mt-3">Đơn vị: x1000VND</div>
									<form action="${pageContext.request.contextPath}/DonateController" method="post">
										<div class="mt-1 mb-3 w-100">
											<input type="radio" class="btn-check" name="money" id="300" autocomplete="off" value="300">
											<label class="btn btn-outline-info  my-2 mo" for="300">300</label>
											
											<input type="radio" class="btn-check" name="money" id="500" autocomplete="off" value="500">
											<label class="btn btn-outline-info my-2 mo" for="500">500</label>
											
											<input type="radio" class="btn-check" name="money" id="1000" autocomplete="off" value="1000">
											<label class="btn btn-outline-info my-2 mo" for="1000">1.000</label>
											
											<input type="radio" class="btn-check" name="money" id="1500" autocomplete="off" value="1500">
											<label class="btn btn-outline-info  mb-2 mo" for="1500">1.500</label>
											
											<input type="radio" class="btn-check" name="money" id="2000" autocomplete="off" value="2000">
											<label class="btn btn-outline-info mb-2 mo" for="2000">2.000</label>
											
											<input type="radio" class="btn-check" name="money" id="5000" autocomplete="off" value="5000">
											<label class="btn btn-outline-info mb-2 mo" for="5000">5.000</label>
										</div>
										<div class="input-group mb-3">
										  <input type="text" id="othermoney" name="othermoney" class="form-control other money" placeholder="Số tiền khác">
										  <span class="input-group-text">x1000 VND</span>
										</div>
										<div class="border w-100 mt-2 mb-2"></div>
										<div>
											<h6><span><i class="fas fa-wallet me-1"></i></span>Phương thức quyên góp</h6>
											<p class="text-danger" id="methoderror"></p>
										</div>
										<div class="container p-0 mt-1 mb-3">
											<div class="row g-1 mt-3">
												<div class="col-3">
													<input type="radio" class="btn-check" name="donationmethod" id="bank" value="bank" autocomplete="off">
													<label class="btn btn-outline-info my-1 pay" for="bank">
														<img class="payicon w-100" src="${pageContext.request.contextPath}/media/images/icon/banktran.png">
													</label>
												</div>
												<div class="col-3">
													<input type="radio" class="btn-check" name="donationmethod" id="paypal" value="paypal" autocomplete="off">
													<label class="btn btn-outline-info my-1 pay" for="paypal">
														<img class="payicon w-100" src="${pageContext.request.contextPath}/media/images/icon/paypal.png">
													</label>
												</div>
												<div class="col-3">
													<input type="radio" class="btn-check" name="donationmethod" id="mastercard" value="visa" autocomplete="off" disabled>
													<label class="btn btn-outline-info my-1 pay" for="mastercard">
														<img class="payicon w-100" src="${pageContext.request.contextPath}/media/images/icon/visa.png">
													</label>
												</div>																				
												<div class="col-3">
													<input type="radio" class="btn-check" name="donationmethod" id="vnpay" value="vnpay" autocomplete="off" disabled>
													<label class="btn btn-outline-info my-1 pay" for="vnpay">
														<img class="payicon w-100" src="${pageContext.request.contextPath}/media/images/icon/VNpay.png">
													</label>											
												</div>
												<div class="border w-100 mt-4 mb-2"></div>
												<input type="hidden" name="accountid" value="${userlogging.accountId}">
												<div class="mt-3 mt-2 text-center">
													<c:choose>
														<c:when test="${campaign.status.equals('Đang diễn ra')}">
															<c:set var="hidebutton" value="" />
														</c:when>
														<c:otherwise>
															<c:set var="hidebutton" value="disabled" />
														</c:otherwise>
													</c:choose>
													<button type="submit" ${hidebutton} class="btn btn-outline-primary" id="checkout"><span><i class="fas fa-paper-plane me-1"></i></span>Tiếp tục</button>
												</div>
											</div>
										</div>																			
									</form>
								</div>
								<div class="shadow card mt-5">
									<div class="p-4 bg-light rounded">
										<h4 class="mb-4 mt-2">Quyên góp mới nhất</h4>
										<div class="border w-100 mt-2 mb-2"></div>
										<c:choose>
											<c:when test="${campaign.status.equals('Sắp diễn ra')}">
												<p class="text-muted text-center">Chiến dịch chưa bắt đầu</p>
											</c:when>
											<c:otherwise>
												<c:if test="${empty lastest}">
													<p class="text-muted text-center">Chưa có quyên góp nào</p>
												</c:if>
											</c:otherwise>
										</c:choose>
										<table class="table table-striped">
											<c:forEach items = "${lastest}" var="l">
												<tr >
													<td class="text-capitalize">${l.lastName} ${l.firstName}</td>
													<td><fmt:formatNumber type = "number" value = "${l.amount}"/> VND</td>
												</tr>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />