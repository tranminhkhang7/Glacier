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
                height: 100px;
                width : 500px;
                margin: 20px;
                padding-top: 25px;
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


                    <!--============ End Secondary Navigation ===========================================================-->


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
                                                 
                                <div class="wrapper" style="text-align: center">
                                    <a href="SearchUserController?keyword=&index=1&role=all" style="color: black; font-size-adjust: 0.5"><h1 style="margin: 20px">Người dùng</h1></a><hr>
                                        <a href="SearchUserController?keyword=&role=landlord&index=1" class="picback btn btn-danger"><h1>Người cho thuê</h1></a>
                                        <a href="SearchUserController?keyword=&role=tenant&index=1" class="picback btn btn-danger"><h1>Người thuê</h1></a>
                                </div>
                            
                                                      
                                <div class="wrapper" style="text-align: center">
                                    <a href="ReportedController?index=1&type=all" style="color: black; font-size-adjust: 0.5"><h1 style="margin: 20px">Báo cáo</h1></a><hr>                            
                                        <a href="ReportedController?index=1&type=room" class="picback btn btn-danger"><h1>Phòng</h1></a>                                    
                                        <a href="ReportedController?index=1&type=comment" class="picback btn btn-danger"><h1>Bình luận</h1></a>
                                    

                                </div>
                                <!--end item-->
                            </div>
                            <!--============ End Items ======================================================================-->
                            <!--end page-pagination-->       
                        <div class="wrapper" style="text-align: center">
                            <h1 style="margin: 20px">Chức năng khác</h1><hr>
                            <a href="new-feature.jsp" class="picback btn btn-danger" ><h1>Quản lý feature</h1></a>                
                            <a href="VerifyRoomController?index=1" class="picback btn btn-danger"><h1>Xét duyệt phòng mới</h1></a>


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

