<%-- 
    Document   : SearchRoomController
    Created on : May 22, 2022, 11:57:29 PM
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

        <title>Search</title>

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
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
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
                                                            <a href="listing-grid-full-width.html" class="nav-link">Full Width</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="listing-grid-sidebar.html" class="nav-link">With Sidebar</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="listing-grid-compact-sidebar.html" class="nav-link">Compact With Sidebar</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="listing-grid-compact-full-width.html" class="nav-link">Compact Full Width</a>
                                                        </li>
                                                    </ul>
                                                    <!-- end 2nd level -->
                                                </li>
                                                <li class="nav-item has-child">
                                                    <a href="#" class="nav-link">List</a>
                                                    <!-- 2nd level -->
                                                    <ul class="child">
                                                        <li class="nav-item">
                                                            <a href="listing-list-full-width.html" class="nav-link">Full Width</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="listing-list-sidebar.html" class="nav-link">With Sidebar</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="listing-list-compact-sidebar.html" class="nav-link">Compact With Sidebar</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="listing-list-compact-full-width.html" class="nav-link">Compact Full Width</a>
                                                        </li>
                                                    </ul>
                                                    <!-- end 2nd level -->
                                                </li>
                                                <li class="nav-item has-child">
                                                    <a href="#" class="nav-link">Masonry</a>
                                                    <!-- 2nd level -->
                                                    <ul class="child">
                                                        <li class="nav-item">
                                                            <a href="listing-masonry-full-width.html" class="nav-link">Full Width</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="listing-masonry-sidebar.html" class="nav-link">With Sidebar</a>
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
                                            <a href="submit.html" class="btn btn-primary text-caps btn-rounded btn-framed">Submit Ad</a>
                                        </li>
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
                        <form class="hero-form form" action="${pageContext.request.contextPath}/search" method="get">
                            <div class="container">
                                <!--Main Form-->
                                <div class="main-search-form">
                                    <div class="form-row">
                                        <div class="col-md-9 col-sm-9">
                                            <div class="form-group">
                                                <label for="what" class="col-form-label">What?</label>
                                                <input name="keyword" type="text" class="form-control small" id="what" placeholder="What are you looking for?">
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-9-->

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
                            <h1>Are these what you looking for hello?</h1>
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
                        <!--============ Section Title===================================================================-->
                        <div class="section-title clearfix">
                            <div class="float-left float-xs-none">
                                <label class="mr-3 align-text-bottom">Sort by: </label>
                                <select name="sorting" id="sorting" class="small width-200px" data-placeholder="Default Sorting" >
                                    <option value="">Default Sorting</option>
                                    <option value="1">Newest First</option>
                                    <option value="2">Oldest First</option>
                                    <option value="3">Lowest Price First</option>
                                    <option value="4">Highest Price First</option>
                                </select>

                            </div>
                            <div class="float-right d-xs-none thumbnail-toggle">
                                <a href="#" class="change-class active" data-change-from-class="list" data-change-to-class="grid" data-parent-class="items">
                                    <i class="fa fa-th"></i>
                                </a>
                                <a href="#" class="change-class" data-change-from-class="grid" data-change-to-class="list" data-parent-class="items">
                                    <i class="fa fa-th-list"></i>
                                </a>
                            </div>
                        </div>
                        <!--============ Items ==========================================================================-->
                        <div class="items grid grid-xl-4-items grid-lg-4-items grid-md-4-items">

                            <c:forEach items="${requestScope.list}" var="room">
                                <div class="item">
                                    <!--<div class="ribbon-featured">Featured</div>-->
                                    <!--end ribbon-->
                                    <div class="wrapper">
                                        <div class="image">
                                            <h3>
                                                <!--<a href="#" class="tag category">Home & Decor</a>-->
                                                <a href="single-listing-1.html" class="title">${room.name}</a>
                                                <!--<span class="tag">Offer</span>-->
                                            </h3>
                                            <a href="single-listing-1.html" class="image-wrapper background-image">
                                                <img src="assets/img/image-01.jpg" alt="">
                                            </a>
                                        </div>
                                        <!--end image-->
                                        <h4 class="location">
                                            <a href="#">${room.address}</a>
                                        </h4>
                                        <div class="price">${room.price}đ</div>
                                        <div class="meta">
                                            <figure>
                                                <i class="fa fa-calendar-o"></i>${room.date_added}
                                            </figure>
                                            <figure>
                                                <a href="#">
                                                    <i class="fa fa-user"></i>${room.emailLandlord}
                                                </a>
                                            </figure>
                                        </div>
                                        <!--end meta-->
                                        <div class="description">
                                            <p>${room.description}</p>
                                        </div>
                                        <!--end description-->
                                        <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                                    </div>
                                </div>
                                <!--end item-->
                            </c:forEach>




                        </div>
                        <!--============ End Items ======================================================================-->
                        <div class="page-pagination">
                            <nav aria-label="Pagination">
                                <ul class="pagination">

<!--                                    <li class="page-item active">
                                        <a class="page-link" href="#">1</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">2</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">3</a>
                                    </li>-->

                                    <c:forEach begin="1" end="${endPage}" step="1" var="i">
                                        <c:choose>
                                            <c:when test="${currentPage == i}">
                                                <li class="page-item active">
                                                    <a class="page-link" href="?keyword=${searchText}&index=${i}">${i}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link" href="?keyword=${searchText}&index=${i}">${i}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                    



                                </ul>
                            </nav>
                        </div>
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

    </body>
</html>

