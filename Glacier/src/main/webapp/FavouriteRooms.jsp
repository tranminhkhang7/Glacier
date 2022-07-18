<%-- 
    Document   : FavouriteRooms
    Created on : Jun 14, 2022, 1:43:49 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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

	<title>Phòng yêu thích · Glacier</title>

</head>
<body style="font-family: 'Varela Round', sans-serif;">
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
                        <h1>Phòng yêu thích</h1>
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
                    <div class="row">
                            <div class="col-md-3">
                                <nav class="nav flex-column side-nav">
                                    <a class="nav-link icon" href="account">
                                        <i class="fa fa-user"></i>Thông tin cá nhận
                                    </a>
                                   <a class="nav-link icon" href="rooms">

                                        <i class="fa fa-heart"></i>Phòng của tôi
                                    </a>
                                    <a class="nav-link icon active " href="Favourite">
                                        <i class="fa fa-star"></i>Phòng yêu thích
                                    </a>
                                    <a class="nav-link icon" href="changepassword">
                                        <i class="fa fa-recycle"></i>Thay đổi mật khẩu
                                    </a>
                                </nav>
                            </div>
                        <!--end col-md-3-->
                        <div class="col-md-9">
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
                                    <a href="#" class="change-class" data-change-from-class="list" data-change-to-class="grid" data-parent-class="items">
                                        <i class="fa fa-th"></i>
                                    </a>
                                    <a href="#" class="change-class active" data-change-from-class="grid" data-change-to-class="list" data-parent-class="items">
                                        <i class="fa fa-th-list"></i>
                                    </a>
                                </div>
                            </div>
                            <!--============ Items ==========================================================================-->
                            <div class="items list compact grid-xl-3-items grid-lg-3-items grid-md-2-items">
                                <c:forEach items="${FRL}" var="FRoom">
                                    <div class="item">
                                        <div class="ribbon-vertical">
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <!--end ribbon-vertical-->
                                        <div class="wrapper">
                                            <div class="image">
                                                <h3 class="">
<!--                                                    <a href="#" class="tag category">Home & Decor</a>-->
                                                    <a href="SingleRoomView?id=${FRoom.room.roomID}" class="title">${FRoom.room.name}</a><!--
                                                    <span class="tag">Offer</span>-->
                                                </h3>
                                                <a href="SingleRoomView?id=${FRoom.room.roomID}" class="image-wrapper background-image">
                                                    <img src="assets/img/image-01.jpg" alt="">
                                                </a>
                                            </div>
                                            <!--end image-->
                                            <h4 class="location">
                                                <a href="#">${FRoom.room.address}</a>
                                            </h4>
                                            <div class="price priceStyle">${FRoom.room.price}đ</div>
                                            <div class="meta">
                                                <figure>
                                                    <i class="fa fa-calendar-o"></i>
                                                    <fmt:formatDate pattern = "yyyy-MM-dd" value = "${FRoom.room.date_added}" />
                                                </figure>
                                                <figure>
                                                    <a href="#">
                                                        <i class="fa fa-user">${FRoom.landLord}</i>
                                                    </a>
                                                </figure>
                                            </div>
                                            <!--end meta-->
                                            <div class="description">
                                                <p>${FRoom.room.description}</p>
                                            </div>
                                            <!--end description-->
                                            <div class="additional-info">
                                                <ul>
                                                    <li>
                                                        <figure>Area</figure>
                                                        <aside>368m<sup>2</sup></aside>
                                                    </li>
                                                    <li>
                                                        <figure>Bathrooms</figure>
                                                        <aside>2</aside>
                                                    </li>
                                                    <li>
                                                        <figure>Bedrooms</figure>
                                                        <aside>3</aside>
                                                    </li>
                                                    <li>
                                                        <figure>Garage</figure>
                                                        <aside>1</aside>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!--end addition-info-->
                                            <a href="SingleRoomView?id=${FRoom.room.roomID}" class="detail text-caps underline">Detail</a>
                                        </div>
                                    </div>
                                </c:forEach>
                                
                                <!--end item-->

<!--                                <div class="item">
                                    <div class="ribbon-vertical">
                                        <i class="fa fa-star"></i>
                                    </div>
                                    end ribbon-vertical
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
                                    <div class="ribbon-vertical">
                                        <i class="fa fa-star"></i>
                                    </div>
                                    end ribbon-vertical
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

                                <div class="item">
                                    <div class="ribbon-vertical">
                                        <i class="fa fa-star"></i>
                                    </div>
                                    end ribbon-vertical
                                    <div class="wrapper">
                                        <div class="image">
                                            <h3>
                                                <a href="#" class="tag category">Real Estate</a>
                                                <a href="single-listing-1.html" class="title">Luxury Apartment</a>
                                                <span class="tag">Offer</span>
                                            </h3>
                                            <a href="single-listing-1.html" class="image-wrapper background-image">
                                                <img src="assets/img/image-04.jpg" alt="">
                                            </a>
                                        </div>
                                        end image
                                        <h4 class="location">
                                            <a href="#">Greeley, CO</a>
                                        </h4>
                                        <div class="price">$75,000</div>
                                        <div class="meta">
                                            <figure>
                                                <i class="fa fa-calendar-o"></i>13.03.2017
                                            </figure>
                                            <figure>
                                                <a href="#">
                                                    <i class="fa fa-user"></i>Hills Estate
                                                </a>
                                            </figure>
                                        </div>
                                        end meta
                                        <div class="description">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis lobortis</p>
                                        </div>
                                        end description
                                        <div class="additional-info">
                                            <ul>
                                                <li>
                                                    <figure>Area</figure>
                                                    <aside>368m<sup>2</sup></aside>
                                                </li>
                                                <li>
                                                    <figure>Bathrooms</figure>
                                                    <aside>2</aside>
                                                </li>
                                                <li>
                                                    <figure>Bedrooms</figure>
                                                    <aside>3</aside>
                                                </li>
                                                <li>
                                                    <figure>Garage</figure>
                                                    <aside>1</aside>
                                                </li>
                                            </ul>
                                        </div>
                                        end addition-info
                                        <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                                    </div>
                                </div>
                                end item

                                <div class="item">
                                    <div class="ribbon-vertical">
                                        <i class="fa fa-star"></i>
                                    </div>
                                    end ribbon-vertical
                                    <div class="wrapper">
                                        <div class="image">
                                            <h3>
                                                <a href="#" class="tag category">Architecture</a>
                                                <a href="single-listing-1.html" class="title">We'll Redesign Your Apartment</a>
                                                <span class="tag">Offer</span>
                                            </h3>
                                            <a href="single-listing-1.html" class="image-wrapper background-image">
                                                <img src="assets/img/image-05.jpg" alt="">
                                            </a>
                                        </div>
                                        end image
                                        <h4 class="location">
                                            <a href="#">Greeley, CO</a>
                                        </h4>
                                        <div class="price">
                                            <span class="appendix">From</span>
                                            $200
                                        </div>
                                        <div class="meta">
                                            <figure>
                                                <i class="fa fa-calendar-o"></i>13.03.2017
                                            </figure>
                                            <figure>
                                                <a href="#">
                                                    <i class="fa fa-user"></i>XL Designers
                                                </a>
                                            </figure>
                                        </div>
                                        end meta
                                        <div class="description">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis lobortis</p>
                                        </div>
                                        end description
                                        <div class="additional-info">
                                            <ul>
                                                <li>
                                                    <figure>Area</figure>
                                                    <aside>368m<sup>2</sup></aside>
                                                </li>
                                                <li>
                                                    <figure>Bathrooms</figure>
                                                    <aside>2</aside>
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
                                    <div class="ribbon-vertical">
                                        <i class="fa fa-star"></i>
                                    </div>
                                    end ribbon-vertical
                                    <div class="wrapper">
                                        <div class="image">
                                            <h3>
                                                <a href="#" class="tag category">Cars</a>
                                                <a href="single-listing-1.html" class="title">Car Wheels</a>
                                                <span class="tag">Offer</span>
                                            </h3>
                                            <a href="single-listing-1.html" class="image-wrapper background-image">
                                                <img src="assets/img/image-18.jpg" alt="">
                                            </a>
                                        </div>
                                        end image
                                        <h4 class="location">
                                            <a href="#">Bryan, TX</a>
                                        </h4>
                                        <div class="price">
                                            <span class="appendix">From</span>
                                            $140
                                        </div>
                                        <div class="meta">
                                            <figure>
                                                <i class="fa fa-calendar-o"></i>12.10.2016
                                            </figure>
                                            <figure>
                                                <a href="#">
                                                    <i class="fa fa-user"></i>George R. Mund
                                                </a>
                                            </figure>
                                        </div>
                                        end meta
                                        <div class="description">
                                            <p>Duis tempor velit vel lectus viverra, et finibus justo semper. Morbi egestas elit et
                                                orci interdum, ac tincidunt diam feugiat. Aliquam erat volutpat. Lorem ipsum dolor
                                                sit amet, consectetur adipiscing elit
                                            </p>
                                        </div>
                                        end description
                                        <div class="additional-info">
                                            <ul>
                                                <li>
                                                    <figure>Size</figure>
                                                    <aside>From 17"</aside>
                                                </li>
                                                <li>
                                                    <figure>Material</figure>
                                                    <aside>Alloy</aside>
                                                </li>
                                            </ul>
                                        </div>
                                        end addition-info
                                        <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                                    </div>
                                </div>
                                end item

                                <div class="item">
                                    <div class="ribbon-vertical">
                                        <i class="fa fa-star"></i>
                                    </div>
                                    end ribbon-vertical
                                    <div class="wrapper">
                                        <div class="image">
                                            <h3>
                                                <a href="#" class="tag category">Computer</a>
                                                <a href="single-listing-1.html" class="title">Will Buy MacBook Pro</a>
                                                <span class="tag">Demand</span>
                                            </h3>
                                            <a href="single-listing-1.html" class="image-wrapper background-image">
                                                <img src="assets/img/image-19.jpg" alt="">
                                            </a>
                                        </div>
                                        end image
                                        <h4 class="location">
                                            <a href="#">Elmsford, NJ</a>
                                        </h4>
                                        <div class="price">
                                            <span class="appendix">Max</span>
                                            $2,500
                                        </div>
                                        <div class="meta">
                                            <figure>
                                                <i class="fa fa-calendar-o"></i>10.10.2016
                                            </figure>
                                            <figure>
                                                <a href="#">
                                                    <i class="fa fa-user"></i>Timothy
                                                </a>
                                            </figure>
                                        </div>
                                        end meta
                                        <div class="description">
                                            <p>Quisque in tincidunt quam, quis blandit orci. Proin semper leo mi, efficitur lacinia nunc blandit ac.
                                                Vestibulum congue at justo semper dignissim.
                                            </p>
                                        </div>
                                        end description
                                        <div class="additional-info">
                                            <ul>
                                                <li>
                                                    <figure>Screen Size</figure>
                                                    <aside>17"</aside>
                                                </li>
                                            </ul>
                                        </div>
                                        end addition-info
                                        <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                                    </div>
                                </div>
                                end item

                            </div>
                            end items-->
                            <!--============ End Items ==============================================================-->
                            
                            
                            <!--end page-pagination-->
                        </div>
                            <div class="page-pagination">
                                <nav aria-label="Pagination">
                                    <ul class="pagination">
                                        <c:forEach begin="1" end="${endPage}" step="1" var="i">
                                            <c:choose>
                                                <c:when test="${currentPage == i}">
                                                    <li class="page-item active">
                                                        <a class="page-link" href="?index=${i}">${i}</a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item">
                                                        <a class="page-link" href="?index=${i}">${i}</a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </ul>
                                </nav>
                            </div>
                        <!--end col-md-9-->
                    </div>
                    <!--end row-->
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
