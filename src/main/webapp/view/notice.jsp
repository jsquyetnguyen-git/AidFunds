<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Header -->
<c:import url="header.jsp">
	<c:param name="pagetitle" value="Thông báo"></c:param>
</c:import>
<body>
	<c:choose>
		<c:when test="${empty amount}">
			<c:set var="thank" value="d-none" />
		</c:when>
		<c:otherwise>
			<c:set var="notice" value="d-none" />
		</c:otherwise>
	</c:choose>

	<div class="modal-dialog shadow-lg ${notice}">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="text-center mb-1">
					<span><i class="fas fa-exclamation-circle me-2"></i></span>Thông báo
				</h4>
				<a href="${pageContext.request.contextPath}/${url}">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</a>
			</div>
			<div class="modal-body text-start">
				<form action="#" name="loginForm">
					<div class="md-form mb-4 text-muted mt-1">${notice}</div>
					<div class="md-form mb-4 text-muted mt-2">${notice1}</div>
					<div class="md-form mb-4 text-muted mt-2">${error}</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal-dialog shadow-lg modal-lg modal-dialog-centered ${thank}">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-md-7 p-4 text-muted fs-4">
						<p>
							AidFunds xin cảm ơn <span class="fw-bold text-capitalize">${userlogging.lastName} ${userlogging.firstName}</span>
						</p>
						<p> Số tiền <strong><fmt:formatNumber type="number" value="${amount}" /> VND</strong> bạn đóng góp sẽ được sử dụng một cách
							hiệu quả nhất.
						</p>
						<c:if test="${empty userlogging.lastName}">
							<c:set var="user" value="d-none" />
							<c:set var="vodanh" value="d-none" />
						</c:if>
						<c:choose>
							<c:when test="${empty userlogging.lastName}">
								<c:set var="user" value="d-none" />
								<c:set var="vodanh" value="" />
							</c:when>
							<c:otherwise>
								<c:set var="vodanh" value="d-none" />
								<c:set var="user" value="" />
							</c:otherwise>
						</c:choose>
						<p class="${user}">Theo dõi lịch sử để biết thêm chi tiết nhé!
							Chúng tôi sẽ cập nhật kết quả khi nhận được số tiền từ ngân hàng.</p>
						<p class="${vodanh}">Chúng tôi sẽ cập nhật kết quả tới bạn qua
							số điện thoại bạn cung cấp khi nhận được số tiền từ ngân hàng.</p>
						<p>Một lần nữa chân thành cảm ơn những đóng góp đầy ý nghĩa của bạn.</p>
					</div>
					<div class="col-md-5">
						<img class="w-100" src="${pageContext.request.contextPath}/media/images/icon/thank2.png">
					</div>
				</div>
			</div>
			<div class="text-start ms-3 mb-3 mt-1">
				<a href="${pageContext.request.contextPath}/HomeController"
					class="btn btn-outline-secondary"><i class="fas fa-home"></i> Trang chủ</a>
			</div>
		</div>
	</div>
</body>
</html>