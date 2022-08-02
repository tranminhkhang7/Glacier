<%-- 
    Document   : SingleRoom
    Created on : May 24, 2022, 1:34:52 AM
    Author     : Admin
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

        <style>
            .popup{
                z-index: 20;
                background-color: #ffffff;
                width: 750px;
                padding: 30px 40px;
                position: fixed;
                transform: translate(-50%,-50%);
                left: 50%;
                top: 50%;
                border-radius: 8px;
                display: none; 
                text-align: center;
                box-shadow: 10px 10px 50px grey;
            }
            .popup h2{
                margin-top: -20px;
            }
            .popup p{
                font-size: 14px;
                text-align: justify;
                margin: 20px 0;
                line-height: 25px;
            }
            .popup label{
                font-size: 16px;
            }
            .notify{
                z-index: 19;
                background-color: rgb(235, 244, 251);
                box-shadow: 0 .1rem 2rem rgba(0, 0, 0, .15);
                left: 50%;
                top: 10%;
                padding: 15px;
                border: 1px solid rgb(166, 206, 237);
                border-radius: .3rem;
                text-align: center;
                position: fixed;
                transform: translate(-50%,-50%);
                display: block;
            }
        </style>

        <title>${room.name} · Glacier</title>

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

                    <jsp:include page="header/navigation-admin.jsp" />

                    <!--============ Page Title =========================================================================-->

                    <div class="page-title">
                        <div class="container clearfix" >
                            <div class="float-left float-xs-none" style="width: 100%">
                                <div>
                                    <h1>
                                        ${room.name}
                                        <!--                                    <span class="tag">Offer</span>-->
                                    </h1>
                                </div>
                            </div>
                            <div class="float-left float-xs-none" style="width: 75%">
                                <div style="font-size: 18px;color:#ff0000" class="active"><i style="" class="fa fa-star" aria-hidden="true"></i><i style="" class="fa fa-star" aria-hidden="true"></i><i style="" class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i></div>

                                <h4 class="location">
                                    <a href="#">${room.address}</a>
                                </h4>
                            </div>
                            <div class="float-right float-xs-none price" style="width: 25%">
                                <div class="number priceStyle">${room.price}<small>đ</small></div>
                                <strong>/tháng</strong>
                            </div>
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
                        <!--Gallery Carousel-->
                        <section>
                            <div class="gallery-carousel owl-carousel">
                                <img src="assets/img/image-20.jpg" alt="" data-hash="1">
                                <img src="assets/img/image-01.jpg" alt="" data-hash="2">
                                <img src="assets/img/image-21.jpg" alt="" data-hash="3">
                                <img src="assets/img/image-22.jpg" alt="" data-hash="4">
                                <img src="assets/img/image-23.jpg" alt="" data-hash="5">
                                <img src="assets/img/image-14.jpg" alt="" data-hash="6">
                            </div>
                            <div class="gallery-carousel-thumbs owl-carousel">
                                <a href="#1" class="owl-thumb active-thumb background-image">
                                    <img src="assets/img/image-20.jpg" alt="">
                                </a>
                                <a href="#2" class="owl-thumb background-image">
                                    <img src="assets/img/image-01.jpg" alt="">
                                </a>
                                <a href="#3" class="owl-thumb background-image">
                                    <img src="assets/img/image-21.jpg" alt="">
                                </a>
                                <a href="#4" class="owl-thumb background-image">
                                    <img src="assets/img/image-22.jpg" alt="">
                                </a>
                                <a href="#5" class="owl-thumb background-image">
                                    <img src="assets/img/image-23.jpg" alt="">
                                </a>
                                <a href="#6" class="owl-thumb background-image">
                                    <img src="assets/img/image-14.jpg" alt="">
                                </a>
                            </div>
                        </section>
                        <!--end Gallery Carousel-->
                        <div class="row flex-column-reverse flex-md-row">
                            <!--============ Listing Detail =============================================================-->
                            <div class="col-md-8">
                                <!--Description-->

                                <section>
                                    <h2>Mô tả</h2>
                                    <p style="">
                                        ${room.description}
                                    </p>
                                </section>
                                <!--end Description-->
                                <!--Details-->
                                <section>

                                    <h2>Chi tiết</h2>
                                    <dl class="columns-2">
                                        <dt>Ngày thêm</dt>
                                        <dd>${room.date_added}</dd>
                                        <dt>Loại</dt>
                                        <dd>Offer</dd>
                                        <dt>Trạng thái</dt>
                                        <dd>${room.status}</dd>
                                        <!--                                    <dt>First Owner</dt>
                                                                            <dd>Yes</dd>-->
                                        <dt>Địa chỉ</dt>
                                        <dd>${room.detailAddress}</dd>
                                        <dt>Tiền thuê tháng</dt>
                                        <dd class="priceStyle">${room.price}<small>đ</small></dd>
                                        <!--                                    <dt>Color</dt>
                                                                            <dd>White, Grey</dd>
                                                                            <dt>Height</dt>
                                                                            <dd>47cm</dd>
                                                                            <dt>Width</dt>
                                                                            <dd>203cm</dd>
                                                                            <dt>Length</dt>
                                                                            <dd>54cm</dd>-->
                                    </dl>
                                </section>
                                <!--end Details-->
                                <!--                                Features-->
                                <c:if test="${not empty f}">
                                    <section>
                                        <h2 style="">Phòng chúng tôi có gì</h2>
                                        <ul class="features-checkboxes columns-4">
                                            <c:forEach items="${f}" var="feature">
                                                <c:if test="${not empty feature}">
                                                    <li style="font-weight: bold">${feature}</li>       
                                                    </c:if>
                                                </c:forEach>
                                        </ul>
                                    </section>
                                </c:if>
                                <!--                                end Features-->


                                <!--Similar Ads-->
                                <!--                            <section>
                                                                <h2>Similar Ads</h2>
                                                                <div class="items list compact">
                                                                    <div class="item">
                                                                        <div class="ribbon-featured">Featured</div>
                                                                        end ribbon
                                                                        <div class="wrapper">
                                                                            <div class="image">
                                                                                <h3>
                                                                                    <a href="#" class="tag category">Home & Decor</a>
                                                                                    <a href="single-listing-1.html" class="title">Furniture for sale</a>
                                                                                    <span class="tag">Offer</span>
                                                                                </h3>
                                                                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                                                                    <img src="assets/img/image-01.jpg" alt="">
                                                                                </a>
                                                                            </div>
                                                                            end image
                                                                            <h4 class="location">
                                                                                <a href="#">Manhattan, NY</a>
                                                                            </h4>
                                                                            <div class="price">$80</div>
                                                                            <div class="meta">
                                                                                <figure>
                                                                                    <i class="fa fa-calendar-o"></i>02.05.2017
                                                                                </figure>
                                                                                <figure>
                                                                                    <a href="#">
                                                                                        <i class="fa fa-user"></i>Jane Doe
                                                                                    </a>
                                                                                </figure>
                                                                            </div>
                                                                            end meta
                                                                            <div class="description">
                                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis lobortis</p>
                                                                            </div>
                                                                            end description
                                                                            <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                                                                        </div>
                                                                    </div>
                                                                    end item
                                
                                                                    <div class="item">
                                                                        <div class="wrapper">
                                                                            <div class="image">
                                                                                <h3>
                                                                                    <a href="#" class="tag category">Education</a>
                                                                                    <a href="single-listing-1.html" class="title">Creative Course</a>
                                                                                    <span class="tag">Offer</span>
                                                                                </h3>
                                                                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                                                                    <img src="assets/img/image-02.jpg" alt="">
                                                                                </a>
                                                                            </div>
                                                                            end image
                                                                            <h4 class="location">
                                                                                <a href="#">Nashville, TN</a>
                                                                            </h4>
                                                                            <div class="price">$125</div>
                                                                            <div class="meta">
                                                                                <figure>
                                                                                    <i class="fa fa-calendar-o"></i>28.04.2017
                                                                                </figure>
                                                                                <figure>
                                                                                    <a href="#">
                                                                                        <i class="fa fa-user"></i>Peter Browner
                                                                                    </a>
                                                                                </figure>
                                                                            </div>
                                                                            end meta
                                                                            <div class="description">
                                                                                <p>Proin at tortor eros. Phasellus porta nec elit non lacinia. Nam bibendum erat at leo faucibus vehicula. Ut laoreet porttitor risus, eget suscipit tellus tincidunt sit amet. </p>
                                                                            </div>
                                                                            end description
                                                                            <div class="additional-info">
                                                                                <ul>
                                                                                    <li>
                                                                                        <figure>Start Date</figure>
                                                                                        <aside>25.06.2017 09:00</aside>
                                                                                    </li>
                                                                                    <li>
                                                                                        <figure>Length</figure>
                                                                                        <aside>2 months</aside>
                                                                                    </li>
                                                                                    <li>
                                                                                        <figure>Bedrooms</figure>
                                                                                        <aside>3</aside>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                            end addition-info
                                                                            <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                                                                        </div>
                                                                    </div>
                                                                    end item
                                
                                                                    <div class="item">
                                                                        <div class="wrapper">
                                                                            <div class="image">
                                                                                <h3>
                                                                                    <a href="#" class="tag category">Adventure</a>
                                                                                    <a href="single-listing-1.html" class="title">Into The Wild</a>
                                                                                    <span class="tag">Ad</span>
                                                                                </h3>
                                                                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                                                                    <img src="assets/img/image-03.jpg" alt="">
                                                                                </a>
                                                                            </div>
                                                                            end image
                                                                            <h4 class="location">
                                                                                <a href="#">Seattle, WA</a>
                                                                            </h4>
                                                                            <div class="price">$1,560</div>
                                                                            <div class="meta">
                                                                                <figure>
                                                                                    <i class="fa fa-calendar-o"></i>21.04.2017
                                                                                </figure>
                                                                                <figure>
                                                                                    <a href="#">
                                                                                        <i class="fa fa-user"></i>Peak Agency
                                                                                    </a>
                                                                                </figure>
                                                                            </div>
                                                                            end meta
                                                                            <div class="description">
                                                                                <p>Nam eget ullamcorper massa. Morbi fringilla lectus nec lorem tristique gravida</p>
                                                                            </div>
                                                                            end description
                                                                            <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                                                                        </div>
                                                                    </div>
                                                                    end item
                                
                                                                    <div class="center">
                                                                        <a href="#" class="btn btn-primary text-caps btn-framed">Show All</a>
                                                                    </div>
                                                                </div>
                                                                end items.list.compact
                                                            </section>-->
                                <!--end Similar Ads-->
                            </div>
                            <!--============ End Listing Detail =========================================================-->
                            <!--============ Sidebar ====================================================================-->
                            <div class="col-md-4">
                                <aside class="sidebar">
                                    <!--Author-->
                                    <section>
                                        <h2>Người cho thuê</h2>
                                        <div class="box">
                                            <div class="author">
                                                <div class="author-image">
                                                    <div class="background-image">
                                                        <img src="assets/img/author-01.jpg" alt="">
                                                    </div>
                                                </div>
                                                <!--end author-image-->
                                                <div class="author-description">
                                                    <h3>${Landlord.name}</h3>
                                                    <div class="rating" data-rating="4"></div>
                                                </div>
                                                <!--end author-description-->
                                            </div>
                                            <hr>
                                            <dl>
                                                <dt>Phone</dt>
                                                <dd>${Landlord.phone}</dd>
                                                <dt>Email</dt>
                                                <dd>${Landlord.email}</dd>
                                            </dl>
                                            <!--end author-->            
                                        </div>
                                        <!--end box-->
                                    </section>
                                    

                                </aside>

                            </div>
                            <!--============ End Sidebar ================================================================-->
                        </div>
                        <hr>
                        <section>
                            <h2>Bản đồ</h2>
                            <div class="map height-300px" id="map-small">
                                <iframe width="450"
                                        height="250"
                                        style="width: 100%; height: 100%"
                                        frameborder="0" style="border:0"
                                        referrerpolicy="no-referrer-when-downgrade"
                                        src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCCYLuixh0QamoPxzrTZTCNGOtd0fwYQoQ&q=${room.detailAddress}" allowfullscreen>
                                </iframe>
                            </div>
                        </section>
                        
                        
                        <hr style="margin-top: 10rem">
                        
                    </div>
                    <!--end container-->
                </section>
                <!--end block-->
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

        <script>
            function openForm() {
                document.getElementsByClassName("page")[0].style.filter = "blur(8px)";
                document.getElementById("reportForm").style.display = "block";
            }
            function closeForm() {
                document.getElementsByClassName("page")[0].style.filter = "none";
                document.getElementById("reportForm").style.display = "none";
            }
            function openCommentForm() {
//                document.getElementsByClassName("page")[0].style.filter = "blur(8px)";
                document.getElementById("reportCommentForm").style.display = "block";
            }
            function closeCommentForm() {
//                document.getElementsByClassName("page")[0].style.filter = "none";
                document.getElementById("reportCommentForm").style.display = "none";
            }
            function closeNotify() {
                document.getElementById("notifyBox").style.display = "none";
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