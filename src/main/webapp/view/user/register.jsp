<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Header -->
<c:import url="../header.jsp">
	<c:param name="pagetitle" value="Đăng ký"></c:param>
</c:import>
<body class="bgimag">
	
	<div class="modal-dialog shadow-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-dark">
                <img style="width: 8rem;" src="${pageContext.request.contextPath}/media/logo/logo.png" alt="logo">              
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/RegisterController" method="post">
                    <h4>Đăng ký thành viên</h4>
                    <p class="text-muted">Vui lòng nhập thông tin bên dưới</p>
                    <p class="text-danger fw-bolder text-center text-uppercase">${registererror}</p>
                    <p class="text-success fw-bolder text-center text-uppercase">${registernotice}</p>
                    <div class="row mt-3">  
                        <div class="col-6 text-end pe-1">
                            <input type="text" name="lastname" id="lastname" placeholder="Họ*" class="form-control name">
                        </div>
                        <div class="col-6 text-start ps-1">
                            <input type="text" name="firstname" id="firstname" placeholder="Tên*" class="form-control name">
                        </div>
                        <p id="namenotice" class="text-danger"></p>
                    </div>
                    <div class="md-form mb-4 mt-2">
                        <input type="text" name="email" id="email" placeholder="Email*" class="form-control">
                        <p id="emailnotice" class="text-danger"></p>
                    </div>
                    <div class="md-form mb-2 mt-4">
                        <input type="text" id="phonenumber" name="phonenumber" placeholder="Số điện thoại" class="form-control">
                    </div>

                    <span class="text-muted mb-1" style="font-size: 13px">Mục có dấu * là bắt buộc</span>
                    <div class="d-flex justify-content-center">
                        <button type="submit" id="registersubmit" class="btn btn-primary w-100">Đăng ký</button>
                    </div>

                </form>
                <div class="mt-2 mb-1">
                    <div class="text-center">
                        <p>Hoặc kết nối với</p>
                    </div>
                    <div class="text-center">
                    	<a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/Donate/GoogleLoginController&response_type=code
							&client_id=774473712465-1iaa9njkci33sfnh56j0k57q73gjqc0u.apps.googleusercontent.com&approval_prompt=force">
                        	<button class="login-gg btn btn-sm btn-outline-danger rounded-pill w-25"><i class="fab fa-google"></i> Google</button>
                        </a>
                    </div>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <p>Bạn đã có tài khoản? <span><a class = "text-decoration-none" href="${pageContext.request.contextPath}/HomeController?action=login">Đăng nhập ngay</a></span>.</p>
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