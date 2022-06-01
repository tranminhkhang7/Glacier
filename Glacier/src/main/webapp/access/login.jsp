<%-- 
    Document   : login
    Created on : May 21, 2022, 3:37:20 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="ThemeStarz">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Varela+Round" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/selectize.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user.css">

        <title>Sign in to Glacier</title>

    </head>
    <body>
        <%
            try {

                Cookie arr[] = request.getCookies();
                if (arr.length > 0) {
                    for (Cookie cookie : arr) {
                        if (cookie.getName().equals("userid")) {
                            request.setAttribute("username", cookie.getValue());
                        }
                        if (cookie.getName().equals("pass")) {
                            request.setAttribute("password", cookie.getValue());
                        }
                    }
                }
            } catch (Exception e) {
                log(e.getMessage());
            }
        %>
        <div class="page sub-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->
            <section class="hero">
                <div class="hero-wrapper">
                    <!--============ Secondary Navigation ===============================================================-->

                    <!--============ End Secondary Navigation ===========================================================-->
                    <!--============ Main Navigation ====================================================================-->
                    <div class="main-navigation">
                        <div class="container">
                            <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                                <a class="navbar-brand" href="index.html">
                                    <img src="assets/img/logo.png" alt="">
                                </a>
                                
                                <!--end navbar-collapse-->
                                <!--                                <a href="#collapseMainSearchForm" class="main-search-form-toggle" data-toggle="collapse"  aria-expanded="false" aria-controls="collapseMainSearchForm">
                                                                    <i class="fa fa-search"></i>
                                                                    <i class="fa fa-close"></i>
                                                                </a>-->
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
                            <h1>Sign In</h1>
                        </div>
                        <!--end container-->
                    </div>
                    <!--============ End Page Title =====================================================================-->
                    <div class="background">
                        <div class="background-image">
                            <img src="${pageContext.request.contextPath}/assets/img/hero-background-image-02.jpg" alt="">
                        </div>
                    </div>

                    <!--end background-->
                </div>
                <!--end hero-wrapper-->
            </section>
            <!--end hero-->

            <!--*********************************************************************************************************-->
            <!--************ CONTENT ************************************************************************************-->
            <!--*********************************************************************************************************-->
            <section class="content">
                <section class="block">
                    <div class="container">
                        <div class="row justify-content-center">
                            <!--div for wrong password or email when login
                            <div class="" style="color: red; background-color: rgb(242, 242, 109); height: 50px; line-height: 50px; text-align: center;">!!! Your email or password is not correct</div>
                            -->

                            <div class="col-md-4">
                                <c:if test="${not empty requestScope.ERROR_MSG}">
                                    <div class="" style="color: red; background-color: rgb(242, 242, 109); height: 50px; line-height: 50px; text-align: center;"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Your email or password is not correct</div>
                                </c:if>
                                <c:if test="${not empty sessionScope.ERROR_MSG}">
                                    <div class="" style="color: red; background-color: rgb(242, 242, 109); height: 50px; line-height: 50px; text-align: center;"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> ${sessionScope.ERROR_MSG}</div>
                                </c:if>
                                <form class="form clearfix" action="${pageContext.request.contextPath}/login" method="post">
                                    <div class="form-group">
                                        <label for="email" class="col-form-label required">Email</label>
                                        <input name="email" type="email" class="form-control" id="email" placeholder="Your Email" value="${username}" required style="width: 95%">
                                    </div>
                                    <!--end form-group-->
                                    <div class="form-group">
                                        <label for="password" class="col-form-label required" style="display: block">Password</label>
                                        <input name="password" type="password" class="form-control" id="password" placeholder="Password" value="${password}" required style="display: inline-block; width: 95%"><i class="fa fa-eye" id="visibilityBtn" style="margin-left: -30px; position: relative; cursor: pointer" onclick="myFunction()"></i>
                                    </div> 
                                    <!--end form-group-->
                                    <div class="d-flex justify-content-between align-items-baseline">
                                        <label>
                                            <input type="checkbox" name="remember" value="1">
                                            Remember Me
                                        </label>
                                        <button type="submit" class="btn btn-primary">Sign In</button>
                                    </div>
                                </form>
                                <hr>
                                <p>
                                    Forgot your password? <a href="forgot.jsp" class="link">Click here.</a>
                                </p>

                                <hr>
                                <p>
                                    Don't have an account yet? <a href="${pageContext.request.contextPath}/register" class="link">Sign-up</a>
                                </p>
                                <hr><p style="font-size:large; text-align: center;">Or Continue With: </p>
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/Glacier/LoginGoogleHandler&response_type=code&client_id=312274839783-ikrqeojtbm6kq3r83i6hgkbee8uib7co.apps.googleusercontent.com&approval_prompt=force">
                                    <img style="display: block; margin-left: auto; margin-right: auto;" src="https://salt.tikicdn.com/ts/upload/1c/ac/e8/141c68302262747f5988df2aae7eb161.png" width="50" height="50" /></a>


                            </div>
                            <!--end col-md-6-->
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
            <section class="footer">
                <div class="wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5">
                                <a href="#" class="brand">
                                    <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="">
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
            </section>
            <!--end footer-->
        </div>
        <!--end page-->
        <script>
            const visibilityBtn = document.getElememtById("visibilityBtn");
            visibilityBtn.addEventListener("click", toogleVisibility);
            function myFunction() {
                const passwordInput = document.getElementById("password");
                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    document.getElementById("visibilityBtn").className = "fa fa-eye-slash";
                } else {
                    passwordInput.type = "password";
                    document.getElementById("visibilityBtn").className = "fa fa-eye";
                }

//                var x = document.getElementById("password");
//                if (x.type === "password") {
//                    x.type = "text";
//                } else {
//                    x.type = "password";
//                }
            }
        </script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
        <script src="${pageContext.request.contextPath}/assets/js/selectize.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/masonry.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/icheck.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

    </body>
</html>

