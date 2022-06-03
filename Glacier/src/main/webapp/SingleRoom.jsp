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
        <title>Glacier - Easy Find and room booking</title>

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
                    <!--============ Secondary Navigation ===============================================================-->
                    <div class="secondary-navigation">
                        <div class="container">
                            <ul class="left">
                                <li>
                                    <span>
                                        <i class="fa fa-phone"></i> 
                                    </span>
                                </li>
                            </ul>
                            <!--end left-->
                            <ul class="right">
                                <c:if test="${empty acc}" >
                                    <li>
                                        <a href="${pageContext.request.contextPath}/login">
                                            <i class="fa fa-sign-in"></i>Đăng nhập
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/register">
                                            <i class="fa fa-pencil-square-o"></i>Đăng ký
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${not empty acc}" >
                                    <li>
                                        <a href="${pageContext.request.contextPath}/account">
                                            <i class="fa fa-sign-in"></i>${user.name}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/logout">
                                            <i class="fa fa-pencil-square-o"></i>Đăng xuất
                                        </a>
                                    </li>
                                </c:if>
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
                                        <li class="nav-item">
                                            <a class="nav-link" href="${pageContext.request.contextPath}/home">Trang chủ</a>
                                        </li> 
                                        <li class="nav-item">
                                            <a class="nav-link" href="${pageContext.request.contextPath}/contact">Liên lạc</a>
                                        </li>
                                        <c:if test="${not empty acc}" >
                                            <li class="nav-item">
                                                <a href="submit.html" class="btn btn-primary text-caps btn-rounded">QUẢN LÝ PHÒNG THUÊ</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                    <!--Main navigation list-->
                                </div>
                                <!--end navbar-collapse-->
                                <a href="#collapseMainSearchForm" class="main-search-form-toggle" data-toggle="collapse"  aria-expanded="false" aria-controls="collapseMainSearchForm">
                                    <i class="fa fa-search"></i>
                                    <i class="fa fa-close"></i>
                                </a>
                                <!--end main-search-form-toggle-->
                            </nav>
                            <!--end navbar-->
                            <!--                            <ol class="breadcrumb">
                                                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                                                            <li class="breadcrumb-item"><a href="#">Library</a></li>
                                                            <li class="breadcrumb-item active">Data</li>
                                                        </ol>-->
                            <!--end breadcrumb-->
                        </div>
                        <!--end container-->
                    </div>
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
                    <div class="page-title">
                        <div class="container clearfix" >
                            <div class="float-left float-xs-none" style="width: 75%">
                                <h1>
                                    ${room.name}
                                    <span class="tag">Offer</span>
                                </h1>
                                <h4 class="location">
                                    <a href="#">${room.address}</a>
                                </h4>
                            </div>
                            <div class="float-right float-xs-none price">
                                <!--                                <div class="number">
                                <fmt:formatNumber value="${room.price}" type="currency"/><small>VNĐ</small>
                            </div>-->
                                <div class="number">${room.price} <small>VNĐ</small></div>
                                <div class="id opacity-50">
                                    <strong>ID: </strong>${room.roomID}
                                </div>
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
                                <!--Description-->d:

                                <section>
                                    <h2>Description</h2>
                                    <p style="white-space: pre-line">
                                        ${room.description}
                                    </p>
                                </section>
                                <!--end Description-->
                                <!--Details-->
                                <section>
                                    <h2>Details</h2>
                                    <dl class="columns-2">
                                        <dt>Date Added</dt>
                                        <dd>${room.date_added}</dd>
                                        <dt>Type</dt>
                                        <dd>Offer</dd>
                                        <dt>Status</dt>
                                        <dd>${room.status}</dd>
                                        <!--                                    <dt>First Owner</dt>
                                                                            <dd>Yes</dd>-->
                                        <dt style="margin-right: 1rem">Detail address</dt>
                                        <dd>${room.detailAddress}</dd>
                                        <dt>Rent</dt>
                                        <dd>${room.price} <small>VND</small></dd>
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
                                <!--Location-->
                                <section>
                                <h2>Location</h2>
                                <div class="map height-300px" id="map-small">
                                    <iframe width="450"
                                            height="250"
                                            style="width: 100%; height: 100%"
                                            frameborder="0" style="border:0"                                         
                                            src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCCYLuixh0QamoPxzrTZTCNGOtd0fwYQoQ&q=${room.detailAddress}" allowfullscreen>
                                    </iframe>
                                </div>
                            </section>
                                <!--end Location-->
                                <!--Features-->
                                <!--                            <section>
                                                                <h2>Features</h2>
                                                                <ul class="features-checkboxes columns-3">
                                                                    <li>Quality Wood</li>
                                                                    <li>Brushed Alluminium Handles</li>
                                                                    <li>Foam mattress</li>
                                                                    <li>Detachable chaise section</li>
                                                                    <li>3 fold pull out mechanism</li>
                                                                </ul>
                                                            </section>-->
                                <!--end Features-->

                                <hr>

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
                                        <h2>Author</h2>
                                        <div class="box">
                                            <div class="author">
                                                <div class="author-image">
                                                    <div class="background-image">
                                                        <img src="assets/img/author-01.jpg" alt="">
                                                    </div>
                                                </div>
                                                <!--end author-image-->
                                                <div class="author-description">
                                                    <h3>Jane Doe</h3>
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
                                                <dd>830-247-0930</dd>
                                                <dt>Email</dt>
                                                <dd>hijane@example.com</dd>
                                            </dl>
                                            <!--end author-->
                                            <form class="form email">
                                                <div class="form-group">
                                                    <label for="name" class="col-form-label">Name</label>
                                                    <input name="name" type="text" class="form-control" id="name" placeholder="Your Name">
                                                </div>
                                                <!--end form-group-->
                                                <div class="form-group">
                                                    <label for="email" class="col-form-label">Email</label>
                                                    <input name="email" type="email" class="form-control" id="email" placeholder="Your Email">
                                                </div>
                                                <!--end form-group-->
                                                <div class="form-group">
                                                    <label for="message" class="col-form-label">Message</label>
                                                    <textarea name="message" id="message" class="form-control" rows="4" placeholder="Hi there! I am interested in your offer ID 53951. Please give me more details."></textarea>
                                                </div>
                                                <!--end form-group-->
                                                <button type="submit" class="btn btn-primary">Send</button>
                                            </form>
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
                <div class="wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5">
                                <a href="#" class="brand">
                                    <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="">
                                </a>
                                <p>
                                    Glacier là nền tảng kết nối người thuê nhà và các chủ trọ. Sẵn sàng sát cánh bến bạn trên mỗi hành trình mà bạn bước đi!
                                </p>
                            </div>
                            <!--end col-md-5-->
                            <div class="col-md-3">
                                <h2>Bảng điều hướng</h2>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <nav>
                                            <ul class="list-unstyled">
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
                                                </li>

                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <nav>
                                            <ul class="list-unstyled">
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/contact">Liên lạc</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                            <!--end col-md-3-->
                            <div class="col-md-4">
                                <h2>Liên hệ</h2>
                                <address>
                                    <!--                                    <figure>
                                                                            124 Abia Martin Drive<br>
                                                                            New York, NY 10011
                                                                        </figure>-->
                                    <br>
                                    <strong>Email:</strong> <a href="#">glacier.hostel@gmail.com</a>
                                    <br>
                                    <strong>Phone: </strong>  +1 123 456 789
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
                            <img src="${pageContext.request.contextPath}/assets/img/footer-background-icons.jpg" alt="">
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
        <script src="assets/js/icheck.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/custom.js"></script>

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
