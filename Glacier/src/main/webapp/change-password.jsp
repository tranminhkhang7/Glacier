<%-- 
    Document   : change-password
    Created on : May 31, 2022, 7:46:06 PM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/selectize.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user.css">

        <title>Craigs - Easy Buy & Sell Listing HTML Template</title>

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
                            <h1>Thay đổi mật khẩu</h1>
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
                                        <i class="fa fa-user"></i>My Profile
                                    </a>
                                    <a class="nav-link icon" href="rooms">
                                        <i class="fa fa-heart"></i>My Rooms Listing

            <!--*********************************************************************************************************-->
            <!--************ CONTENT ************************************************************************************-->
            <!--*********************************************************************************************************-->
            <section class="content">
                <section class="block">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <nav class="nav flex-column side-nav">
                                    <a class="nav-link icon" href="profile.jsp">
                                        <i class="fa fa-user"></i>Thông tin cá nhận

                                    </a>
                                    <!--                                    <a class="nav-link icon" href="my-ads.html">
                                                                            <i class="fa fa-heart"></i>My Rooms Listing
                                                                        </a>-->
                                    <a class="nav-link icon" href="bookmarks.html">
                                        <i class="fa fa-star"></i>Phòng yêu thích
                                    </a>
                                    <a class="nav-link active icon" href="changepassword">
                                        <i class="fa fa-recycle"></i>Thay đổi mật khẩu
                                    </a>

                            </nav>
                        </div>
                        <!--end col-md-3-->
                        <div class="col-md-9">
                            <form class="form" action="changepassword" method="POST">
                                <div class="row justify-content-center">
                                    <div class="col-md-6">
                                <c:if test="${not empty requestScope.CHANGE_PASSWORD_ERROR_MSG}">
                                    <div class="" style="color: red; background-color: rgb(242, 242, 109); height: 50px; line-height: 50px; text-align: center;"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> ${CHANGE_PASSWORD_ERROR_MSG}</div>
                                </c:if>
                                        <div class="form-group">
                                            <label for="current_password" class="col-form-label required">Current Password</label>
                                            <input name="current_password" type="password" class="form-control" id="current_password" placeholder="Current Password" required>
                                </nav>
                            </div>
                            <!--end col-md-3-->
                            <div class="col-md-9">
                                <form class="form" action="changepassword" method="POST">
                                    <div class="row justify-content-center">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <c:if test="${not empty error}">
                                                    <b><span style="text-align: right; color: red">${error}</span></b>
                                                    <br>
                                                    <br>
                                                </c:if>
                                                <c:if test="${not empty success}">
                                                    <b><span style="text-align: right; color: green">${success}</span></b>
                                                    <br>
                                                    <br>
                                                </c:if>
                                                <label for="current_password" class="col-form-label required">Mật khẩu hiện tại</label>
                                                <input name="current_password" type="password" class="form-control" id="current_password" placeholder="Nhập mật khẩu hiện tại cùa bạn" required>
                                            </div>
                                            <!--end form-group-->
                                            <div class="form-group">
                                                <label for="new_current_password" class="col-form-label required">Mật khẩu mới</label>
                                                <input name="new_current_password" type="password" class="form-control" id="new_current_password" placeholder="Nhập mật khẩu mới" required>
                                            </div>
                                            <!--end form-group-->
                                            <div class="form-group">
                                                <label for="repeat_new_current_password" class="col-form-label required">Nhập lại mật khẩu mới</label>
                                                <input name="repeat_new_current_password" type="password" class="form-control" id="repeat_new_current_password" placeholder="Nhập lại mật khẩu mới" required onkeyup="check()">
                                                <br>
                                                <b><span id="message" style="text-align: right;"></span></b>
                                            </div>
                                            <!--end form-group-->
                                            <button type="submit" class="btn btn-primary float-right">Hoàn tất</button>
>>>>>>> b48d8c4469c0324c49e9a3856db8500e79a1a1a6
                                        </div>
                                        <!--end col-md-6-->
                                    </div>
                                </form>
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
            <jsp:include page="header/footer.jsp" />F
            <!--end footer-->
        </div>
        <!--end page-->

        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
        <script src="${pageContext.request.contextPath}/assets/js/selectize.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/masonry.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/icheck.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
        <script>
                                                    function check() {
                                                        var length = document.getElementById("repeat_new_current_password").value.length;
                                                        if (length < 5 || length > 30) {
                                                            document.getElementById("message").innerHTML = "Mật khẩu phải có 6-30 kí tự";
                                                            document.getElementById("message").style.color = "red";
                                                        } else {
                                                            if (document.getElementById("new_current_password").value === document.getElementById("repeat_new_current_password").value) {
                                                                document.getElementById("message").innerHTML = "✔ Mật khẩu trùng khớp";
                                                                document.getElementById("message").style.color = "green";
                                                            } else {
                                                                document.getElementById("message").innerHTML = "✖ Mật khẩu không trùng khớp";
                                                                document.getElementById("message").style.color = "red";
                                                            }
                                                        }
                                                    }
        </script>
    </body>
</html>

