<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

	<!-- Header -->
	<jsp:include page="../dash-header.jsp" />
	<!-- Dash content -->
                <div class="container-fluid px-4 tbl">
                    <div class="table-heading">
                        <div>
                            <h4 class="mt-4 mb-4">Chỉnh sửa quyên góp</h4>
                        </div>
                        <div class="form-notice text-danger">
                        	<p ></p>
                        </div>
						<div id="lert"></div>
                    </div>		
                    <div class="card mb-4 addcamp">
			             <form class="row g-3 p-4" method="post" action="${pageContext.request.contextPath}/ModifyCampaignRecord">
							<div class="mb-2 mt-2 row">
								<label for="recordid" class="col-4 col-md-2 col-form-label">ID</label>
								<div class="col-8 col-md-10">
									${camprecord.recordId}
								</div>
							</div>

							<div class="mb-2 mt-2 row">
								<label class="col-4 col-md-2 col-form-label">Tên chiến dịch</label>
								<div class="col-8 col-md-10">
									${camprecord.campaignName}
								</div>
							</div>
							<div class="mb-2 mt-2 row">
								<label class="col-4 col-md-2 col-form-label">Số tiền</label>
								<div class="col-8 col-md-10 text-capitalize">
									<fmt:formatNumber type = "number" value = "${camprecord.amount}"/>
									VND
								</div>
							</div>
							<div class="mb-2 mt-2 row">
								<label class="col-4 col-md-2 col-form-label">Ngày</label>
								<div class="col-8 col-md-10">
									${camprecord.donationDate}
								</div>
							</div>
							<div class="mb-2 mt-2 row">
								<label class="col-4 col-md-2 col-form-label">Họ tên</label>
								<div class="col-8 col-md-10 text-capitalize">
									${camprecord.lastName} ${camprecord.firstName}
								</div>
							</div>
							<div class="mb-2 mt-2 row">
								<label class="col-4 col-md-2 col-form-label">Số điện thoại</label>
								<div class="col-8 col-md-10">
									${camprecord.mobile}
								</div>
							</div>
							<div class="mb-2 mt-2 row">
								<label class="col-4 col-md-2 col-form-label">Phương thức</label>
								<div class="col-8 col-md-10">
									${camprecord.method}
								</div>
							</div>
							
							<div class="mb-2 mt-2 row">
								<label class="col-4 col-md-2 col-form-label">Trạng thái</label>
								<div class="col-8 col-md-10">
								<c:choose>
									<c:when test="${camprecord.status.equals('Thất bại')}">
										<c:set var="select3" value="selected" />
									</c:when>
									<c:when test="${camprecord.status.equals('Thành công')}">
										<c:set var="select2" value="selected" />
									</c:when>
									<c:otherwise>
										<c:set var="select1" value="selected" />
									</c:otherwise>
								</c:choose>
								<select class="form-select" id="status" name="status" aria-label="Default select example">
									<option value="Đang xác nhận" ${select1}>Đang xác nhận</option>
									<option value="Thành công" ${select2}>Thành công</option>
									<option value="Thất bại" ${select3}>Thất bại</option>
								</select>
								</div>
							</div>
							<input type="hidden" name="recordid" value="${camprecord.recordId}"/>
							<input type="hidden" name="campaignid" value="${camprecord.campaignId}"/>
							<input type="hidden" name="campaignname" value="${camprecord.campaignName}"/>
							<input type="hidden" name="email" value="${camprecord.email}"/>
							<input type="hidden" name="name" value="${camprecord.firstName}"/>
							<div class="text-center mb-5">
								<button type="submit" class="btn btn-primary">Save</button>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/script/dash-scripts.js"></script>
</body>
</html>