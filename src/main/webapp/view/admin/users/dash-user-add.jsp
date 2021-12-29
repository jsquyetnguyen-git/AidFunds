<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Header -->
<jsp:include page="../dash-header.jsp" />
<!-- Dash content -->
<div class="container-fluid px-4 tbl">
	<c:choose>
	    <c:when test="${function.equals('modify')}">
	    	<c:set var="url" value="ModifyUser"/>
	    	<c:set var="heading" value="Update tài khoản user"/>
	    	<c:set var="readonly" value="readonly"/>
	    	<c:set var="plaintext" value="form-control-plaintext"/>
	    	<c:set var="hidden" value="d-none"/>
	    	<c:set var="noticetext" value="Xác nhận update tài khoản."/>
	    	<c:set var="enctype" value=""/>
	    </c:when>    
	    <c:otherwise>
			<c:set var="url" value="AddUser"/>
			<c:set var="heading" value="Thêm tài khoản mới"/>
			<c:set var="plaintext" value="form-control form-control-sm"/>
			<c:set var="display" value="d-none"/>
			<c:set var="noticetext" value="Xác nhận thêm tài khoản."/>
			<c:set var="enctype" value='enctype="multipart/form-data"'/>
	    </c:otherwise>
	</c:choose>
	<div class="table-heading">
		<div>
			<h4 class="mt-4 mb-4">${heading}</h4>
		</div>
		<div id="lert"></div>
	</div>

	<div class="card mb-4 addcamp">
		<div class="card-header mb-4">Thông tin tài khoản</div>
		<form id="add" class="row g-3 p-2" method="post" action="${pageContext.request.contextPath}/${url}" ${enctype}>
			<div class="mb-2 ${display}">
				<c:choose>
					<c:when test="${empty user.avatar}">
						<c:set var="avatar" value="/CKFinderJava/userfiles/images/avatar/unnamed_150x200.jpg" />
					</c:when>
					<c:otherwise>
						<c:set var="avatar" value="${user.avatar}" />
					</c:otherwise>
				</c:choose>
			  <img class="border" alt="avatar" src="${avatar}" style="height:200px" />
			</div>
			<div class="mb-3 mt-3 row ${display}">
				<label for="id" class="col-4 col-md-2 col-form-label">ID tài khoản</label>
				<div class="col-8 col-md-10">
					<input type="text" name="id" ${readonly} class="${plaintext}"
						id="id" value="${user.accountId}">
				</div>
			</div>
			<div class="mb-2 mt-2 row">
				<label for="email" class="col-4 col-md-2 col-form-label">Email</label>
				<div class="col-8 col-md-10">
					<input type="text" ${readonly} class="${plaintext}"
						id="email" name="email" value="${user.email}">
				</div>
			</div>
			<div class="mb-2 mt-2 row">
				<label for="password" class="col-4 col-md-2 col-form-label">Mật khẩu</label>
				<div class="col-4 col-md-2">
					<input type="password" ${readonly} class="${plaintext}"
						id="password" name="password" value="${user.password}">
				</div>
				<div class="col-4 col-md-8 ${display}">
						<button type="button" data-bs-toggle="modal" data-bs-target="#resetpass" class="btn btn-sm btn-light rounded-pill">Reset</button>
				</div>
			</div>
			<div class="mb-2 mt-2 row ${hidden}">
				<label for="avatar" class="col-4 col-md-2 col-form-label">Ảnh đại diện</label>
				<div class="col-8 col-md-10">
					<div class="input-group input-group-sm">
					  <input class="form-control form-control-sm mb-3" id="avatar" name="avatar" type="file" accept="image/*">
					</div>
				</div>
			</div>
			<div class="mb-2 mt-2 row">
				<label for="firstname" class="col-4 col-md-2 col-form-label">Tên</label>
				<div class="col-8 col-md-10">
					<input type="text" ${readonly} class="${plaintext} name text-capitalize" id="firstname" name="firstname" value="${user.firstName}">
				</div>
			</div>
			<div class="mb-2 mt-2 row">
				<label for="lastname" class="col-4 col-md-2 col-form-label">Họ</label>
				<div class="col-8 col-md-10">
					<input type="text" ${readonly}
						class="${plaintext} name text-capitalize" id="lastname" name="lastname" value="${user.lastName}">
				</div>
			</div>
			<div class="mb-2 mt-2 row">
				<label for="address" class="col-4 col-md-2 col-form-label">Địa Chỉ</label>
				<div class="col-8 col-md-10">
					<c:choose>
						<c:when test="${empty user}">
							<c:set var="address" value="" />
						</c:when>
						<c:when test="${empty user.address}">
							<c:set var="address" value="Chưa được cập nhật" />
						</c:when>
						<c:otherwise>
							<c:set var="address" value="${user.address}" />
						</c:otherwise>
					</c:choose>
					<input type="text" ${readonly}
						class="${plaintext} text-capitalize" id="address" name="address" value="${address}">
				</div>
			</div>
			<div class="mb-2 mt-2 row ${display}">
				<label for="registerDate" class="col-4 col-md-2 col-form-label">Ngày đăng ký</label>
				<div class="col-8 col-md-10">
					<input type="text" ${readonly} class="form-control-plaintext"
						id="registerDate" name="registerDate" value="${user.registerdate}">
				</div>
			</div>
			<div class="mb-2 mt-2 row">
				<label for="phonenumber" class="col-4 col-md-2 col-form-label">Số điện thoại</label>
				<div class="col-8 col-md-10">
					<input type="text" ${readonly} class="${plaintext}"
						id="phonenumber" name="phonenumber" value="${user.phoneNumber}">
				</div>
			</div>
			<c:choose>
				<c:when test="${user.admin == 1}">
					<c:set var="selectadmin" value="selected" />
				</c:when>
				<c:otherwise>
					<c:set var="selectuser" value="selected" />
				</c:otherwise>
			</c:choose>
			<div class="mb-2 mt-2 row">
				<label for="role" class="col-4 col-md-2 col-form-label">Quyền</label>
				<div class="col-8 col-md-10">
					<select class="form-select" id="role" name="role" aria-label="Default select example">
						<option value="0" ${selectuser}>User</option>
						<option value="1" ${selectadmin}>Admin</option>
					</select>
				</div>
			</div>
			<c:choose>
				<c:when test="${user.status == 0}">
					<c:set var="selectstop" value="selected" />
				</c:when>
				<c:otherwise>
					<c:set var="selectactive" value="selected" />
				</c:otherwise>
			</c:choose>
			<div class="mb-2 mt-3 row ${display}">
				<label for="status" class="col-4 col-md-2 col-form-label">Trạng thái</label>
				<div class="col-8 col-md-10">
					<select class="form-select" id="status" name="status" aria-label="Default select example">
						<option value="0" ${selectstop}>Dừng hoạt động</option>
						<option value="1" ${selectactive}>Đang hoạt động</option>
					</select>
				</div>
			</div>
			
			<div class="text-center">
				<button type="button" class="btn btn-primary" id="adduser">Save</button>
				<button type="reset" class="btn btn-secondary" id="reset">Reset</button>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="confirm" tabindex="-1" aria-hidden="true">
				<div class="modal-dialog">
				    <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title">Xác nhận</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					    </div>
					    <div class="modal-body">
					        <h6>${noticetext}</h6>
					    </div>
					    <div class="modal-footer">
					        <button type="submit" class="btn btn-primary">Xác nhận</button>
					        <a href="${pageContext.request.contextPath}/ListUser">
					        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
					        </a>
					    </div>
				    </div>
				</div>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="resetpass" tabindex="-1" aria-hidden="true">
				<div class="modal-dialog">
				    <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title">Xác nhận</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					    </div>
					    <div class="modal-body">
					        <h6>Mật khẩu mới sẽ được tạo tự động và gửi tới user qua email!</h6>
					    </div>
					    <div class="modal-footer">
						    <a href="${pageContext.request.contextPath}/ResetPassword?id=${user.accountId}">
						        <button type="button" class="btn btn-primary">Xác nhận</button>
						    </a>
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
					    </div>
				    </div>
				</div>
			</div>					
		</form>
	</div>
</div>
<div class="fo text-center border-top pt-2">
	<p>© 2021 all rights reserved.</p>
</div>
</main>
</div>
</div>

<script type="text/javascript">
	var editor = CKEDITOR.replace('content');
	CKFinder.setupCKEditor(editor,
			'${pageContext.request.contextPath}/libraries/ckfinder/');
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/script/dash-scripts.js"></script>
</body>
</html>