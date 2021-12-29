<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Header -->
<c:import url="header.jsp">
	<c:param name="pagetitle" value="Reset mật khẩu"></c:param>
</c:import>
<body class="bgimage">	
	<div class="modal-dialog modal-lg shadow-lg">
        <div class="modal-content">
            <div class="modal-header bg-dark">
                <img style="width: 8rem;" src="${pageContext.request.contextPath}/media/logo/logo.png" alt="logo">     
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/ResetPasswordController" method="post">
                    <h4 class="text-center mb-4">Lấy lại mật khẩu</h4>
                    <p>Nhập vào địa chỉ email bạn đã dùng để đăng ký tài khoản. Chúng tôi sẽ gửi mật khẩu mới cho bạn qua email này.</p>
                    <p class="text-danger fw-bolder text-center text-uppercase">${error}</p>
                    <p class="text-success fw-bolder text-center text-uppercase">${notice}</p>   
                    <div class="input-group mb-3">
					  <span class="input-group-text" id="basic-addon1"><i class="far fa-envelope"></i></span>
					  <input type="text" id="email" name="email" class="form-control" placeholder="Nhập email" aria-label="Username" aria-describedby="basic-addon1">
					</div>
					<p id="emailnotice" class="text-danger"></p>
                    <div class="d-flex justify-content-center mt-4 ps-0">
                        <button type="submit" id="resetsubmit" class="btn btn-outline-secondary w-100">Xác nhận</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <p>Quay trở lại <span><a class = "text-decoration-none" href="${pageContext.request.contextPath}/HomeController?action=login">đăng nhập</a></span>.</p>
            </div>
        </div>
    </div>
  
  	<script>
	    if ( window.history.replaceState ) {
	        window.history.replaceState( null, null, window.location.href );
	    }
	</script>
</body>
</html>