<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- Header -->
<jsp:include page="../dash-header.jsp" />
<!-- Dash content -->
<div class="container-fluid px-4 tbl">
	<form method="post" action="${pageContext.request.contextPath}/DeleteCampaignRecord">
		<div class="table-heading">
			<div>
				<h4 class="mt-4 mb-2">Danh sách quyên góp</h4>
				<p id="test"></p>
			</div>
			<div class="add-button">
				<button type="button" id="delbutton" class="btn btn-sm btn-outline-secondary" data-bs-toggle="tooltip" data-bs-placement="left" title="Xóa nhiều dòng">
					<span><i class="fas fa-minus-circle"></i></span> Xóa
				</button>
			</div>
		</div>

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> Danh sách quyên góp
			</div>
			<div class="card-body table-responsive">
				<table id="datatable">
					<thead>
						<tr>
							<th>ID</th>
							<th class="camp-title">Tên chiến dịch</th>
							<th>Số tiền</th>
							<th>Ngày</th>
							<th>Họ tên</th>
							<th>Số ĐT</th>
							<th>Phương thức</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${campaignRecordList}" var="c">
							<tr>
								<td class="d-flex">
									<div class="pe-1">
										<input class="mybox" type="checkbox" name="cbox" value="${c.recordId}">
									</div> ${c.recordId}
								</td>
								<td>${c.campaignName}</td>
								<td><fmt:formatNumber type = "number" value = "${c.amount}"/></td>
								<td>${c.donationDate}</td>
								<td class="text-capitalize">${c.lastName} ${c.firstName} </td>
								<td>${c.mobile}</td>
								<td class="text-capitalize">${c.method}</td>
								<td>${c.status}</td>
								<th>
									<div class="text-center d-flex">
										<c:url value="/ModifyCampaignRecord" var="modifyid">
											<c:param name="id" value="${c.recordId}"></c:param>
										</c:url>
										<a href="${modifyid}"> <i class="far fa-edit me-2"></i></a>
										<c:url value="/DeleteCampaignRecord" var="deleteid">
											<c:param name="id" value="${c.recordId}"></c:param>
										</c:url>
										<a class="delete" data-bs-toggle="modal" data-bs-target="#del-${c.recordId}" href=""> <i class="far fa-trash-alt"></i></a>				
										<div class="modal fade" id="del-${c.recordId}" tabindex="-1" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Xác nhận</h5>
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<h5>Bạn có chắc muốn xóa quyên góp số ${c.recordId}?</h5>
														<p class="text-muted fw-light fs-6">Lưu ý: dữ liệu đã xóa không thể lấy lại được.</p>
													</div>
													<div class="modal-footer">
														<a href="${deleteid}">
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
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>Bạn đang chọn xóa các quyên góp số: <span class="fw-bold" id="idnotice"></span></p>
						<h6><span class="text-danger">Lưu ý:</span> Dữ liệu bị xóa không thể lấy lại được. Chọn xác nhận để tiếp tục xóa.</h6>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Xác nhận</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Hủy</button>
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
						<h5>Bạn chưa chọn quyên góp nào để xóa.</h5>
						<p class="text-muted">Hướng dẫn: tích chọn checkbox tương ứng các quyên góp cần xóa.</p>
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