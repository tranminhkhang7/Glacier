<%-- 
    Document   : tenant-room-bill
    Created on : Jun 20, 2022, 11:01:23 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <title>Hóa đơn của bạn</title>

    </head>
    <body style="font-family: 'Varela Round', sans-serif;">
        <div class="page sub-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->
            <header class="hero">
                <div class="hero-wrapper">
                    <!--============ Secondary Navigation ===============================================================-->
                    <jsp:include page="header/navigation.jsp" />
                    <!--============ End Main Navigation ================================================================-->
                    <!--============ Hero Form ==========================================================================-->
                    <div class="collapse" id="collapseMainSearchForm">
                        <form class="hero-form form">
                            <div class="container">
                                <!--Main Form-->
                                <div class="main-search-form">
                                    <div class="form-row">
                                        <div class="col-md-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="what" class="col-form-label">What?</label>
                                                <input name="keyword" type="text" class="form-control small" id="what" placeholder="What are you looking for?">
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-3-->
                                        <div class="col-md-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="input-location" class="col-form-label">Where?</label>
                                                <input name="location" type="text" class="form-control small" id="input-location" placeholder="Enter Location">
                                                <span class="geo-location input-group-addon" data-toggle="tooltip" data-placement="top" title="Find My Position"><i class="fa fa-map-marker"></i></span>
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-3-->
                                        <div class="col-md-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="category" class="col-form-label">Category?</label>
                                                <select name="category" id="category" class="small" data-placeholder="Select Category">
                                                    <option value="">Select Category</option>
                                                    <option value="1">Computers</option>
                                                    <option value="2">Real Estate</option>
                                                    <option value="3">Cars & Motorcycles</option>
                                                    <option value="4">Furniture</option>
                                                    <option value="5">Pets & Animals</option>
                                                </select>
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-3-->
                                        <div class="col-md-3 col-sm-3">
                                            <button type="submit" class="btn btn-primary width-100 small">Search</button>
                                        </div>
                                        <!--end col-md-3-->
                                    </div>
                                    <!--end form-row-->
                                </div>
                                <!--end main-search-form-->
                                <!--Alternative Form-->
                                <div class="alternative-search-form">
                                    <a href="#collapseAlternativeSearchForm" class="icon" data-toggle="collapse"  aria-expanded="false" aria-controls="collapseAlternativeSearchForm"><i class="fa fa-plus"></i>More Options</a>
                                    <div class="collapse" id="collapseAlternativeSearchForm">
                                        <div class="wrapper">
                                            <div class="form-row">
                                                <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 d-xs-grid d-flex align-items-center justify-content-between">
                                                    <label>
                                                        <input type="checkbox" name="new">
                                                        New
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" name="used">
                                                        Used
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" name="with_photo">
                                                        With Photo
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" name="featured">
                                                        Featured
                                                    </label>
                                                </div>
                                                <!--end col-xl-6-->
                                                <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
                                                    <div class="form-row">
                                                        <div class="col-md-4 col-sm-4">
                                                            <div class="form-group">
                                                                <input name="min_price" type="text" class="form-control small" id="min-price" placeholder="Minimal Price">
                                                                <span class="input-group-addon small">$</span>
                                                            </div>
                                                            <!--end form-group-->
                                                        </div>
                                                        <!--end col-md-4-->
                                                        <div class="col-md-4 col-sm-4">
                                                            <div class="form-group">
                                                                <input name="max_price" type="text" class="form-control small" id="max-price" placeholder="Maximal Price">
                                                                <span class="input-group-addon small">$</span>
                                                            </div>
                                                            <!--end form-group-->
                                                        </div>
                                                        <!--end col-md-4-->
                                                        <div class="col-md-4 col-sm-4">
                                                            <div class="form-group">
                                                                <select name="distance" id="distance" class="small" data-placeholder="Distance">
                                                                    <option value="">Distance</option>
                                                                    <option value="1">1km</option>
                                                                    <option value="2">5km</option>
                                                                    <option value="3">10km</option>
                                                                    <option value="4">50km</option>
                                                                    <option value="5">100km</option>
                                                                </select>
                                                            </div>
                                                            <!--end form-group-->
                                                        </div>
                                                        <!--end col-md-3-->
                                                    </div>
                                                    <!--end form-row-->
                                                </div>
                                                <!--end col-xl-6-->
                                            </div>
                                            <!--end row-->
                                        </div>
                                        <!--end wrapper-->
                                    </div>
                                    <!--end collapse-->
                                </div>
                                <!--end alternative-search-form-->
                            </div>
                            <!--end container-->
                        </form>
                        <!--end hero-form-->
                    </div>
                    <!--end collapse-->
                    <!--============ End Hero Form ======================================================================-->
                    <!--============ Page Title =========================================================================-->
                    <div class="page-title">
                        <div class="container">
                            <h1>Hóa đơn</h1>
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
                    <div class="container">

                        <section>
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-bottom: 25px;">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="one-tab" data-toggle="tab" href="#one" role="tab" aria-controls="one" aria-expanded="true"><strong>CHƯA THANH TOÁN</strong></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="two-tab" data-toggle="tab" href="#two" role="tab" aria-controls="two"><strong>ĐÃ THANH TOÁN</strong></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="one" role="tabpanel" aria-labelledby="one-tab">
                                            <c:forEach items="${requestScope.UNPAID_BILLS}" var="unpaidBill">
                                                <div class="answer">
                                                    <div class="box">
                                                        <div class='row'>
                                                            <div class="col-md-9">
                                                                <h3>${unpaidBill.purpose}</h3>
                                                                <p><strong>Số tiền:</strong> ${unpaidBill.amount} VNĐ<br>
                                                                    <strong>Hóa đơn được tạo ra vào: ${unpaidBill.time}</strong><br>
                                                                    <strong>Feel free to add thêm thuộc gì đóa nhe</strong></p>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <button class="btn btn-primary large icon float-left"  style="font-size: 16px; top: 25px;">Thanh toán</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <!--                                                <div class="answer">
                                                                                                <div class="box">
                                                                                                    <div class='row'>
                                                                                                        <div class="col-md-9">
                                                                                                            <h3>Đây là purpose của payment nè</h3>
                                                                                                            <p><strong>Số tiền:</strong> 3.000.000 VNĐ<br>
                                                                                                            <strong>Hóa đơn được tạo ra vào:</strong><br>
                                                                                                            <strong>Feel free to add thêm thuộc gì đóa nhe</strong></p>
                                                                                                        </div>
                                                                                                        <div class="col-md-3">
                                                                                                            <button class="btn btn-primary large icon float-left"  style="font-size: 16px; top: 25px;">Thanh toán</button>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                            
                                                                                            <div class="answer">
                                                                                                <div class="box">
                                                                                                    <div class='row'>
                                                                                                        <div class="col-md-9">
                                                                                                            <h3>Đây là purpose của payment nè</h3>
                                                                                                            <p><strong>Số tiền:</strong> 3.000.000 VNĐ<br>
                                                                                                            <strong>Hóa đơn được tạo ra vào:</strong><br>
                                                                                                            <strong>Feel free to add thêm thuộc gì đóa nhe</strong></p>
                                                                                                        </div>
                                                                                                        <div class="col-md-3">
                                                                                                            <button class="btn btn-primary large icon float-left"  style="font-size: 16px; top: 25px;">Thanh toán</button>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>-->


                                        </div>
                                        <div class="tab-pane fade" id="two" role="tabpanel" aria-labelledby="two-tab">
                                            <c:forEach items="${requestScope.PAID_BILLS}" var="paid">
                                                <div class="answer">
                                                    <div class="box">
                                                        <div class='row'>
                                                            <div class="col-md-12">
                                                                <h3>${paid.purpose}</h3>
                                                                <p><strong>Số tiền:</strong> ${paid.amount} VNĐ<br>
                                                                    <strong>Hóa đơn được tạo ra vào: ${paid.time}</strong><br>
                                                                    <strong>Feel free to add thêm thuộc gì đóa nhe</strong></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <!--                                            <div class="answer">
                                                                                                <div class="box">
                                                                                                    <div class='row'>
                                                                                                        <div class="col-md-12">
                                                                                                            <h3>Đây là purpose của payment nè</h3>
                                                                                                            <p><strong>Số tiền:</strong> 3.000.000 VNĐ<br>
                                                                                                            <strong>Hóa đơn được tạo ra vào:</strong><br>
                                                                                                            <strong>Feel free to add thêm thuộc gì đóa nhe</strong></p>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                            
                                                                                            <div class="answer">
                                                                                                <div class="box">
                                                                                                    <div class='row'>
                                                                                                        <div class="col-md-12">
                                                                                                            <h3>Đây là purpose của payment nè</h3>
                                                                                                            <p><strong>Số tiền:</strong> 3.000.000 VNĐ<br>
                                                                                                            <strong>Hóa đơn được tạo ra vào:</strong><br>
                                                                                                            <strong>Feel free to add thêm thuộc gì đóa nhe</strong></p>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>-->
                                        </div>

                                        <!--                                        <div class="page-pagination">
                                                                                    <nav aria-label="Pagination">
                                                                                        <ul class="pagination">
                                                                                            <li class="page-item">
                                                                                                <a class="page-link" href="#" aria-label="Previous">
                                                                                            <span aria-hidden="true">
                                                                                                <i class="fa fa-chevron-left"></i>
                                                                                            </span>
                                                                                                    <span class="sr-only">Previous</span>
                                                                                                </a>
                                                                                            </li>
                                                                                            <li class="page-item active">
                                                                                                <a class="page-link" href="#">1</a>
                                                                                            </li>
                                                                                            <li class="page-item">
                                                                                                <a class="page-link" href="#">2</a>
                                                                                            </li>
                                                                                            <li class="page-item">
                                                                                                <a class="page-link" href="#">3</a>
                                                                                            </li>
                                                                                            <li class="page-item">
                                                                                                <a class="page-link" href="#" aria-label="Next">
                                                                                            <span aria-hidden="true">
                                                                                                <i class="fa fa-chevron-right"></i>
                                                                                            </span>
                                                                                                    <span class="sr-only">Next</span>
                                                                                                </a>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </nav>
                                                                                </div>-->
                                        <!--end page-pagination-->
                                    </div>



                                </div>
                                <!--end col-md-6-->

                            </div>
                            <!--end row-->
                        </section>



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
                                    Glacier là nền tảng kết nối người thuê nhà và các chủ trọ. Sẵn sàng sát cánh bến bạn trên mỗi hành trình mà bạn bước đi!
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
                                                    <a href="#">Home</a>
                                                </li>
                                                <li>
                                                    <a href="#">Listing</a>
                                                </li>
                                                <li>
                                                    <a href="#">Pages</a>
                                                </li>
                                                <li>
                                                    <a href="#">Extras</a>
                                                </li>
                                                <li>
                                                    <a href="#">Contact</a>
                                                </li>
                                                <li>
                                                    <a href="#">Submit Ad</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <nav>
                                            <ul class="list-unstyled">
                                                <li>
                                                    <a href="#">My Ads</a>
                                                </li>
                                                <li>
                                                    <a href="#">Sign In</a>
                                                </li>
                                                <li>
                                                    <a href="#">Register</a>
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
                                        124 Abia Martin Drive<br>
                                        New York, NY 10011
                                    </figure>
                                    <br>
                                    <strong>Email:</strong> <a href="#">hello@example.com</a>
                                    <br>
                                    <strong>Skype: </strong> Craigs
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

        <script>
            var latitude = 51.511971;
            var longitude = -0.137597;
            var markerImage = "assets/img/map-marker.png";
            var mapTheme = "light";
            var mapElement = "simple-map";
            var markerDrag = true;
            simpleMap(latitude, longitude, markerImage, mapTheme, mapElement, markerDrag);
        </script>

    </body>
</html>

