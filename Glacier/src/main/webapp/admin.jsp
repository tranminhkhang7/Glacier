<%-- 
    Document   : admin
    Created on : May 23, 2022, 3:40:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="ThemeStarz">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Varela+Round" rel="stylesheet">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.css" type="text/css">
        <link rel="stylesheet" href="assets/css/selectize.css" type="text/css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/user.css">

        <title>Trang chủ · Glacier</title>
        <style>
            .picback {
                height: 180px;
                background-origin:content-box;
                background-size:cover;
                opacity: 0.9;
                
            }
        </style>
    </head>
    <body style="font-family: 'Varela Round', sans-serif;">
        <div class="page sub-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->
            <header class="hero">
                <div class="hero-wrapper">

                    <!--============ Secondary Navigation ===============================================================-->
                    <div class="secondary-navigation">
                        <div class="container">
                            <ul class="left">
                                <li>
                                    <span>
                                        <i class="fa fa-phone"></i> +1 123 456 789
                                    </span>
                                </li>
                            </ul>
                            <!--end left-->
                            <ul class="right">
                                <li>
                                    <a href="sign-in.html">
                                        <i class="fa fa-sign-out"></i>Đăng xuất
                                    </a>
                                </li>
                            </ul>
                            <!--end right-->
                        </div>
                        <!--end container-->
                    </div>
                    <!--============ End Secondary Navigation ===========================================================-->
                    <!--============ Main Navigation ====================================================================-->
                    <div class="main-navigation">
                        <div class="container">
                            <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                                <a class="navbar-brand" href="index.html">
                                    <img src="assets/img/logo.png" alt="">
                                </a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="navbar">
                                    <!--Main navigation list-->
                                    <ul class="navbar-nav">
                                        <li class="nav-item active has-child">
                                            <a class="nav-link" href="SearchUserController?keyword=&index=1&role=all">Người dùng</a>
                                            <ul class="child">
                                                <li class="nav-item" >
                                                    <a href="SearchUserController?keyword=&role=landlord&index=1" class="nav-link" >Người cho thuê</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="SearchUserController?keyword=&role=tenant&index=1" class="nav-link">Người thuê</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item has-child">
                                            <a class="nav-link" href="ReportedController?index=1&type=all">Bị tố cáo</a>
                                            <!-- 1st level -->
                                            <ul class="child">
                                                <li class="nav-item">
                                                    <a href="ReportedController?index=1&type=room" class="nav-link">Phòng</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="ReportedController?index=1&type=comment" class="nav-link">Bình luận</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="contact.html">Liên hệ</a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="admin.jsp" class="btn btn-primary text-caps btn-rounded btn-framed">Trang chủ</a>
                                        </li>
                                    </ul>
                                    <!--Main navigation list-->
                                </div>
                                <!--end navbar-collapse-->
                                <!--end main-search-form-toggle-->
                            </nav>
                            <!--end navbar-->

                            <!--end breadcrumb-->
                        </div>
                        <!--end container-->
                    </div>
                    <!--============ End Main Navigation ================================================================-->

                    
                    <jsp:include page="header/navigation-admin.jsp" />
                    

                    <!--============ Page Title =========================================================================-->
                    <div class="page-title">
                        <div class="container">
                            <h1 class="opacity-80 center" style="color: red">
                                Xin chào quản trị viên
                            </h1>
                        </div>
                        <!--end container-->
                    </div>
                    <!--============ End Page Title =====================================================================-->
                    <div class="background"></div>
                    <!--end background-->
                </div>
                <!--end hero-wrapper-->
            </header>
            <!--end hero-->

            <!--*********************************************************************************************************-->
            <!--************ CONTENT ************************************************************************************-->
            <!--*********************************************************************************************************-->
            
            <section class="content">
                <section class="block">
                    <div class="container" >
                        <!--============ Items ==========================================================================-->
                        <div class="items grid grid-xl-2-items grid-lg-2-items grid-md-2-items">
                            <div class="item">                       
                                <div class="wrapper" style="text-align: center">
                                    <a href="SearchUserController?keyword=&index=1&role=all" style="color: black; font-size-adjust: 0.5"><h1 style="margin: 20px">Người dùng</h1></a>
                                    
                                    <div class="picback" style="background-image: url(assets/images/Landlord.jpg)">
                                        <a href="SearchUserController?keyword=&role=landlord&index=1" class="btn" style="margin: 50px"><h2>Người cho thuê</h2></a><br>
                                    </div>
                                    <div class="picback" style="background-image: url(assets/images/Tenant.jpg)">
                                        <a href="SearchUserController?keyword=&role=tenant&index=1" class="btn" style="margin: 50px"><h2>Người thuê</h2></a>
                                    </div>
                                </div>
                            </div>
                            <div class="item">                           
                                <div class="wrapper" style="text-align: center">
                                    <a href="ReportedController?index=1&type=all" style="color: black; font-size-adjust: 0.5"><h1 style="margin: 20px">Bị tố cáo</h1></a>   
                                    <div class="picback" style="background-image: url(assets/images/Rooms.jpg)">
                                        <a href="ReportedController?index=1&type=room" class="btn" style="margin: 50px"><h2>Phòng</h2></a><br>
                                    </div>
                                    <div class="picback" style="background-image: url(assets/images/Comments.jpg)">
                                        <a href="ReportedController?index=1&type=comment" class="btn" style="margin: 50px"><h2>Bình luận</h2></a>
                                </div>

                            </div>
                            <!--end item-->




                        </div>
                        <!--============ End Items ======================================================================-->

                        <!--end page-pagination-->
                    </div>
                    <!--end container-->
                </section>
                <!--end block-->
            </section>
            <!--end content-->

            <!--*********************************************************************************************************-->
            <!--************ FOOTER *************************************************************************************-->
            <!--*********************************************************************************************************-->
            <jsp:include page="header/footer-admin.jsp" />
            <!--end footer-->
        </div>
        <!--end page-->

        <script src="assets/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="assets/js/popper.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
        <script src="assets/js/selectize.min.js"></script>
        <script src="assets/js/masonry.pkgd.min.js"></script>
        <script src="assets/js/icheck.min.js"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/custom.js"></script>

    </body>
</html>

