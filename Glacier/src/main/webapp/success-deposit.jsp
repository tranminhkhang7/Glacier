<%-- 
    Document   : success-deposit
    Created on : Jun 15, 2022, 8:10:46 AM
    Author     : KHANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="ThemeStarz">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Varela+Round" rel="stylesheet">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.css" type="text/css">
        <link rel="stylesheet" href="assets/css/selectize.css" type="text/css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/user.css">
        <title>Đặt cọc thành công · Glacier</title>
    </head>
    <body style="font-family: 'Varela Round', sans-serif;">
        <c:set var="acc" value="${LOGIN_USER}" />
        <c:set var="user" value="${USER_DETAIL}" />

        <div class="page sub-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->
            <header class="hero">
                <div class="hero-wrapper">

                    <jsp:include page="header/navigation.jsp" />

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
                                                <div class="col-xl-6 col-lg-5 col-md-12 col-sm-12">
                                                    <div class="form-row">
                                                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                                            <label>
                                                                <input type="checkbox" name="new">
                                                                New
                                                            </label>
                                                        </div>
                                                        <!--end col-md-3-->
                                                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                                            <label>
                                                                <input type="checkbox" name="used">
                                                                Used
                                                            </label>
                                                        </div>
                                                        <!--end col-md-3-->
                                                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                                            <label>
                                                                <input type="checkbox" name="with_photo">
                                                                With Photo
                                                            </label>
                                                        </div>
                                                        <!--end col-md-3-->
                                                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                                            <label>
                                                                <input type="checkbox" name="featured">
                                                                Featured
                                                            </label>
                                                        </div>
                                                        <!--end col-md-3-->
                                                    </div>
                                                </div>
                                                <!--end col-md-6-->
                                                <div class="col-xl-6 col-lg-7 col-md-12 col-sm-12">
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
                                                                <select name="distance" id="distance" class="small" data-placeholder="Distance" >
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
                                                </div>
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
            <section class="content" style="text-align: center">
                <!--                <section class="block">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-12">
                
                                                <section>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <form method="get" action="${pageContext.request.contextPath}/hehealo1234">
                                                                <button href="dadhakhkfha" class="btn btn-primary width-100">Xem giao diện phòng và đánh giá</button>
                                                            </form>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <button type="submit" class="btn btn-primary width-100" onclick="openForm()">Tạo thông báo</button>
                                                        </div>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <div class="col-md-6">
                                                            <button type="submit" class="btn btn-primary width-100" onclick="openForm()">Tạo hóa đơn</button>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <button type="submit" class="btn btn-primary width-100" onclick="openForm()">Người thuê muốn rời đi</button>
                                                        </div>
                
                                                    </div>
                                                </section>
                
                                            </div>
                                            end col-md-9
                
                                        </div>
                                        end row
                                    </div>
                                    end container
                                </section>-->
                <!--end block-->
                <br>
                <br>
                <h1 style="padding-bottom: 20px"> <i class="fa fa-check-circle" style="color: green"></i> Đặt phòng thành công!</h1>
                <h3>Đây là mã QR của bạn dùng để xác nhận khi nhận phòng</h3>
                <h3>Có thể xem lại mã của bạn trong phần xxxx</h3>
                <img src="${QR_Image}" alt="qr" width="300" height="300" style="display: block;margin:auto">

            </section>
            <!--end content-->

            <!--*********************************************************************************************************-->
            <!--************ FOOTER *************************************************************************************-->
            <!--*********************************************************************************************************-->
            <%--<jsp:include page="header/footer.jsp" />--%>
            <!--end footer-->
        </div>
        <!--end page-->

        <script src="assets/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="assets/js/popper.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
        <script src="assets/js/selectize.min.js"></script>
        <script src="assets/js/icheck.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/custom.js"></script>
        <script>
            for (let i = 0; i < document.getElementsByClassName("priceStyle").length; i++) {
                let priceText = document.getElementsByClassName("priceStyle")[i].textContent.trim();
                let textReverse = priceText.split("").reverse().join("").trim();
                var j = 1;
                var count = 0;
                while (j < textReverse.length) {
                    count++;
                    if (count > 3) {
                        textReverse = textReverse.slice(0, j) + "." + textReverse.slice(j);
                        count = 0;
                    }
                    j++;
                }
                let finalPrice = textReverse.split("").reverse().join("");
                document.getElementsByClassName("priceStyle")[i].innerHTML = finalPrice;
            }
        </script>


        <!--        <script>
                    var latitude = 51.511971;
                    var longitude = -0.137597;
                    var markerImage = "assets/img/map-marker.png";
                    var mapTheme = "light";
                    var mapElement = "map-small";
                    simpleMap(latitude, longitude, markerImage, mapTheme, mapElement);
                </script>-->

    </body>
</html>