<%-- 
    Document   : tenant-single-rented
    Created on : Jun 6, 2022, 7:45:28 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/user.css">

        <title>Phòng của bạn</title>
        <style>
            a:hover{
                color: black;                   
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
                                                <input name="keyword" type="text" class="form-control small" id="what"
                                                       placeholder="What are you looking for?">
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-3-->
                                        <div class="col-md-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="input-location" class="col-form-label">Where?</label>
                                                <input name="location" type="text" class="form-control small"
                                                       id="input-location" placeholder="Enter Location">
                                                <span class="geo-location input-group-addon" data-toggle="tooltip"
                                                      data-placement="top" title="Find My Position"><i
                                                        class="fa fa-map-marker"></i></span>
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-3-->
                                        <div class="col-md-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="category" class="col-form-label">Category?</label>
                                                <select name="category" id="category" class="small"
                                                        data-placeholder="Select Category">
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
                                    <a href="#collapseAlternativeSearchForm" class="icon" data-toggle="collapse"
                                       aria-expanded="false" aria-controls="collapseAlternativeSearchForm"><i
                                            class="fa fa-plus"></i>More Options</a>
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
                                                                <input name="min_price" type="text"
                                                                       class="form-control small" id="min-price"
                                                                       placeholder="Minimal Price">
                                                                <span class="input-group-addon small">$</span>
                                                            </div>
                                                            <!--end form-group-->
                                                        </div>
                                                        <!--end col-md-4-->
                                                        <div class="col-md-4 col-sm-4">
                                                            <div class="form-group">
                                                                <input name="max_price" type="text"
                                                                       class="form-control small" id="max-price"
                                                                       placeholder="Maximal Price">
                                                                <span class="input-group-addon small">$</span>
                                                            </div>
                                                            <!--end form-group-->
                                                        </div>
                                                        <!--end col-md-4-->
                                                        <div class="col-md-4 col-sm-4">
                                                            <div class="form-group">
                                                                <select name="distance" id="distance" class="small"
                                                                        data-placeholder="Distance">
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
                    <div class="page-title">
                        <div class="container clearfix" >
                            <div class="float-left float-xs-none" style="width: 75%">
                                <div>
                                    <h1>
                                        ${SINGLE_ROOM.name}
                                        <!--                                    <span class="tag">Offer</span>-->
                                    </h1>
                                </div>
                                <div style="font-size: 18px;color:#ff0000" class="active"><i style="" class="fa fa-star" aria-hidden="true"></i><i style="" class="fa fa-star" aria-hidden="true"></i><i style="" class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i></div>

                                <h4 class="location">
                                    <a href="#">${SINGLE_ROOM.address}</a>
                                </h4>


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
                                <section style="margin-bottom: 0;">
                                    <h2>Description</h2>
                                    <p style="white-space: pre-line;">
                                        ${SINGLE_ROOM.description}                         
                                    </p>
                                    <hr>
                                </section>
                                <c:if test="${not empty f}">
                                    <section>
                                        <h2 style="">Features</h2>
                                        <ul class="features-checkboxes columns-4">
                                            <c:forEach items="${f}" var="feature">
                                                <c:if test="${not empty feature}">
                                                    <li style="font-weight: bold">${feature}</li>       
                                                    </c:if>
                                                </c:forEach>
                                        </ul>
                                    </section>
                                </c:if>
                                <!--end Description-->
                                <!--Details-->
                                <!-- <section>
                                    <h2>Details</h2>
                                    <dl class="columns-3">
                                        <dt>Date Added</dt>
                                        <dd>05.04.2017</dd>
                                        <dt>Type</dt>
                                        <dd>Offer</dd>
                                        <dt>Status</dt>
                                        <dd>Used</dd>
                                        <dt>First Owner</dt>
                                        <dd>Yes</dd>
                                        <dt>Material</dt>
                                        <dd>Wood, Leather</dd>
                                        <dt>Color</dt>
                                        <dd>White, Grey</dd>
                                        <dt>Height</dt>
                                        <dd>47cm</dd>
                                        <dt>Width</dt>
                                        <dd>203cm</dd>
                                        <dt>Length</dt>
                                        <dd>54cm</dd>
                                    </dl>
                                </section> -->
                                <!--end Details-->
                                <!--Location-->

                                <!--end Features-->



                                <!--Similar Ads-->
                                <!--                            <section>
                                                                <h2>Send your request</h2>
                                                                <form action="tenantnotify" method="POST" class="form">
                                                                    <input type="hidden" id="emailTenantForm" name="emailTenant" value="${SINGLE_ROOM.emailTenant}"/>
                                                                    <input type="hidden" id="emailLandlordForm" name="emailLandlord" value="${SINGLE_ROOM.emailLandlord}"/>
                                                                    <input type="hidden" id="roomIDForm" name="roomID" value="${SINGLE_ROOM.roomID}"/>
                                                                    <div class="row">
                                                                        <div class="col-md-12">
                                                                            <div class="form-group">
                                                                                <label for="subject" class="col-form-label">Subject</label>
                                                                                <input name="subject" type="text" class="form-control" id="subject"
                                                                                       placeholder="Did you like a deal?">
                                                                            </div>
                                                                            end form-group
                                                                        </div>
                                                                        end col-md-8
                                
                                                                        end col-md-4
                                                                        <div class="col-md-12">
                                                                            <div class="form-group">
                                                                                <label for="review" class="col-form-label">Your Request</label>
                                                                                <textarea name="content" id="review" class="form-control" rows="6"
                                                                                    placeholder="Good seller, I am satisfied."></textarea>
                                                                            </div>
                                                                            end form-group
                                                                        </div>
                                                                        end col-md-12
                                                                    </div>
                                                                    <div class="d-flex justify-content-between align-items-baseline">
                                                                        <label>
                                
                                                                        </label>
                                                                        <button id="btn_submit" type="submit" class="btn btn-danger">Send request</button>
                                                                    </div>
                                                                    end row
                                                                </form>
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
                                        <h2>Details</h2>
                                        <dl class="columns-1">
                                            <dt>Date Added</dt>
                                            <dd>${SINGLE_ROOM.date_added}</dd>
                                            <dt>Type</dt>
                                            <dd>Offer</dd>
                                            <dt>Status</dt>
                                            <dd>Used</dd>
                                            <dt>First Owner</dt>
                                            <dd>Yes</dd>
                                            <dt>Material</dt>
                                            <dd>Wood, Leather</dd>
                                            <dt>Color</dt>
                                            <dd>White, Grey</dd>
                                        </dl>
                                        <!--end box-->
                                    </section>
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
                                                    <a href="seller-detail-1.html" class="text-uppercase">Show My Listings
                                                        <span class="appendix">(12)</span>
                                                    </a>
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
                                    <!--End Author-->
                                </aside>

                            </div>

                            <!--============ End Sidebar ================================================================-->
                        </div>

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
            </footer>
            <!--end footer-->
        </div>
        <!--end page-->

        <script src="assets/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="assets/js/popper.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript"
        src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
        <script src="assets/js/selectize.min.js"></script>
        <script src="assets/js/icheck.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/custom.js"></script>
        <script type="text/javascript">

//            $(document).ready(function () {
//                $('#btn_submit').click(function () {
//
//                    var emailTenant = $('#emailTenantForm').val();
//                    var emailLandlord = $('#emailLandlordForm').val();
//                    var roomID = $('#roomID').val();
//                    var subject = $('#subject').val();
//                    var review = $('#review').val();
//
//                        $.ajax({
//                            url: 'tenantnotify',
//                            type: 'POST',
//                            data: {emailTenant: emailTenant, emailLandlord: emailLandlord,
//                                roomID: roomID, subject: subject, review: review},
//                            success: function (response)
//                            {
//                                alert("success");
//                                $('#formID')[0].reset();
//                            }
//                        });
//                    
//
//                });
//            });
        </script>
    </body>

</html>
