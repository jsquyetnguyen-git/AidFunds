<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- Header -->
<jsp:include page="../dash-header.jsp" />
<!-- Dash content -->
<div class="container-fluid px-4 tbl">
	<form method="post" action="${pageContext.request.contextPath}/DeleteCampaign">
		<div class="table-heading">
			<div>
				<h4 class="mt-4 mb-2">Danh sách chiến dịch</h4>
				<p id="test"></p>
				<div class="mb-2">
					Tags:
					<a href="${pageContext.request.contextPath}/ListCampaign"><span class="badge rounded-pill bg-light text-dark border">Tất cả</span></a>
					<a href="${pageContext.request.contextPath}/ListCampaign?object=upcoming"><span class="badge rounded-pill bg-light text-dark border">Sắp diễn ra</span></a>
					<a href="${pageContext.request.contextPath}/ListCampaign?object=active"><span class="badge rounded-pill bg-light text-dark border">Đang diễn ra</span></a>
					<a href="${pageContext.request.contextPath}/ListCampaign?object=completed"><span class="badge rounded-pill bg-light text-dark border">Đã kết thúc</span></a>
				</div>
			</div>
			<div class="add-button">
				<button type="button" id="delbutton" class="btn btn-sm btn-outline-secondary" data-bs-toggle="tooltip" data-bs-placement="left" title="Xóa nhiều dòng">
					<span><i class="fas fa-minus-circle"></i></span> Xóa
				</button>
				<button type="submit"
					formaction="${pageContext.request.contextPath}/view/admin/campaigns/dash-camp-add.jsp"
					class="btn btn-sm btn-outline-secondary" data-bs-toggle="tooltip" data-bs-placement="left" title="Thêm chiến dịch mới">
					<span><i class="fas fa-plus-circle"></i></span> Thêm
				</button>
			</div>
		</div>

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> Danh sách chiến dịch
			</div>
			<div class="card-body table-responsive">
				<table id="datatable">
					<thead>
						<tr>
							<th>ID</th>
							<th class="camp-title">Tên</th>
							<th>Bắt đầu</th>
							<th>Kết thúc</th>
							<th>Mục tiêu</th>
							<th>Hiện tại</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${campaignList}" var="c">
							<tr>
								<td class="d-flex">
									<div class="pe-1">
										<input class="mybox" type="checkbox" name="cbox" value="${c.campaignId}">
									</div> ${c.campaignId}
								</td>
								<td>${c.title}</td>
								<td>${c.startDate}</td>
								<td>${c.endDate}</td>
								<td><fmt:formatNumber type = "number" value = "${c.targetMoney}"/></td>
								<td><fmt:formatNumber type = "number" value = "${c.currentMoney}"/></td>
								<td>${c.status}</td>
								<th>
									<div class="text-center d-flex">
										<c:url value="/ModifyCampaign" var="modifyid">
											<c:param name="id" value="${c.campaignId}"></c:param>
										</c:url>
										<a href="${modifyid}"> <i class="far fa-edit me-2"></i></a>
										<c:url value="/DeleteCampaign" var="deleteid">
											<c:param name="id" value="${c.campaignId}"></c:param>
										</c:url>
										<a class="delete" data-bs-toggle="modal" data-bs-target="#del-${c.campaignId}" href=""> <i class="far fa-trash-alt"></i></a>				
										<div class="modal fade" id="del-${c.campaignId}" tabindex="-1" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Xác nhận</h5>
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<h5>Bạn có chắc muốn xóa chiến dịch số ${c.campaignId}?</h5>
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
						<p>Bạn đang chọn xóa các chiến dịch số: <span class="fw-bold" id="idnotice"></span></p>
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
						<h5>Bạn chưa chọn chiến dịch nào để xóa.</h5>
						<p class="text-muted">Hướng dẫn: chọn checkbox tương ứng chiến dịch cần xóa.</p>
						<img alt="" src="/CKFinderJava/userfiles/images/common/hd.png">
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