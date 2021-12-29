<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- Header -->
	<c:import url="header.jsp">
		<c:param name="pagetitle" value="Kích hoạt tài khoản"></c:param>
	</c:import>
	<body class="bgimage">
		<div class="modal-dialog modal-lg shadow-lg">
	        <div class="modal-content">
	            <div class="modal-header bg-dark">
	                <img style="width: 8rem;" src="${pageContext.request.contextPath}/media/logo/logo.png" alt="logo">     
	            </div>
	            <div class="modal-body px-5">
	            	<c:choose>
	            		<c:when test="${empty email}">
	            			<c:set var="ok" value="d-none"/>
	            		</c:when>
	      				<c:otherwise>
							<c:set var="ng" value="d-none"/>
						</c:otherwise>
	            	</c:choose>
	                <h4 class="text-center mb-4">Thông báo</h4>
	            	<div class="${ok}">
	                    <h6 class="text-muted">Chào mừng bạn trở thành thành viên của AidFunds.</h6>
	                    <h6 class="text-muted">Tài khoản ${email} của bạn đã được kích hoạt thành công, đăng nhập lần đầu và đổi mật khẩu để
	                    bảo vệ tài khoản của bạn.</h6>
	                    <div class="d-flex justify-content-center mt-4 ps-0">
	                    	<a href="${pageContext.request.contextPath}/HomeController?action=login" class="btn btn-primary">Đăng nhập ngay</a>
	                    </div>
	            	</div>
	            	<div class="${ng}">
	                    <h6 class="text-muted">Có lỗi xảy ra, tài khoản chưa được kích hoạt.</h6>
	            	</div>
	            </div>
	            <div class="modal-footer d-flex justify-content-center">
	                <p>Quay trở lại <span><a class = "text-decoration-none" href="${pageContext.request.contextPath}/HomeController">trang chủ</a></span>.</p>
	            </div>
	        </div>
	    </div>
	</body>
</html>