<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>

<!-- Header -->
<jsp:include page="../dash-header.jsp" />
<!-- Dash content -->
<div class="container-fluid px-4 tbl">
	<form method="post"
		action="${pageContext.request.contextPath}/DeleteUser">
		<div class="table-heading">
			<div>
				<h4 class="mt-4 mb-2">Danh sách tài khoản</h4>
				<div class="mb-2">
					Tags:
					<a href="${pageContext.request.contextPath}/ListUser"><span class="badge rounded-pill bg-light text-dark border">Tất cả</span></a>
					<a href="#!"><span class="badge rounded-pill bg-light text-dark border">Admin</span></a>
					<a href="#!"><span class="badge rounded-pill bg-light text-dark border">User</span></a>
				</div>
			</div>
			<div class="add-button">
				<button type="button" id="delbutton" class="btn btn-sm btn-outline-secondary">
					<span><i class="fas fa-minus-circle"></i></span> Xóa
				</button>
				<button type="submit"
					formaction="${pageContext.request.contextPath}/view/admin/users/dash-user-add.jsp"
					class="btn btn-sm btn-outline-secondary">
					<span><i class="fas fa-plus-circle"></i></span> Thêm
				</button>
			</div>
		</div>

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> Danh sách tài khoản
			</div>
			<div class="card-body table-responsive">
				<table id="datatable">
					<thead>
						<tr>
							<th>Account Id</th>
							<th>Tên</th>
							<th>Email</th>
							<th>Mobile</th>
							<th>Giới tính</th>
							<th>Ngày đăng ký</th>
							<th>Vai trò</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList}" var="u">
							<tr>
								<td class="d-flex">
									<div class="pe-1">
										<input type="checkbox" name="cbox" value="${u.accountId}">
									</div> ${u.accountId}
								</td>
								<td class="text-capitalize">
									${u.lastName} ${u.firstName}
								</td>
								<td>${u.email}</td>
								<td>${u.phoneNumber}</td>
								<td>
									<c:if test="${u.gender==0}">Nam</c:if>
									<c:if test="${u.gender==1}">Nữ</c:if>
								</td>
								<td>${u.registerdate}</td>
								<td>
									<c:if test="${u.admin==0}">User</c:if>
									<c:if test="${u.admin==1}">Admin</c:if>
								</td>
								<td>
									<c:if test="${u.status==0}">Dừng hoạt động</c:if>
									<c:if test="${u.status==1}">Đang hoạt động</c:if>
								</td>
								<th>
									<div class="text-center d-flex">
										<c:url value="/ModifyUser" var="modifyid">
											<c:param name="id" value="${u.accountId}"></c:param>
										</c:url>
										<c:url value="/DeleteUser" var="del">
											<c:param name="id" value="${u.accountId}"></c:param>
										</c:url>

										<a href="${modifyid}"> <i class="far fa-edit me-2"></i></a>
										<a class="delete" data-bs-toggle="modal" data-bs-target="#del-${u.accountId}" href=""> <i class="far fa-trash-alt"></i></a>
										<div class="modal fade" id="del-${u.accountId}" tabindex="-1" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Xác nhận</h5>
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<h5>Bạn có chắc muốn xóa user số ${u.accountId}?</h5>
														<p class="text-muted fw-light fs-6">Lưu ý: dữ liệu đã xóa không thể lấy lại được.</p>
													</div>
													<div class="modal-footer">
														<a href="${del}">
															<button type="button" class="btn btn-primary">Xác nhận</button>
														</a>
														<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</th>
							</tr>
						</c:forEach>					
					</tbody>
				</table>
			</div>
		</div>

		<!-- Delete confirmation modal -->
		<div class="modal fade" id="confirm" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Xác nhận</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>Bạn đang chọn xóa các tài khoản số: <span class="fw-bold" id="idnotice"></span></p>
						<h6><span class="text-danger">Lưu ý:</span> Dữ liệu bị xóa không thể lấy lại được. Chọn xác nhận để tiếp tục xóa.</h6>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Xác nhận</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
					</div>
				</div>
			</div>
		</div>
		<!-- notice modal -->
		<div class="modal fade" id="delnotice" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Thông báo</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<h5>Bạn chưa chọn user nào để xóa.</h5>
						<p class="text-muted">Hướng dẫn: chọn checkbox tương ứng user cần xóa.</p>
						<img alt="" src="/CKFinderJava/userfiles/images/common/Screenshot_5.png">
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<div class="fo text-center border-top pt-2">
	<p>© 2021 all rights reserved.</p>
</div>
</main>
</div>
</div>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/script/dash-scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/script/datatables.js"></script>

</body>
</html>