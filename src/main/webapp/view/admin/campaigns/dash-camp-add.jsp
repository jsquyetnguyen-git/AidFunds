<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

	<!-- Header -->
	<jsp:include page="../dash-header.jsp" />
	<!-- Dash content -->
                <div class="container-fluid px-4 tbl">
					<c:choose>
					    <c:when test="${function.equals('modify')}">
					    	<c:set var="url" value="ModifyCampaign"/>
					    	<c:set var="heading" value="Chỉnh sửa chiến dịch"/>
					    </c:when>    
					    <c:otherwise>
							<c:set var="url" value="AddCampaign"/>
							<c:set var="heading" value="Thêm chiến dịch mới"/>
					    </c:otherwise>
					</c:choose>
                    <div class="table-heading">
                        <div>
                            <h4 class="mt-4 mb-4">${heading}</h4>
                        </div>
                        <div class="form-notice text-danger">
                        	<p ></p>
                        </div>
						<div id="lert"></div>
                    </div>		
                    <div class="card mb-4 addcamp">
                        <form id="add" class="row g-3 p-2" method="post" action="${pageContext.request.contextPath}/${url}">
                            <div class="col-12">				
                                <label for="title" class="form-label">Tiêu đề chiến dịch</label>
                                <input type="text" class="form-control form-control-sm" id="title" name="title" value="${camp.title}">
                                <input type="hidden" name="id" value="${camp.campaignId}">                             
                            </div>
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="col-12 mt-1">
                                        <label for="discription" class="form-label">Mô tả chiến dịch</label>
                                        <textarea class="form-control form-control-sm" id="discription" name="discription" rows="8">${camp.description}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-6 mt-1">
                                        <label for="startdate">Ngày bắt đầu</label>
                                        <input class="form-control form-control-sm mt-2" type="date" id="startdate" name="startdate" value="${camp.startDate}">
                                    </div>
                                    <div class="col-md-6 mt-1">
                                        <label for="enddate">Ngày kết thúc</label>
                                        <input class="form-control form-control-sm mt-2" type="date" id="enddate" name="enddate" value="${camp.endDate}">
                                    </div>
                                    <div class="col-md-6 mt-1 pt-2">
										<label for="targetmoney" class="form-label">Số tiền mục tiêu</label>
                                        <input type="text" class="form-control form-control-sm money" id="targetmoney" name ="targetmoney" value="${camp.targetMoney}">
                                    </div>
                                    <div class="col-md-6 mt-1 pt-2">
                                  		<c:choose>
											<c:when test="${camp.status.equals('Sắp diễn ra')}">
												<c:set var="select1" value="selected" />
											</c:when>
											<c:when test="${camp.status.equals('Đang diễn ra')}">
												<c:set var="select2" value="selected" />
											</c:when>
											<c:otherwise>
												<c:set var="select3" value="selected" />
											</c:otherwise>
										</c:choose>
                                    	<label class="form-label">Chọn trạng thái</label>
										<select class="form-select form-select-sm" name="status" id="status">
										  <option ${select1} value="Sắp diễn ra">Sắp diễn ra</option>
										  <option ${select2} value="Đang diễn ra">Đang diễn ra</option>
										  <option ${select3} value="Đã kết thúc">Đã kết thúc</option>
										</select>
                                    </div>
                                    <div class="col-md-12 mt-2">
										<label for="uploadimage" class="form-label">Hình ảnh</label>
										<div class="input-group input-group-sm">
										  <span class="input-group-text" id="uploadimage"><a href="#" class="text-decoration-none text-dark">Chọn ảnh</a></span>
										  <input type="text" class="form-control" name="image" id="image" value="${camp.image}">
										</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 mt-4">
                                <label for="content" class="form-label">Nội dung bài viết</label>
                                <textarea class="form-control" id="content" name = "content" rows="10">${camp.content}</textarea>
                            </div>
                            <div class="col-12 mt-4">
								<button type="button" class="btn btn-primary" id="save">Save</button>
                                <button type="reset" class="btn btn-secondary" id="reset">Reset</button>
                            </div>
		                   <c:choose>
							    <c:when test="${function.equals('modify')}">
							    	<c:set var="noticetext" value="Xác nhận sửa chiến dịch."/>
							    </c:when>    
							    <c:otherwise>
									<c:set var="noticetext" value="Xác nhận thêm chiến dịch mới."/>
							    </c:otherwise>
							</c:choose>
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
									        <a href="${pageContext.request.contextPath}/ListCampaign">
									        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
									        </a>
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
	    CKFinder.setupCKEditor(editor,'${pageContext.request.contextPath}/libraries/ckfinder/');
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/script/dash-scripts.js"></script>
</body>
</html>