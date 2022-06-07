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

    <title>Craigs - Easy Buy & Sell Listing HTML Template</title>
    <style>
        a:hover{
            color: black;
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
                                <a href="my-ads.html">
                                    <i class="fa fa-heart"></i>My Ads
                                </a>
                            </li>
                            <li>
                                <a href="sign-in.html">
                                    <i class="fa fa-sign-in"></i>Sign In
                                </a>
                            </li>
                            <li>
                                <a href="register.html">
                                    <i class="fa fa-pencil-square-o"></i>Register
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
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar"
                                aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbar">
                                <!--Main navigation list-->
                                <ul class="navbar-nav">
                                    <li class="nav-item active has-child">
                                        <a class="nav-link" href="#">Home</a>
                                        <ul class="child">
                                            <li class="nav-item">
                                                <a href="index.html" class="nav-link">Home 1</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="index-2.html" class="nav-link">Home 2</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="index-3.html" class="nav-link">Home 3</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="index-4.html" class="nav-link">Home 4</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item has-child">
                                        <a class="nav-link" href="#">Listing</a>
                                        <!-- 1st level -->
                                        <ul class="child">
                                            <li class="nav-item has-child">
                                                <a href="#" class="nav-link">Grid</a>
                                                <!-- 2nd level -->
                                                <ul class="child">
                                                    <li class="nav-item">
                                                        <a href="listing-grid-full-width.html" class="nav-link">Full
                                                            Width</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="listing-grid-sidebar.html" class="nav-link">With
                                                            Sidebar</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="listing-grid-compact-sidebar.html"
                                                            class="nav-link">Compact With Sidebar</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="listing-grid-compact-full-width.html"
                                                            class="nav-link">Compact Full Width</a>
                                                    </li>
                                                </ul>
                                                <!-- end 2nd level -->
                                            </li>
                                            <li class="nav-item has-child">
                                                <a href="#" class="nav-link">List</a>
                                                <!-- 2nd level -->
                                                <ul class="child">
                                                    <li class="nav-item">
                                                        <a href="listing-list-full-width.html" class="nav-link">Full
                                                            Width</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="listing-list-sidebar.html" class="nav-link">With
                                                            Sidebar</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="listing-list-compact-sidebar.html"
                                                            class="nav-link">Compact With Sidebar</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="listing-list-compact-full-width.html"
                                                            class="nav-link">Compact Full Width</a>
                                                    </li>
                                                </ul>
                                                <!-- end 2nd level -->
                                            </li>
                                            <li class="nav-item has-child">
                                                <a href="#" class="nav-link">Masonry</a>
                                                <!-- 2nd level -->
                                                <ul class="child">
                                                    <li class="nav-item">
                                                        <a href="listing-masonry-full-width.html" class="nav-link">Full
                                                            Width</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="listing-masonry-sidebar.html" class="nav-link">With
                                                            Sidebar</a>
                                                    </li>
                                                </ul>
                                                <!-- end 2nd level -->
                                            </li>
                                            <li class="nav-item has-child">
                                                <a href="#" class="nav-link">Single</a>
                                                <!-- 2nd level -->
                                                <ul class="child">
                                                    <li class="nav-item">
                                                        <a href="single-listing-1.html" class="nav-link">Single 1</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="single-listing-2.html" class="nav-link">Single 2</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="single-listing-3.html" class="nav-link">Single 3</a>
                                                    </li>
                                                </ul>
                                                <!-- end 2nd level -->
                                            </li>
                                        </ul>
                                        <!-- end 1st level -->
                                    </li>
                                    <li class="nav-item has-child">
                                        <a class="nav-link" href="#">Pages</a>
                                        <!-- 2nd level -->
                                        <ul class="child">
                                            <li class="nav-item">
                                                <a href="sellers.html" class="nav-link">Sellers</a>
                                            </li>
                                            <li class="nav-item has-child">
                                                <a href="#" class="nav-link">Seller Detail</a>
                                                <!-- 3rd level -->
                                                <ul class="child">
                                                    <li class="nav-item">
                                                        <a href="seller-detail-1.html" class="nav-link">Seller Detail
                                                            1</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="seller-detail-2.html" class="nav-link">Seller Detail
                                                            2</a>
                                                    </li>
                                                </ul>
                                                <!-- end 3rd level -->
                                            </li>
                                            <li class="nav-item">
                                                <a href="blog.html" class="nav-link">Blog</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="blog-post.html" class="nav-link">Blog Post</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="submit.html" class="nav-link">Submit Ad</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="pricing.html" class="nav-link">Pricing</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="faq.html" class="nav-link">FAQ</a>
                                            </li>
                                        </ul>
                                        <!-- end 2nd level -->
                                    </li>
                                    <li class="nav-item has-child">
                                        <a class="nav-link" href="#">Extras</a>
                                        <!--1st level -->
                                        <ul class="child">
                                            <li class="nav-item has-child">
                                                <a href="#" class="nav-link">Grid Variants</a>
                                                <ul class="child">
                                                    <li class="nav-item">
                                                        <a href="listing-grid-4-items.html" class="nav-link">4 Items</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="listing-grid-3-items.html" class="nav-link">3 Items</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="listing-grid-2-items.html" class="nav-link">2 Items</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="nav-item has-child">
                                                <a href="#" class="nav-link">User Panel</a>
                                                <ul class="child">
                                                    <li class="nav-item">
                                                        <a href="my-profile.html" class="nav-link">My Profile</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="my-ads.html" class="nav-link">My Ads</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="change-password.html" class="nav-link">Change
                                                            Password</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="sign-in.html" class="nav-link">Sign In</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="register.html" class="nav-link">Register</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="nav-item">
                                                <a href="elements.html" class="nav-link">Elements</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="typography.html" class="nav-link">Typography</a>
                                            </li>
                                            <li class="nav-item has-child">
                                                <a href="#" class="nav-link">Nested Navigation</a>
                                                <!--2nd level -->
                                                <ul class="child">
                                                    <li class="nav-item">
                                                        <a href="#" class="nav-link">Level 2</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="#" class="nav-link">Level 2</a>
                                                    </li>
                                                    <li class="nav-item has-child">
                                                        <a href="#" class="nav-link">Level 2</a>
                                                        <!--3rd level -->
                                                        <ul class="child">
                                                            <li class="nav-item has-child">
                                                                <a href="#" class="nav-link">Level 3</a>
                                                                <!--4th level -->
                                                                <ul class="child">
                                                                    <li class="nav-item">
                                                                        <a href="#" class="nav-link">Level 4</a>
                                                                    </li>
                                                                    <li class="nav-item">
                                                                        <a href="#" class="nav-link">Level 4</a>
                                                                    </li>
                                                                    <li class="nav-item">
                                                                        <a href="#" class="nav-link">Level 4</a>
                                                                    </li>
                                                                </ul>
                                                                <!-- end 4th level-->
                                                            </li>
                                                            <li class="nav-item">
                                                                <a href="#" class="nav-link">Level 3</a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a href="#" class="nav-link">Level 3</a>
                                                            </li>
                                                        </ul>
                                                        <!--end 3rd level-->
                                                    </li>
                                                </ul>
                                                <!-- end 2nd level -->
                                            </li>
                                            <li class="nav-item">
                                                <a href="image-header.html" class="nav-link">Image Header</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="messaging.html" class="nav-link">Messages</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="contact.html">Contact</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="submit.html"
                                            class="btn btn-primary text-caps btn-rounded btn-framed">Submit Ad</a>
                                    </li>
                                </ul>
                                <!--Main navigation list-->
                            </div>
                            <!--end navbar-collapse-->
                            <a href="#collapseMainSearchForm" class="main-search-form-toggle" data-toggle="collapse"
                                aria-expanded="false" aria-controls="collapseMainSearchForm">
                                <i class="fa fa-search"></i>
                                <i class="fa fa-close"></i>
                            </a>
                            <!--end main-search-form-toggle-->
                        </nav>
                        <!--end navbar-->
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Library</a></li>
                            <li class="breadcrumb-item active">Data</li>
                        </ol>
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
                        <h2 style="text-align: center;">${SINGLE_ROOM.name}</h2>
                        <h3 style="text-align: center;color: #D3D3D3;">${SINGLE_ROOM.address}</h3>
                        <hr>
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
                            <section style=" margin-bottom: 40px;">
                                <h2>Billing</h2>
                                <c:forEach items="${requestScope.BILL_LIST}" var="bill">
                                    <c:set value="${bill.time}" var="dateString" />
                                    <fmt:parseDate value="${dateString}" var="dateObject"
                                                                            pattern="yyyy-MM-dd HH:mm:ss" />
                                <a href="#" class="">
                                    <div
                                        style="display: flex; max-height: 50px; border: 1px solid #D3D3D3;border-radius: 8px; margin-bottom: 20px;">
                                        <div
                                            style="margin-left: -1px;margin-top: -1px;line-height: 50px;text-align: center;margin-right: 20px; opacity:0.8 ; background-color: #28A745; min-width: 15%; height: 50px; border-radius: 8px 0 0 8px; border: 1px solid #D3D3D3;">
                                            ${fn:toUpperCase(bill.status)}
                                        </div>
                                        <div style="min-width: 70%;">
                                            <div style="margin-right: 50px;">
                                                <p style="display: inline-block;padding-right: 20%; min-width: 219px;">
                                                    Invoice ID: ${bill.id}</p>
                                                <p style="display: inline-block; min-width: 219px;">Start Date:
                                                    <fmt:formatDate value="${dateObject }" pattern="dd/MM/yyyy"/></p>
                                            </div>
                                            <div>
                                                <p style="display: inline-block; min-width: 219px; max-width: 220px;">
                                                    Purpose: ${bill.purpose}</p>
                                                <p style="display: inline-block; min-width: 219px;">Due Date: 01/01/2003
                                                </p>
                                            </div>
                                        </div>
                                        <div
                                            style="text-align: center; line-height: 50px; min-width: 5%; margin-left: -10px;">
                                            <fmt:formatNumber type = "number" pattern="#,###.##" maxFractionDigits = "3" value = "${bill.amount}" var="pat" />
                                            ${fn:replace(pat, ",", ".")} 
                                        </div>
                                    </div>
                                </a>
                                </c:forEach>
<!--                                <a href="#">
                                    <div
                                        style="display: flex; max-height: 55px; border: 1px solid #D3D3D3;border-radius: 8px; margin-bottom: 20px;">
                                        <div
                                            style="margin-left: -1px;margin-top: -1px;line-height: 55px;text-align: center;margin-right: 50px; background-color: #DC3545; min-width: 15%; height: 55px; border-radius: 8px 0 0 8px; border: 1px solid #D3D3D3;">
                                            NOT PAID
                                        </div>
                                        <div style="min-width: 70%;">
                                            <div style="margin-right: 50px;">
                                                <p style="display: inline-block;padding-right: 20%; min-width: 219px;">
                                                    Invoice ID: 123456</p>
                                                <p style="display: inline-block; min-width: 219px;">Start Date:
                                                    12/12/2002</p>
                                            </div>
                                            <div>
                                                <p style="display: inline-block; padding-right: 20%; min-width: 219px;">
                                                    Purpose: Tiền thu</p>
                                                <p style="display: inline-block; min-width: 219px;">Due Date: 01/01/2003
                                                </p>
                                            </div>
                                        </div>
                                        <div
                                            style="text-align: center; line-height: 50px; min-width: 5%; margin-left: -10px;">
                                            3.000.000
                                        </div>
                                    </div>
                                </a>-->

                                <!-- <dl class="columns-1">
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
                                </dl> -->
                                <!-- <a href="#" class="bill-link">
                                    <div class="row"
                                        style="border: 1px solid #D3D3D3; height:50px; width: 60%; border-radius: 10px; border-left: none;">
                                        <div class="column-1" style="background-color: #28A745">
                                            <h2>PAID</h2>
                                        </div>
                                        <div class="column-2">
                                            <p>InvoiceID: 123456</p>
                                            <p>Start date: 27/06/2022</p>
                                            <p>Purpose: banana</p>
                                            <p>Due date: 27/06/2023</p>
                                        </div>
                                        <div class="column-3">
                                            <p>3.000.000VND</p>
                                        </div>
                                    </div>
                                </a> -->
                            </section>
                            <!--end Features-->

                            <hr>

                            <!--Similar Ads-->
                            <section>
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
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-8-->

                                        <!--end col-md-4-->
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="review" class="col-form-label">Your Request</label>
                                                <textarea name="content" id="review" class="form-control" rows="6"
                                                    placeholder="Good seller, I am satisfied."></textarea>
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-12-->
                                    </div>
                                    <div class="d-flex justify-content-between align-items-baseline">
                                        <label>

                                        </label>
                                        <button id="btn_submit" type="submit" class="btn btn-danger">Send request</button>
                                    </div>
                                    <!--end row-->
                                </form>
                                <!--end items.list.compact-->
                            </section>
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
