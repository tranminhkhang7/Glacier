<%-- 
    Document   : index.jsp
    Created on : Jun 1, 2022, 8:04:59 AM
    Author     : KHANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>

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

    </head>
    <body style="font-family: 'Varela Round', sans-serif;">
        <c:set var="acc" value="${LOGIN_USER}" />
        <c:set var="user" value="${USER_DETAIL}" />

        <div class="page home-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->


            <header class="hero">
                <div class="hero-wrapper">

                    <jsp:include page="header/navigation.jsp" />

                    <!--============ Page Title =========================================================================-->
                    <div class="page-title">
                        <div class="container">
                            <h1 class="opacity-60 center">
                                <a href="#">Thuê</a> bất cứ đâu bạn muốn!

                            </h1>
                        </div>
                        <!--end container-->
                    </div>
                    <!--============ End Page Title =====================================================================-->
                    <!--============ Hero Form ==========================================================================-->
                    <form class="hero-form form" action="${pageContext.request.contextPath}/search">
                        <div class="container">
                            <!--Main Form-->
                            <div class="main-search-form">
                                <div class="form-row">
                                    <div class="col-md-9 col-sm-9">
                                        <div class="form-group">
                                            <label for="what" class="col-form-label">Bạn đang đi đến đâu?</label>
                                            <input name="keyword" type="text" class="form-control" id="what" placeholder="Nhập vị trí, mô tả phòng mà bạn muốn đến..." required>
                                        </div>
                                        <!--end form-group-->
                                    </div>
                                    <!--end col-md-3-->
                                    <div class="col-md-3 col-sm-3">
                                        <button type="submit" class="btn btn-primary width-100">Tìm kiếm</button>
                                    </div>
                                    <!--end col-md-3-->
                                </div>
                                <!--end form-row-->
                            </div>
                            <!--end main-search-form-->

                        </div>
                        <!--end container-->
                    </form>
                    <!--============ End Hero Form ======================================================================-->
                    <div class="background">
                        <div class="background-image">
                            <img src="assets/img/hero-background-image-02.jpg" alt="">
                        </div>
                        <!--end background-image-->
                    </div>
                    <!--end background-->
                </div>
                <!--end hero-wrapper-->
            </header>
            <!--end hero-->

            <!--*********************************************************************************************************-->
            <!--************ CONTENT ************************************************************************************-->
            <!--*********************************************************************************************************-->
            <section class="content">
                <!--============ Featured Ads ===========================================================================-->
                <section class="block">
                    <div class="container">
                        <h2>Khám phá những vùng đất mới!</h2>
                        <div class="items grid grid-xl-3-items grid-lg-3-items grid-md-2-items">
                            <div class="item">
                                <div class="wrapper">
                                    <div class="image">
                                        <a href="single-listing-1.html" class="image-wrapper background-image">
                                            <img src="assets/images/HCMC.jpg" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
                                    <h4 class="location">
                                        <a href="#">VietNam</a>
                                    </h4>
                                    <div class="price">HCM city</div>

                                    <!--end meta-->
                                    <div class="description">
                                        <p>Ho Chi Minh City is the largest city, business and financial hub of Vietnam. Also known as Saigon, it has a prominent history going back hundreds of years. There are plenty of museums showcasing the country's dark wartime history and classic colonial architecture built by former French rulers.</p>
                                    </div>
                                    <!--end description-->
                                </div>
                            </div>
                            <!--end item-->
                            <div class="item">
                                <div class="wrapper">
                                    <div class="image">
                                        <a href="single-listing-1.html" class="image-wrapper background-image">
                                            <img src="assets/images/LNDN.jpg" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
                                    <h4 class="location">
                                        <a href="#">England, UK</a>
                                    </h4>
                                    <div class="price">London</div>

                                    <!--end meta-->
                                    <div class="description">
                                        <p>London is famous for Big Ben, Buckingham Palace, British Museum, and Tower Bridge. London is also known for its rich history, double-decker buses, red phone booths, world-class museums and galleries, gigantic lush parks, financial districts, and cosmopolitan vibes.</p>
                                    </div>
                                    <!--end description-->
                                </div>
                            </div>
                            <!--end item-->
                            <div class="item">
                                <div class="wrapper">
                                    <div class="image">
                                        <a href="single-listing-1.html" class="image-wrapper background-image">
                                            <img src="assets/images/France.jpg" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
                                    <h4 class="location">
                                        <a href="#">France</a>
                                    </h4>
                                    <div class="price">Paris</div>

                                    <!--end meta-->
                                    <div class="description">
                                        <p>Nam eget ullamcorper massa. Morbi fringilla lectus nec lorem tristique gravida</p>
                                    </div>
                                    <!--end description-->
                                </div>
                            </div>
                            <!--end item-->
                        </div>
                        <div class="items grid grid-xl-3-items grid-lg-3-items grid-md-2-items">
                            <div class="item">
                                <div class="wrapper">
                                    <div class="image">
                                        <a href="single-listing-1.html" class="image-wrapper background-image">
                                            <img src="assets/images/WDC.jpg" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
                                    <h4 class="location">
                                        <a href="#">USA</a>
                                    </h4>
                                    <div class="price">Washington DC</div>

                                    <!--end meta-->
                                    <div class="description">
                                        <p>Nam eget ullamcorper massa. Morbi fringilla lectus nec lorem tristique gravida</p>
                                    </div>
                                    <!--end description-->
                                </div>
                            </div>
                            <!--end item-->
                            <div class="item">
                                <div class="wrapper">
                                    <div class="image">
                                        <a href="single-listing-1.html" class="image-wrapper background-image">
                                            <img src="assets/images/Rio.jpg" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
                                    <h4 class="location">
                                        <a href="#">Brazil</a>
                                    </h4>
                                    <div class="price">Rio De Janeiro</div>

                                    <!--end meta-->
                                    <div class="description">
                                        <p>Nam eget ullamcorper massa. Morbi fringilla lectus nec lorem tristique gravida</p>
                                    </div>
                                    <!--end description-->
                                </div>
                            </div>
                            <!--end item-->
                            <div class="item">
                                <div class="wrapper">
                                    <div class="image">
                                        <a href="single-listing-1.html" class="image-wrapper background-image">
                                            <img src="assets/images/Bei.jpg" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
                                    <h4 class="location">
                                        <a href="#">China</a>
                                    </h4>
                                    <div class="price">Beijing</div>

                                    <!--end meta-->
                                    <div class="description">
                                        <p>Nam eget ullamcorper massa. Morbi fringilla lectus nec lorem tristique gravida</p>
                                    </div>
                                    <!--end description-->
                                </div>
                            </div>
                            <!--end item-->

                        </div>

                    </div>
                    <div class="background" data-background-color="#fff"></div>
                    <!--end background-->
                </section>
                <!--============ End Featured Ads =======================================================================-->

                <section class="block">
                    <div class="container">
                        <div class="d-flex align-items-center justify-content-around">

                        </div>
                    </div>

                </section>

            </section>
            <!--end content-->

            <!--*********************************************************************************************************-->
            <!--************ FOOTER *************************************************************************************-->
            <!--*********************************************************************************************************-->
            <jsp:include page="header/footer.jsp" />
            <!--end footer-->
        </div>
        <!--end page-->

        <script src="assets/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="assets/js/popper.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
        <!--<script type="text/javascript" src="http://maps.google.com/maps/api/js"></script>-->
        <script src="assets/js/selectize.min.js"></script>
        <script src="assets/js/masonry.pkgd.min.js"></script>
        <script src="assets/js/icheck.min.js"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/custom.js"></script>

    </body>

</html>


