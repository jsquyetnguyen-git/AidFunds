<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- Header -->
	<c:import url="header.jsp">
		<c:param name="pagetitle" value="Đăng nhập"></c:param>
	</c:import>
	<body class="bgimage">
	<div class="modal-dialog shadow-lg">
        <div class="modal-content">
            <div class="modal-header bg-dark">
                <img style="width: 8rem;" src="${pageContext.request.contextPath}/media/logo/logo.png" alt="logo">     
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/HomeController" method="post">
                    <h4 class="text-center mb-4 mt-3">Đăng nhập</h4>
                    <p class="text-danger fw-bolder text-center text-uppercase">${loginerror}</p>
                    <input type="hidden" name="action" class="form-control" value="login">
                    <div class="input-group mb-4">
					  <span class="input-group-text" id="basic-addon1"><i class="far fa-envelope"></i></span>
					  <input type="text" id="email" name="email" placeholder="Nhập email" class="form-control" value="${cookie['cookie_email'].getValue()}">
					</div>
					<div class="input-group mb-2">
					  <span class="input-group-text"><i class="fas fa-unlock-alt"></i></span>
					  <input type="password" id="password" name="password" placeholder="Nhập password" class="form-control" value="${cookie['cookie_pwd'].getValue()}">
					</div>
                    <div class="container">
                    	<div class="row">
		                    <div class="col-6 form-check">
		                        <input class="form-check-input" type="checkbox" name = "remember" value = "yes" id="flexCheckDefault">
		                        <label class="form-check-label text-muted" for="flexCheckDefault">Remember me</label>
		                    </div>
	                    	<div class="col-6 text-end">                
		                    	<a href="${pageContext.request.contextPath}/HomeController?action=reset" class="text-decoration-none text-muted px-0">Bạn quên mật khẩu?</a>
	                    	</div>
                    	</div>                                       
                    </div>
                    <div class="mt-4 ps-0">
                        <button type="submit" id="loginsubmit" class="btn btn-primary w-100">Đăng nhập</button>
                    </div>
                </form>
                <div class="mt-3 mb-1">
                    <div class="text-center">
                        <p>Hoặc đăng nhập với</p>
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
                <p>Bạn chưa có tài khoản? <span><a class = "text-decoration-none" href="${pageContext.request.contextPath}/HomeController?action=register">Đăng ký ngay</a></span>.</p>
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