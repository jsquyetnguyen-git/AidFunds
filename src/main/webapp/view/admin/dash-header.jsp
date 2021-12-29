 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Admin</title>

    <link href="${pageContext.request.contextPath}/css/dash-styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Gg fonts-->
	<link href="https://fonts.googleapis.com/css2?family=Carattere&display=swap" rel="stylesheet">
	<link rel="stylesheet" id="quicksand-css" href="//fonts.googleapis.com/css?family=Quicksand%3A300%2Cregular%2C500%2C600%2C700&amp;subset=latin%2Cvietnamese" type="text/css" media="all">

    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://d3a39i8rhcsf8w.cloudfront.net/js/jquery.mask.min.js"></script>
	<!-- ck-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/libraries/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/libraries/ckfinder/ckfinder.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

</head>
<body>
<nav class="sb-topnav navbar navbar-expand navbar-dark fixed-top">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/view/admin/dash-home.jsp"> <img class="logo" src="${pageContext.request.contextPath}/media/logo/logo.png"> </a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <div class="logout d-flex mt-2">
			<ul class="navbar-nav me-2">
				<li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle pt-0 text-uppercase" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Welcome: ${userlogging.firstName}</a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/view/admin/dash-admin-profile.jsp">Cài đặt</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/HomeController?action=logout">Đăng xuất</a></li>
		          </ul>
		        </li>
			</ul>
        </div>
    </nav>

    <div id="dash">
        <div id="col-left">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Dashboard</div>
                        <div class="nav-link">
                            <div class="sb-nav-link-icon"><i class="fab fa-elementor"></i></div>
                            <span class="text-decoration-underline">Chiến dịch</span>
                        </div>
                        <a class="nav-link ms-4" href="${pageContext.request.contextPath}/ListCampaign"><span><i class="fas fa-caret-right me-1"></i></span> Danh sách chiến dịch</a>
                        <a class="nav-link ms-4" href="${pageContext.request.contextPath}/view/admin/campaigns/dash-camp-add.jsp"><span><i class="fas fa-caret-right me-1"></i></span>Thêm chiến dịch</a>
                        <a class="nav-link ms-4" href="${pageContext.request.contextPath}/ListCampaignRecord"><span><i class="fas fa-caret-right me-1"></i></span>Danh sách ủng hộ</a>

                         <div class="nav-link">
                            <div class="sb-nav-link-icon"><i class="fas fa-user-alt"></i></div>
                            <span class="text-decoration-underline">Tài khoản</span>
                        </div>
                        <a class="nav-link ms-4" href="${pageContext.request.contextPath}/ListUser"><span><i class="fas fa-caret-right me-1"></i></span>Danh sách tài khoản</a>
                        <a class="nav-link ms-4" href="${pageContext.request.contextPath}/view/admin/users/dash-user-add.jsp"><span><i class="fas fa-caret-right me-1"></i></span>Thêm tài khoản mới</a>
                    </div>
                </div>
            </nav>
        </div>

        <div id="col-right">
            <main>
                <div class="container-fluid">
                    <div class="row">
                    	
                        <div class="col-md-6 col-xl-3">
                            <div class="box box1">
                                <div class="boxvalue">
                                    <p>${campcount}</p>
                                </div>
                                <div class="boxname">Chiến dịch</div>
                                <div class="boxicon"><i class="far fa-window-restore"></i></div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="box box3">
                                <div class="boxvalue">
                                    <p>${usercount}</p>
                                </div>
                                <div class="boxname">Thành viên</div>
                                <div class="boxicon"><i class="fas fa-user-friends"></i></div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="box box2">
                                <div class="boxmoney">
                                	<fmt:formatNumber type = "number" value = "${total.amout/1000000}"/>tr VND
                                </div>
                                <div class="boxname">Tiền quyên góp</div>
                                <div class="boxicon"><i class="fas fa-hand-holding-usd"></i></div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="box box4">
                                <div class="boxvalue">
                                    <p>${total.count}</p>
                                </div>
                                <div class="boxname">Lượt quyên góp</div>
                                <div class="boxicon"><i class="far fa-window-restore"></i></div>
                            </div>
                        </div>
                    </div>
                </div>