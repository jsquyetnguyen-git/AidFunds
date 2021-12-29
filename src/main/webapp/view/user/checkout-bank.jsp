<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Header -->
<c:import url="../header.jsp">
	<c:param name="pagetitle" value="Bank"></c:param>
</c:import>
<body class="bgimage">
	<div class="modal-dialog modal-xl shadow-lg modal-fullscreen-md-down">
		<div class="modal-content">
			<div class="modal-header bg-dark">
				<img style="width: 8rem;"
					src="${pageContext.request.contextPath}/media/logo/logo.png"
					alt="logo">
			</div>
			<c:choose>
				<c:when test="${empty userlogging}">
					<c:set var="username" value="Vô Danh" />
					<c:set var="userid" value="0" />
					<c:set var="display" value="d-none" />
					<c:set var="bankcontent" value="MCD_SDT" />
					<c:set var="note" value="Trong đó: MCD là mã chiến dịch, SDT là số điện thoại. Chúng tôi sẽ gửi thông báo cho bạn qua số điện thoại này." />
				</c:when>
				<c:otherwise>
					<c:set var="username"
						value="${userlogging.lastName} ${userlogging.firstName}" />
					<c:set var="userid" value="${userlogging.accountId}" />
					<c:set var="bankcontent" value="MCD_MTK" />
					<c:set var="note" value="Trong đó: MCD là mã chiến dịch, MTK là mã tài khoản" />
				</c:otherwise>
			</c:choose>
			<div class="modal-body text-center">
				<h4 class="fw-bolder mt-4 mb-2">Chuyển khoản qua ngân hàng</h4>
				<p class="text-muted">Xác nhận thông tin và chuyển tiền tới số
					tài khoản bên dưới.</p>
				<div class="container mt-4 mb-4">
					<div class="row">
						<div class="col-6">
							<div class="px-4 pt-3 card left">
								<h5 class="fw-bolder">Thông tin chuyển khoản</h5>
								<div class="text-start text-muted mt-5">
									<dl class="row">
										<dt class="col-sm-5">Tài khoản thụ hưởng:</dt>
										<dd class="col-sm-7">AIDFUNDS VIET NAM</dd>
										<dt class="col-sm-5">Số TK thụ hưởng:</dt>
										<dd class="col-sm-7">0011004388497</dd>
										<dt class="col-sm-5">Ngân hàng thụ hưởng:</dt>
										<dd class="col-sm-7">Ngân hàng Kỹ Thương Việt Nam</dd>
										<dt class="col-sm-5">Nội dung:</dt>
										<dd class="col-sm-7">${bankcontent}</dd>
										<dt class="col-sm-5"></dt>
										<dd class="col-sm-7" style="font-size: 12px">${note}</dd>
									</dl>
								</div>
							</div>
						</div>
						<div class="col-6">
							<div class="px-4 pt-3 card right">
								<h5 class="fw-bolder">Chi tiết ủng hộ</h5>
								<div class="text-start text-muted mt-5">
									<dl class="row">
										<dt class="col-sm-4 ${display}">Họ & Tên:</dt>
										<dd class="col-sm-8 ${display}">${username}</dd>
										<dt class="col-sm-4 ${display}">Mã tài khoản:</dt>
										<dd class="col-sm-8 ${display}">${userid}</dd>
										<dt class="col-sm-4">Số tiền ủng hộ:</dt>
										<dd class="col-sm-8">
											<fmt:formatNumber type="number" value="${amount}" />
											.000 VND
										</dd>
										<dt class="col-sm-4">Mã Chiến dịch:</dt>
										<dd class="col-sm-8">${campaign.campaignId}</dd>
										<dt class="col-sm-4">Tên Chiến dịch:</dt>
										<dd class="col-sm-8">${campaign.title}</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</div>
				<form action="${pageContext.request.contextPath}/CheckoutController"
					method="post">
					<input type="hidden" name="accountid" value="${userid}"> <input
						type="hidden" name="campaignid" value="${campaign.campaignId}">
					<input type="hidden" name="amount" value="${amount*1000}">
					<input type="hidden" name="method" value="Bank">
					<div>
						<button type="submit" class="btn btn-primary mb-1">
							<i class="far fa-check-circle me-1"></i>Xác Nhận
						</button>
					</div>
				</form>
			</div>
			<div class="modal-footer d-flex justify-content-center">
				<p>Quay trở về <span><a class="text-decoration-none" href="${pageContext.request.contextPath}/HomeController"><span><i
								class="fas fa-home me-1"></i></span>TRANG CHỦ</a></span>.</p>
			</div>
		</div>
	</div>

	<script>
		if (window.history.replaceState) {
			window.history.replaceState(null, null, window.location.href);
		}
	</script>
</body>
</html>