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

        <title>Craigs - Easy Buy & Sell Listing HTML Template</title>
        <style>
            .picback {
                height: 180px;
                background-origin:content-box;
                background-size:cover;
            }
        </style>
    </head>
    <body>
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
                                        <i class="fa fa-sign-out"></i>Sign Out
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
                                            <a class="nav-link" href="SearchUserController?keyword=&index=1&role=all">User</a>
                                            <ul class="child">
                                                <li class="nav-item" >
                                                    <a href="SearchUserController?keyword=&role=landlord&index=1" class="nav-link" >Landlords</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="SearchUserController?keyword=&role=tenant&index=1" class="nav-link">Tenants</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item has-child">
                                            <a class="nav-link" href="ReportedController?index=1&type=all">Reported</a>
                                            <!-- 1st level -->
                                            <ul class="child">
                                                <li class="nav-item">
                                                    <a href="ReportedController?index=1&type=room" class="nav-link">Rooms</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="ReportedController?index=1&type=comment" class="nav-link">Comments</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="contact.html">Contact</a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="admin.jsp" class="btn btn-primary text-caps btn-rounded btn-framed">Home</a>
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
                    <!--============ Page Title =========================================================================-->
                    <div class="page-title">
                        <div class="container">
                            <h1 class="opacity-80 center" style="color: red">
                                Welcome Moderator
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
                                    <a href="SearchUserController?keyword=&index=1&role=all" style="color: black; font-size-adjust: 0.5"><h1 style="margin: 20px">User</h1></a>
                                    
                                    <div class="picback" style="background-image: url(assets/images/Landlord.jpg)">
                                        <a href="SearchUserController?keyword=&role=landlord&index=1" class="btn" style="margin: 60px; font-size-adjust: 1">Landlords</a><br>
                                    </div>
                                    <div class="picback" style="background-image: url(assets/images/Tenant.jpg)">
                                        <a href="SearchUserController?keyword=&role=tenant&index=1" class="btn" style="margin: 60px; font-size-adjust: 1">Tenants</a>
                                    </div>
                                </div>
                            </div>
                            <div class="item">                           
                                <div class="wrapper" style="text-align: center">
                                    <a href="ReportedController?index=1&type=all" style="color: black; font-size-adjust: 0.5"><h1 style="margin: 20px">Reported</h1></a>   
                                    <div class="picback" style="background-image: url(assets/images/Rooms.jpg)">
                                    <a href="ReportedController?index=1&type=room" class="btn" style="margin: 60px; font-size-adjust: 1">Rooms</a><br>
                                    </div>
                                    <div class="picback" style="background-image: url(assets/images/Comments.jpg)">
                                    <a href="ReportedController?index=1&type=comment" class="btn" style="margin: 60px; font-size-adjust: 1">Comments</a>
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
            <footer class="footer">
                <div class="wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5">
                                <a href="#" class="brand">
                                    <img src="assets/img/logo.png" alt="">
                                </a>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec tincidunt arcu, sit amet
                                    fermentum sem. Class aptent taciti sociosqu ad litora torquent per conubia nostra.
                                </p>
                            </div>
                            <!--end col-md-5-->
                            <div class="col-md-3">
                                <h2>Navigation</h2>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <nav>
                                            <ul class="list-unstyled">
                                                <li>
                                                    <a href="admin.jsp">Home</a>
                                                </li>
                                                <li>
                                                    <a href="SearchUserController?keyword=&index=1&role=all">User</a>
                                                </li>

                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <nav>
                                            <ul class="list-unstyled">
                                                <li>
                                                    <a href="ReportedController?index=1&type=all">Reported</a>
                                                </li>
                                                <li>
                                                    <a href="#">Contact</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                            <!--end col-md-3-->
                            <div class="col-md-4">
                                <h2>Contact</h2>
                                <address>
                                    <figure>
                                        D1 Street,Long Thanh My<br> 
                                        Thu Duc city, Ho Chi Minh city
                                    </figure>
                                    <br>
                                    <strong>Email:</strong> <a href="#">hello@example.com</a>
                                    <br>
                                    <strong>Skype: </strong> Glacier
                                    <br>
                                    <br>
                                    <a href="contact.html" class="btn btn-primary text-caps btn-framed">Contact Us</a>
                                </address>
                            </div>
                            <!--end col-md-4-->
                        </div>
                        <!--end row-->
                    </div>
                    <div class="background">
                        <div class="background-image original-size">
                            <img src="assets/img/footer-background-icons.jpg" alt="">
                        </div>
                        <!--end background-image-->
                    </div>
                    <!--end background-->
                </div>
            </footer>
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

