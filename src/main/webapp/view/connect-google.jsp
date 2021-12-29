<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- Header -->
	<c:import url="header.jsp">
		<c:param name="pagetitle" value="Kết nối tài khoản Google"></c:param>
	</c:import>
<body class="bgimage">
	<div class="modal-dialog shadow-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-dark">
                <img style="width: 8rem;" src="${pageContext.request.contextPath}/media/logo/logo.png" alt="logo">              
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/GoogleLoginController" method="post">
                    <h4 class="text-center">Hoàn tất đăng ký</h4>
                    <p class="text-muted">Tài khoản Google của bạn đã được kết nối thành công. Vui lòng cập nhật thông tin bên dưới để tiếp tục.</p>
                    <p class="text-danger fw-bolder text-center text-uppercase">${registererror}</p>
                    <p class="text-success fw-bolder text-center text-uppercase">${registernotice}</p>
                    <input type="hidden" readonly name="email" value="${email}" />
                    <input type="hidden" name="id" value="${id}" />
                    <input type="hidden" name="avatar" value="${avatar}" />
                    <div class="row mt-3">  
                        <div class="col-6 text-end pe-1">
                            <input type="text" name="lastname" id="lastname" placeholder="Họ" class="form-control name">
                        </div>
                        <div class="col-6 text-start ps-1">
                            <input type="text" name="firstname" id="firstname" placeholder="Tên" class="form-control name">
                        </div>
                        <p id="namenotice" class="text-danger"></p>
                    </div>
                        <div class="text-center">
	                        <button type="submit" class="btn btn-outline-secondary">Xác nhận</button>
                    	</div>
                </form>
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