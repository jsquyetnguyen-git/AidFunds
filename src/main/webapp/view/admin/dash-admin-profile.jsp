<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Header -->
<jsp:include page="./dash-header.jsp" />
<!-- Dash content -->
<div class="container-fluid px-4 tbl">
	<div class="table-heading">
		<div>
			<h4 class="mt-4 mb-4">${heading}</h4>
		</div>
		<div id="lert"></div>
	</div>

	<div class="card mb-4 addcamp">
		<div class="card-header mb-4">Thông tin tài khoản admin</div>
		<form id="add" class="row g-3 p-2" method="post" action="${pageContext.request.contextPath}/ChangeProfileController">
			<div class="d-flex">
			<div class="mb-2">
				<c:choose>
					<c:when test="${empty userlogging.avatar}">
						<c:set var="avatar" value="/CKFinderJava/userfiles/images/avatar/unnamed_150x200.jpg" />
					</c:when>
					<c:otherwise>
						<c:set var="avatar" value="${userlogging.avatar}" />
					</c:otherwise>
				</c:choose>
			  <img class="border ms-1" alt="avatar" src="${avatar}" style="height:200px"/>
			</div>
			<div id="lert" class="ms-5"></div>
			</div>
			<button style="width:80px" type="button" class="btn btn-secondary btn-sm ms-5" data-bs-toggle="modal" data-bs-target="#changeavatar">Thay ảnh</button>
			<input type="hidden" class="form-control" id="id" name="id" value="${userlogging.accountId}">
			<div class="mb-2 mt-3 row">
				<label for="email" class="col-4 col-md-2 col-form-label">Email</label>
				<div class="col-8 col-md-10">
					<input type="text" readonly class="form-control" id="email" name="email" value="${userlogging.email}">
				</div>
			</div>
			<div class="mb-2 mt-3 row">
				<label for="password" class="col-4 col-md-2 col-form-label">Mật khẩu</label>
				<div class="col-4 col-md-2">
					<input type="password" readonly class="form-control form-control-sm"
						id="password" name="password" value="${userlogging.password}">
				</div>
				<div class="col-4 col-md-8 ${display}">
					<a href="${pageContext.request.contextPath}/HomeController?action=change">
						<button type="button" class="btn btn-sm btn-light rounded-pill">Đổi mật khẩu</button>
					</a>
				</div>
			</div>
			<div class="mb-2 mt-2 row">
				<label for="avatar" class="col-4 col-md-2 col-form-label">Ảnh đại diện</label>
				<div class="col-8 col-md-10">
					<div class="input-group input-group-sm">
					  <span class="input-group-text" id="uploadimage"><a href="#" class="text-decoration-none text-dark">Chọn ảnh</a></span>
					  <input type="text" class="form-control" name="avatar" id="image" value="${userlogging.avatar}">
					</div>
				</div>
			</div>
			<div class="mb-2 mt-3 row">
				<label for="firstname" class="col-4 col-md-2 col-form-label">Tên</label>
				<div class="col-8 col-md-10 text-capitalize">
					<input type="text" class="form-control name" id="firstname" name="firstname" value="${userlogging.firstName}">
				</div>
			</div>
			<div class="mb-2 mt-3 row">
				<label for="lastname" class="col-4 col-md-2 col-form-label">Họ</label>
				<div class="col-8 col-md-10 text-capitalize">
					<input type="text" class="form-control name" id="lastname" name="lastname" value="${userlogging.lastName}">
				</div>
			</div>
			<div class="mb-2 mt-3 row">
				<label for="gender" class="col-4 col-md-2 col-form-label">Giới
					Tính</label>
				<div class="col-8 col-md-10">
					<c:choose>
						<c:when test="${userlogging.gender == 1}">
							<c:set var="male" value="selected" />
						</c:when>
						<c:otherwise>
							<c:set var="female" value="selected" />
						</c:otherwise>
					</c:choose>
					<select class="form-select" id="gender" name="gender">
						<option value="0" ${female}>Nữ</option>
						<option value="1" ${male}>Nam</option>
					</select>
				</div>
			</div>
			<div class="mb-2 mt-3 row ${display}">
				<label for="registerDate" class="col-4 col-md-2 col-form-label">Ngày đăng ký</label>
				<div class="col-8 col-md-10">
				<input type="text" readonly class="form-control" id="registerDate" name="registerDate" value="${userlogging.registerdate}">
				</div>
			</div>
			<div class="mb-2 mt-3 row">
				<label for="phonenumber" class="col-4 col-md-2 col-form-label">Số điện thoại</label>
				<div class="col-8 col-md-10">
					<input type="text" class="form-control" id="phonenumber" name="phonenumber" value="${userlogging.phoneNumber}">
				</div>
			</div>
			<div class="text-center">
				<button type="button" class="btn btn-primary" id="saveadminprofile">Save</button>
				<button type="reset" class="btn btn-secondary">Reset</button>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="changeadminprofile" tabindex="-1" aria-hidden="true">
				<div class="modal-dialog">
				    <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title">Xác nhận</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					    </div>
					    <div class="modal-body">
					        <h6>Nhấn xác nhận để thay đổi thông tin.</h6>
					    </div>
					    <div class="modal-footer">
					        <button type="submit" class="btn btn-primary">Xác nhận</button>
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
					    </div>
				    </div>
				</div>
			</div>
   		</form>
   		
   		<!-- Change avatar -->
   		<form method="post" action="${pageContext.request.contextPath}/ChangeAvatar" enctype="multipart/form-data">
		<div class="modal fade" id="changeavatar" tabindex="-1" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Chọn ảnh</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<p class="text-danger" id="avatarerror"></p>
		        <input class="form-control form-control-sm mb-3" id="avatar" name="avatar" type="file" accept="image/*">
		        <input type="hidden" class="form-control" name="id" value="${userlogging.accountId}">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
		        <button type="submit" id="submitavatar" class="btn btn-primary">Xác nhận</button>
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