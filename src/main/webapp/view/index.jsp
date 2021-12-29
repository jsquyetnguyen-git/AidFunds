<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- Header -->
	<c:import url="header.jsp">
		<c:param name="pagetitle" value="Trang chủ"></c:param>
	</c:import>

    <!-- Masthead-->
	<body id="page-top">
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/HomeController">
                <img src="${pageContext.request.contextPath}/media/logo/logo.png" alt="logo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
           		aria-expanded="false" aria-label="Toggle navigation">Menu<i class="fas fa-bars ms-1"></i></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto py-4 py-lg-0">
                    <li class="nav-item fw-bolder"><a class="nav-link" href="${pageContext.request.contextPath}/HomeController">Trang chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="#camp">Chương trình</a></li>
                    <li class="nav-item"><a class="nav-link" href="#about">Về chúng tôi</a></li>
                    <li class="nav-item"><a class="nav-link" href="#faq">FAQ</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Liên hệ</a></li>
                    <c:choose>
					    <c:when test="${empty userlogging}">
					    	<c:set var="login" value=""/>
					    	<c:set var="username" value="d-none"/>
					    </c:when>    
					    <c:otherwise>
					    	<c:set var="login" value="d-none"/>
							<c:set var="username" value=""/>
					    </c:otherwise>
					</c:choose>
					<c:if test="${userlogging.admin==1}">
						<c:set var="display" value="d-none" />
					</c:if>
                    <li class="nav-item ${login}"><a class="nav-link" href="${pageContext.request.contextPath}/HomeController?action=login">Đăng nhập</a></li>               
                    <div>
						<ul class="navbar-nav me-2 mt-2 ${username}">
							<li class="nav-item dropdown">
					          <a class="nav-link dropdown-toggle pt-0 text-uppercase" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
					          aria-expanded="false"><span class="me-1"><i class="far fa-user-circle"></i></span>${userlogging.firstName}</a>
					          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					            <li><a class="dropdown-item ${display}"  href="${pageContext.request.contextPath}/view/user/user-profile.jsp"><i class="fas fa-users-cog me-1"></i>Hồ sơ</a></li>
					            <li><a class="dropdown-item ${display}"  href="${pageContext.request.contextPath}/HistoryDonationController?id=${userlogging.accountId}">
					            	<i class="fas fa-history me-2"></i>Lịch sử quyên góp</a></li>
					            <li><a class="dropdown-item ${display}" href="${pageContext.request.contextPath}/HomeController?action=change"><i class="fas fa-sync me-2"></i>Đổi mật khẩu</a></li>
					            <li><hr class="dropdown-divider"></li>
					            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/HomeController?action=logout"><i class="far fa-share-square me-2"></i>Đăng xuất</a></li>
					          </ul>
					        </li>
						</ul>
                    </div>
                </ul>
            </div>
        </div>
    </nav>
    <header class="masthead">
        <div class="container">
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <div class="quote">Phép chia luôn làm cho mọi thứ ít đi, duy chỉ có “chia sẻ yêu thương” sẽ được nhân lên gấp bội.</div>
                    <a class="btn btn-primary rounded-pill mt-3 down-cv" href="#camp"><i class="fas fa-hand-holding-usd me-1"></i>Quyên góp ngay</a>
                </div>
            </div>
        </div>
    </header>

    <!-- Camp Grid-->
    <section class="page-section bg-light" id="camp">
        <div class="container px-xl-5">
            <div class="text-center sect mb-5">
                <h2 class="section-heading">Chương trình gây quỹ</h2>
                <img src="${pageContext.request.contextPath}/media/images/br.png">
            </div>
            <div class="row" id="camplist">
            	<c:forEach items="${campList}" var="cl">
            	 	<div class="col-lg-4 col-sm-6 mb-4 test">
           	     		<div class="card campcard">
           	     			<a href="${pageContext.request.contextPath}/ViewMoreController?campid=${cl.campaignId}">
	                        	<img class="card-img-top" src="${pageContext.request.contextPath}/media/images/icon/loading.svg" lazyload-src="${cl.image}">
	                        </a>
	                        <div class="card-body">
	                        	<a class="text-decoration-none" href="${pageContext.request.contextPath}/ViewMoreController?campid=${cl.campaignId}">
	                            	<h4 class="camp-cap mt-2">${cl.title}</h4>
	                            </a>
	                            <p class="camp-sumary mt-3">${cl.description}</p>
	                            <div class="camp-status mt-3"><span><i class="far fa-question-circle"></i></span> Trạng thái: ${cl.status}</div>
	                            <div class="camp-status mt-1"><span><i class="far fa-clock"></i></span> Còn lại: ${cl.duration} ngày (${cl.startDate} - ${cl.endDate})</div>
								<c:set var="phantram" value="${Math.ceil(cl.currentMoney*100/cl.targetMoney)}"/>
	                            <div class="progress mt-3">
								  <div class="progress-bar" role="progressbar" style="width: ${phantram}%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">${phantram}%</div>
								</div>
								<div class="text-center camp-status">
									<fmt:formatNumber type = "number" value = "${cl.currentMoney}"/>/<fmt:formatNumber type = "number" value = "${cl.targetMoney}"/>
								</div>				
	                        </div>
	                    </div>
                    </div>
            	</c:forEach>
            	<div class="text-center">
            		<button id="loadMore" type="button" class="btn btn-outline-dark rounded-pill me-1"><span><i class="fas fa-caret-down"></i></span> Xem thêm</button>
            		<button id="showLess" type="button" class="btn btn-outline-dark rounded-pill ms-1 pe-3 ps-3"><span><i class="fas fa-caret-up"></i></span> Thu gọn</button>
            	</div>    
            </div>
         </div>
    </section>
    <section class="page-section">
        <div class="container px-xl-5">
            <div class="row mt-5">
                <div class="text-center sect mb-5">
                    <h2 class="section-heading">Chương trình sắp diễn ra</h2>
                    <img src="${pageContext.request.contextPath}/media/images/br.png">
                </div>
                <c:forEach items="${upcomingList}" var="ucl" begin="0" end="1">
	                <div class="col-md-6">
	                    <div class="card campcard">
	                    	<a href="${pageContext.request.contextPath}/ViewMoreController?campid=${ucl.campaignId}">
	                        	<img class="card-img-top" src="${pageContext.request.contextPath}/media/images/icon/loading.svg" lazyload-src="${ucl.image}">
	                        </a>
	                        <div class="card-body">
	                        	<a class="text-decoration-none" href="${pageContext.request.contextPath}/ViewMoreController?campid=${ucl.campaignId}">
	                            	<h4 class="camp-cap mt-2">${ucl.title}</h4>
	                        	</a>
	                            <p class="camp-sumary mt-3">${ucl.description}</p>
	                            <div class="camp-status mt-2"><span><i class="far fa-clock"></i></span> Diễn ra trong: ${ucl.duration} ngày</div>
	                            <div class="camp-status mt-1 mb-3"><span><i class="fas fa-hand-holding-usd"></i></span> Số tiền cần quyên góp: 1.900.000.000đ</div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <section class="page-section" id="about">
        <div class="continer-fluid">
            <div class="row">
                <div class="col-md-6 pe-0 about-left"></div>
                <div class="col-md-6 about-right bg-dark">
                    <div class="about-heading">
                        <h4>Về chúng tôi</h4>
                        <p class="mine-icon"><span><i class="far fa1 fa-window-minimize"></i><i class="far fa1 fa-window-minimize"></i>
                            <i class="far fa1 fa-window-minimize"></i></span></p>
                    </div>
                    <div class="about-content">
                        <dl class="row">
                            <dt class="col-1 about-icon"><i class="fas fa-history"></i></dt>
                            <dd class="col-11">
                                <p class="mb-1">Lịch sử</p>
                                <p class="about-text">AidFunds được thành lập năm 2018.</p>
                            </dd>
                            <dt class="col-1 about-icon"><i class="fas fa-dove"></i></dt>
                            <dd class="col-11">
                                <p class="mb-1">Sứ mệnh</p>
                                <p class="about-text">Giúp trẻ em Việt Nam có hoàn cảnh khó khăn, đặc biệt trẻ em vùng cao được tiếp cận giáo dục và có sự khởi đầu tốt hơn
                                trong cuộc sống. Chúng tôi tin rằng giáo dục chính là chìa khóa mang đến những thay đổi tích cực cho
                                các em sau này.</p>
                            </dd>
                            <dt class="col-1 about-icon"><i class="far fa-compass"></i></dt>
                            <dd class="col-11">
                                <p class="mb-1">Tầm nhìn</p>
                                <p class="about-text">Chúng tôi không ngừng mở rộng và phát triển với mong muốn có thể hỗ trợ cho trẻ em nghèo trên khắp lãnh thổ việt nam.</p>
                            </dd>
                        </dl>
                    </div>
                    <div class="text-center mb-5">
                        <a class="btn btn-outline-light rounded-pill" href="">Đồng hành cùng chúng tôi</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="page-section top-donators">
        <div class="container topdonor">
            <div class="row">
                <div class="text-center sect mb-5">
                    <h2 class="section-heading">Vinh danh các nhà tài trợ tiêu biểu</h2>
                    <img src="${pageContext.request.contextPath}/media/images/br.png">
                </div>
                <div>
                    <div class="row">
	                    <c:forEach items="${topDonor}" var="t">
							<c:choose>
								<c:when test="${empty t.avatar}">
									<c:set var="avatar" value="/CKFinderJava/userfiles/images/avatar/unnamed_150x200.jpg" />
								</c:when>
								<c:otherwise>
									<c:set var="avatar" value="${t.avatar}" />
								</c:otherwise>
							</c:choose>
                        <div class="col-6 col-md-3 mt-2">
                            <div class="card">
                                <img class="card-img-top topdonoravatar" src="${pageContext.request.contextPath}/media/images/icon/loading.svg" lazyload-src="${avatar}">
                                <div class="card-body text-center">
                                    <p class="topdonnorname text-capitalize">${t.lastName} ${t.firstName}</p>
                                </div>
                            </div>
                        </div>    
                    </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="summary d-flex align-items-center">
        <div class="container">
            <div class="row text-center sum">
                <div class="col-4">
                    <div class="col1">
                        <p class="sum-value">${campcount}</p>
                        <p>Chiến dịch</p>
                    </div>
                </div>
                <div class="col-4">
                    <div class="col2">
                        <p class="sum-value">${usercount}</p>
                        <p>Thành viên</p>
                    </div>
                </div>
                <div class="col-4">
                    <div class="col3">
                        <p class="sum-value"><fmt:formatNumber type = "number" value = "${total.amout/1000000}"/>tr VND</p>
                        <p>Đã quyên góp</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="page-section bg-light">
        <div class="container">
            <div class="text-center sect mb-5">
                <h2 class="section-heading">Tình nguyện viên tiêu biểu</h2>
                <img src="${pageContext.request.contextPath}/media/images/br.png">
            </div>
            <div class="row justify-content-center">
                <div class="col-6 col-sm-5 col-md-3">
                    <div class="card">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/media/images/icon/loading.svg"
                        	lazyload-src="/CKFinderJava/userfiles/images/avatar/ava_4.png">
                        <div class="card-body">
                            <h4 class="camp-cap mt-2">Nguyễn Văn Quyết</h4>
                            <p class="camp-sumary mt-3">Kỹ sư</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-sm-5 col-md-3">
                    <div class="card">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/media/images/icon/loading.svg"
                        	lazyload-src="/CKFinderJava/userfiles/images/avatar/boy.jpg">
                        <div class="card-body">
                            <h4 class="camp-cap mt-2">Đinh Văn Đạt</h4>
                            <p class="camp-sumary mt-3">Luật sư</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="page-section bg-dark text-light" id="faq">
        <div class="container">
            <div class="text-center sect mb-5">
                <h2 class="section-heading">FAQ - Câu hỏi thường gặp</h2>
                <img src="${pageContext.request.contextPath}/media/images/br.png">
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="accordion accordion-flush">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingOneL">
                                <button class="accordion-button bg-dark text-light collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOneL"
                                	aria-expanded="false" aria-controls="flush-collapseOne">
					        <p class="question text-uppercase"><span class="faq-icon"><i class="far fa-question-circle"></i></span>Aidfunds hoạt động ở những nơi nào?</p>
					      </button>
                            </h2>
                            <div id="flush-collapseOneL" class="accordion-collapse collapse" aria-labelledby="flush-headingOneL" data-bs-parent="#accordionF">
                                <div class="accordion-body bg-dark">
                                    <p class="answer">Chúng tôi hoạt động tại Hà Nội và các tỉnh lân cận, chủ yếu ở các vùng cao phía Bắc như Hà Giang, Cao Bằng,
                                    Lào Cai, Bắc Kạn, Lạng Sơn, Tuyên Quang, Yên Bái.</p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingTwoL">
                                <button class="accordion-button bg-dark text-light collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwoL"
                                	aria-expanded="false" aria-controls="flush-collapseTwo">
					        <p class="question text-uppercase"><span class="faq-icon"><i class="far fa-question-circle"></i></span>Aidfunds có minh bạch tài chính không?</p>
					      </button>
                            </h2>
                            <div id="flush-collapseTwoL" class="accordion-collapse collapse" aria-labelledby="flush-headingTwoL" data-bs-parent="#accordionF">
                                <div class="accordion-body bg-dark">
                                    <p class="answer">Chúng tôi rất may mắn khi có được những tình nguyện viên nhiều kinh nghiệm, yêu thương trẻ em và làm việc
                                    không hề nhận khoản lương nào. Tài chính hàng tháng đều được minh bạch rõ ràng và được kiểm toán hàng năm bởi
                                    các tổ chức uy tín.</p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingThreeL">
                                <button class="accordion-button bg-dark text-light collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThreeL"
                                	aria-expanded="false" aria-controls="flush-collapseThree">
					        <p class="question text-uppercase"><span class="faq-icon"><i class="far fa-question-circle"></i></span>Tôi có thể tham gia làm tình nguyện viên được không?</p>
					      </button>
                            </h2>
                            <div id="flush-collapseThreeL" class="accordion-collapse collapse" aria-labelledby="flush-headingThreeL" data-bs-parent="#accordionF">
                                <div class="accordion-body bg-dark">
                                    <p class="answer">Chúng tôi rất hoan nghênh vè chào đón mọi người. Hãy liên hệ ngay với chúng tôi để biết thêm chi tiết.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="accordion accordion-flush">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingOneR">
                                <button class="accordion-button bg-dark text-light collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOneR"
                                	aria-expanded="false" aria-controls="flush-collapseOne">
						        <p class="question text-uppercase"><span class="faq-icon"><i class="far fa-question-circle"></i></span>Các chương trình của Aidfunds có hiệu quả không?</p>
						      </button>
                            </h2>
                            <div id="flush-collapseOneR" class="accordion-collapse collapse" aria-labelledby="flush-headingOneR" data-bs-parent="#accordionF">
                                <div class="accordion-body bg-dark">
                                    <p class="answer">Chúng tôi có thể tự hào và trả lời là có. Chúng tôi đã xây dựng được nhiều trường học cho trẻ em vùng cao,
                                    giúp các em có nơi học tập sạch đẹp. Chúng tôi rất vui mừng khi nhìn thấy các em lớn lên từng ngày trong giáo
                                    dục, chúng tôi tập chung vào giáo dục vì chỉ có giáo dục mới thay đổi được cuộc sống của các em.</p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingTwoR">
                                <button class="accordion-button bg-dark text-light collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwoR"
                                	aria-expanded="false" aria-controls="flush-collapseTwo">
						        <p class="question text-uppercase"><span class="faq-icon"><i class="far fa-question-circle"></i></span>Aidfunds lựa chọn các đối tượng hỗ trợ như thế nào?</p>
						      </button>
                            </h2>
                            <div id="flush-collapseTwoR" class="accordion-collapse collapse" aria-labelledby="flush-headingTwoR" data-bs-parent="#accordionF">
                                <div class="accordion-body bg-dark">
                                    <p class="answer">Những trẻ em đươc hỗ trợ sẽ trải qua một quá trình tuyển chọn rất cẩn thận, đội ngũ tình nguyện viên của chúng
                                    tôi ghé thăm nhà các em cũng như thông qua địa phương để đánh giá khách quan nhu cầu cần hỗ trợ của các em.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingThreeR">
                                <button class="accordion-button bg-dark text-light collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThreeR"
                                	aria-expanded="false" aria-controls="flush-collapseThree">
						        <p class="question text-uppercase"><span class="faq-icon"><i class="far fa-question-circle"></i></span>Aidfunds có dự tính mở rộng vùng hỗ trợ không?</p>
						      </button>
                            </h2>
                            <div id="flush-collapseThreeR" class="accordion-collapse collapse" aria-labelledby="flush-headingThreeR" data-bs-parent="#accordionF">
                                <div class="accordion-body bg-dark">
                                    <p class="answer">Đương nhiên vì đó là tầm nhìn, mục tiêu của chúng tôi, mở rộng, lớn mạnh từng ngày để giúp đỡ được nhiều trẻ em hơn.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="page-section">
        <div class="container">
            <div class="text-center sect mb-5 mt-5">
                <h2 class="section-heading">Các công ty đồng hành</h2>
                <img src="${pageContext.request.contextPath}/media/images/br.png">
            </div>
            <div class="row company">
                <div class="col-lg-2 col-md-3 col-4 mt-2">
                    <a href="#"><img class="img-fluid border" lazyload-src="${pageContext.request.contextPath}/media/images/company/1.png"
                    src="${pageContext.request.contextPath}/media/images/icon/loading.svg"></a>
                </div>
                <div class="col-lg-2 col-md-3 col-4 mt-2">
                    <a href="#"><img class="img-fluid border" lazyload-src="${pageContext.request.contextPath}/media/images/company/2.png"
                    src="${pageContext.request.contextPath}/media/images/icon/loading.svg"></a>
                </div>
                <div class="col-lg-2 col-md-3 col-4 mt-2">
                    <a href="#"><img class="img-fluid border" lazyload-src="${pageContext.request.contextPath}/media/images/company/3.png"
                    src="${pageContext.request.contextPath}/media/images/icon/loading.svg"></a>
                </div>
                <div class="col-lg-2 col-md-3 col-4 mt-2">
                    <a href="#"><img class="img-fluid border" lazyload-src="${pageContext.request.contextPath}/media/images/company/4.png"
                    src="${pageContext.request.contextPath}/media/images/icon/loading.svg"></a>
                </div>
                <div class="col-lg-2 col-md-3 col-4 mt-2">
                    <a href="#"><img class="img-fluid border" lazyload-src="${pageContext.request.contextPath}/media/images/company/5.png"
                    src="${pageContext.request.contextPath}/media/images/icon/loading.svg"></a>
                </div>
                <div class="col-lg-2 col-md-3 col-4 mt-2">
                    <a href="#"><img class="img-fluid border" lazyload-src="${pageContext.request.contextPath}/media/images/company/6.png"
                    src="${pageContext.request.contextPath}/media/images/icon/loading.svg"></a>
                </div>
                <div class="col-lg-2 col-md-3 col-4 mt-2">
                    <a href="#"><img class="img-fluid border" lazyload-src="${pageContext.request.contextPath}/media/images/company/7.png"
                    src="${pageContext.request.contextPath}/media/images/icon/loading.svg"></a>
                </div>
                <div class="col-lg-2 col-md-3 col-4 mt-2">
                    <a href="#"><img class="img-fluid border" lazyload-src="${pageContext.request.contextPath}/media/images/company/2.png"
                    src="${pageContext.request.contextPath}/media/images/icon/loading.svg"></a>
                </div>
                <div class="col-lg-2 col-md-3 col-4 mt-2">
                    <a href="#"><img class="img-fluid border" lazyload-src="${pageContext.request.contextPath}/media/images/company/1.png"
                    src="${pageContext.request.contextPath}/media/images/icon/loading.svg"></a>
                </div>
                <div class="col-lg-2 col-md-3 col-4 mt-2">
                    <a href="#"><img class="img-fluid border" lazyload-src="${pageContext.request.contextPath}/media/images/company/2.png"
                    src="${pageContext.request.contextPath}/media/images/icon/loading.svg"></a>
                </div>
                <div class="col-lg-2 col-md-3 col-4 mt-2">
                    <a href="#"><img class="img-fluid border" lazyload-src="${pageContext.request.contextPath}/media/images/company/1.png"
                    src="${pageContext.request.contextPath}/media/images/icon/loading.svg"></a>
                </div>
                <div class="col-lg-2 col-md-3 col-4 mt-2">
                    <a href="#"><img class="img-fluid border" lazyload-src="${pageContext.request.contextPath}/media/images/company/2.png"
                    src="${pageContext.request.contextPath}/media/images/icon/loading.svg"></a>
                </div>
            </div>
        </div>
    </section>

	<!-- Footer -->
	<jsp:include page="footer.jsp"/>