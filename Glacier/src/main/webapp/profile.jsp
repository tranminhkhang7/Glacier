<%-- 
    Document   : profile
    Created on : May 29, 2022, 10:07:01 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
        <c:set var="user" value="${LOGIN_USER}"/>
        <c:set var="detail" value="${USER_DETAIL}"/>
        <c:if test="${detail.gender.trim() eq 'male'}"><c:set var="male" value="selected"/></c:if>
        <c:if test="${detail.gender.trim() eq 'female'}"><c:set var="female" value="selected"/></c:if>
        
        
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
                            <h1>Thông tin cá nhân</h1>
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

                                    

                                    <a class="nav-link active icon" href="account">
                                        <i class="fa fa-user"></i>Thông tin cá nhận
                                    </a>
                                   <a class="nav-link icon" href="rooms">

                                        <i class="fa fa-heart"></i>Phòng của tôi
                                    </a>
                                    <a class="nav-link icon" href="bookmarks.html">
                                        <i class="fa fa-star"></i>Phòng yêu thích
                                    </a>
                                    <a class="nav-link icon" href="changepassword">
                                        <i class="fa fa-recycle"></i>Thay đổi mật khẩu
                                    </a>
                                </nav>
                            </div>
                            <!--end col-md-3-->
                            <div class="col-md-9">
                                <form class="form" method="POST" action="account">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <h2>Personal Information</h2>
                                            <section>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="title" class="col-form-label">Title</label>
                                                            <select name="newGender" id="title" data-placeholder="Title">                                                              
                                                                <option value="female" ${female}>Mrs</option>
                                                                <option value="male" ${male}>Mr</option>
                                                            </select>
                                                        </div>
                                                        <!--end form-group-->
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="form-group">
                                                            <label for="name" class="col-form-label required">Your Name</label>
                                                            <input name="newName" type="text" class="form-control" id="name" placeholder="Your Name" value="${fn:trim(detail.name)}" required>
                                                        </div>
                                                        <!--end form-group-->
                                                    </div>
                                                    <!--end col-md-8-->
                                                </div>
                                                <!--end row-->
                                                <!-- <div class="form-group">
                                                    <label for="location" class="col-form-label required">Your Location</label>
                                                    <input name="location" type="text" class="form-control" id="input-location2" placeholder="Your Location" value="Manhattan, NY" required>
                                                </div> -->
                                                <!--end form-group-->
                                                <!-- <div class="form-group">
                                                    <label for="about" class="col-form-label">More About You</label>
                                                    <textarea name="about" id="about" class="form-control" rows="4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec tincidunt arcu, sit amet fermentum sem. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</textarea>
                                                </div> -->
                                                <!--end form-group-->
                                            </section>

                                            <section>
                                                <h2>Contact</h2>
                                                <div class="form-group">
                                                    <label for="phone" class="col-form-label">Phone</label>
                                                    <input name="newPhone" type="text" class="form-control" id="phone" placeholder="Your Phone" value="${fn:trim(detail.phone)}">
                                                </div>
                                                <!--end form-group-->
                                                <div class="form-group">
                                                    <label for="email" class="col-form-label">Email</label>
                                                    <input name="email" type="email" class="form-control" id="email" placeholder="Your Email" value="${fn:trim(detail.email)}" readonly="">
                                                </div>
                                                <!--end form-group-->
                                            </section>

                                            <section>
                                                <h2>Social</h2>
                                                <div class="form-group">
                                                    <label for="twitter" class="col-form-label">Instagram</label>
                                                    <input name="newInstagram" type="text" class="form-control" id="twitter" placeholder="http://" value="${fn:trim(detail.instagramLink)}">
                                                </div>
                                                <!--end form-group-->
                                                <div class="form-group">
                                                    <label for="facebook" class="col-form-label">Facebook</label>
                                                    <input name="newFacebook" type="text" class="form-control" id="facebook" placeholder="http://" value="${fn:trim(detail.facebookLink)}">
                                                </div>
                                                <!--end form-group-->
                                            </section>

                                            <section class="clearfix">
                                                <button name="infor" value="submit" type="submit" class="btn btn-primary float-right">Save Changes</button>
                                            </section>
                                        </div>
                                </form>

                                <!--end col-md-8-->
                                <div class="col-md-4">
                                    <div class="profile-image">
                                        <div class="image background-image">
                                            <img src="assets/img/author-09.jpg" alt="">
                                        </div>
                                        <form action="">
                                            <div class="single-file-input">
                                                <input type="file" id="user_image" name="user_image">
                                                <div class="btn btn-framed btn-primary small">Upload a picture</div>
                                            </div>
                                            <div class="single-file-input">
                                                <input type="submit" class="btn btn-primary small" value="Save pics"/>
                                            </div>
                                    </div>
                                    </form>
                                </div>

                                <!--end col-md-3-->
                            </div>

                        </div>
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
            <jsp:include page="header/footer.jsp" />
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

