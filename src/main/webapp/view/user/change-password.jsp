<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Header -->
<c:import url="../header.jsp">
	<c:param name="pagetitle" value="Trang chủ"></c:param>
</c:import>

<body class="bgimage">
	
	<div class="modal-dialog shadow-lg">
        <div class="modal-content">
            <div class="modal-header bg-dark">
            <a href="${pageContext.request.contextPath}/HomeController">
                <img style="width: 8rem;" src="${pageContext.request.contextPath}/media/logo/logo.png" alt="logo">     
            </a>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/ChangePasswordController" method="post">
                    <h4 class="text-center mb-4">Đổi mật khẩu</h4>
                    <p class="mb-2">Hãy thường xuyên đổi mật khẩu để nâng cao bảo mật tài khoản.</p>
                    <p class="text-danger fw-bolder text-center text-uppercase">${changeerror}</p>
                    <p class="text-success fw-bolder text-center text-uppercase">${changenotice}</p>
                    <div id="lert"></div>
                    
                    <input type="hidden" name="id" class="form-control" value="${userlogging.accountId}">
                    <div class="input-group mb-4">
					  <span class="input-group-text"><i class="fas fa-lock-open"></i></span>
					  <input type="password" id="oldpassword" name="oldpassword" class="form-control" placeholder="Mật khẩu cũ">
					</div>
					
					<div class="input-group mb-4">
					  <span class="input-group-text"><i class="fas fa-unlock-alt"></i></span>
					  <input type="password" id="newpassword" name="newpassword" class="form-control" placeholder="Mật khẩu mới">
					</div>
					
					<div class="input-group mb-4">
					  <span class="input-group-text"><i class="fas fa-unlock-alt"></i></span>
					  <input type="password" id="newrepassword" name="newrepassword" class="form-control" placeholder="Xác nhận mật khẩu mới">
					</div>
					
					<div class="d-flex justify-content-center mt-4 ps-0">
                        <button type="submit" id="change-pass-confirm" class="btn btn-outline-secondary w-50 me-1">Xác nhận</button>
                        <button type="reset" class="btn btn-outline-secondary w-50 ms-1">Reset</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <p>Trở về <span><a class = "text-decoration-none" href="${pageContext.request.contextPath}/HomeController">TRANG CHỦ</a></span></p>
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