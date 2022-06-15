<%-- 
    Document   : landlord-manage-single-room
    Created on : Jun 10, 2022, 12:20:40 AM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/selectize.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user.css">

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

        <title>Craigs - Easy Buy & Sell Listing HTML Template</title>

    </head>
    <body style="font-family: 'Varela Round', sans-serif;">

        <div class="popup" id="reportForm">
            <h2>Thông báo cho người thuê</h2>
            <form class="form form-submit" action="${pageContext.request.contextPath}/landlordnotify">
                <input name="id" type="hidden" value="${id}">
                <!--                <div class="form-group">
                                    <label for="title" class="col-form-label required">Tiêu đề</label>
                                    <input name="title" type="text" class="form-control" id="title" placeholder="Mô tả ngắn gọn vấn đề của bạn" autocomplete="off" required>
                                </div>-->
                <div class="form-group">
                    <label for="title" class="col-form-label required">Tiêu đề</label>
                    <input name="title" type="text" class="form-control" id="title" placeholder="Tiêu đề thông báo" autocomplete="off" required>
                </div>
                <div class="form-group">
                    <label for="content" class="col-form-label required">Nội dung thông báo</label>
                    <textarea name="content" type="text" class="form-control" id="content" placeholder="Nội dung thông báo chi tiết" autocomplete="off" required></textarea>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;">Gửi</button>
                </div>
            </form>

            <button class="btn btn-secondary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;" onclick="closeForm()">Hủy</button>
        </div>

        <c:if test="${notify == 'notify success'}">
            <div class="notify" id="notifyBox">
                Thông báo cho người thuê thành công!
                &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-close" onclick="closeNotify()"></i>
            </div>
        </c:if>

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
                                    <a href="${pageContext.request.contextPath}/my-ads.html">
                                        <i class="fa fa-heart"></i>My Ads
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/sign-in.html">
                                        <i class="fa fa-sign-in"></i>Sign In
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/register.html">
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
                                <a class="navbar-brand" href="${pageContext.request.contextPath}/index.html">
                                    <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="">
                                </a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="navbar">
                                    <!--Main navigation list-->
                                    <ul class="navbar-nav">
                                        <li class="nav-item active has-child">
                                            <a class="nav-link" href="${pageContext.request.contextPath}/#">Home</a>
                                            <ul class="child">
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/index.html" class="nav-link">Home 1</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/index-2.html" class="nav-link">Home 2</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/index-3.html" class="nav-link">Home 3</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/index-4.html" class="nav-link">Home 4</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item has-child">
                                            <a class="nav-link" href="${pageContext.request.contextPath}/#">Listing</a>
                                            <!-- 1st level -->
                                            <ul class="child">
                                                <li class="nav-item has-child">
                                                    <a href="${pageContext.request.contextPath}/#" class="nav-link">Grid</a>
                                                    <!-- 2nd level -->
                                                    <ul class="child">
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/listing-grid-full-width.html" class="nav-link">Full Width</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/listing-grid-sidebar.html" class="nav-link">With Sidebar</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/listing-grid-compact-sidebar.html" class="nav-link">Compact With Sidebar</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/listing-grid-compact-full-width.html" class="nav-link">Compact Full Width</a>
                                                        </li>
                                                    </ul>
                                                    <!-- end 2nd level -->
                                                </li>
                                                <li class="nav-item has-child">
                                                    <a href="${pageContext.request.contextPath}/#" class="nav-link">List</a>
                                                    <!-- 2nd level -->
                                                    <ul class="child">
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/listing-list-full-width.html" class="nav-link">Full Width</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/listing-list-sidebar.html" class="nav-link">With Sidebar</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/listing-list-compact-sidebar.html" class="nav-link">Compact With Sidebar</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/listing-list-compact-full-width.html" class="nav-link">Compact Full Width</a>
                                                        </li>
                                                    </ul>
                                                    <!-- end 2nd level -->
                                                </li>
                                                <li class="nav-item has-child">
                                                    <a href="${pageContext.request.contextPath}/#" class="nav-link">Masonry</a>
                                                    <!-- 2nd level -->
                                                    <ul class="child">
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/listing-masonry-full-width.html" class="nav-link">Full Width</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/listing-masonry-sidebar.html" class="nav-link">With Sidebar</a>
                                                        </li>
                                                    </ul>
                                                    <!-- end 2nd level -->
                                                </li>
                                                <li class="nav-item has-child">
                                                    <a href="${pageContext.request.contextPath}/#" class="nav-link">Single</a>
                                                    <!-- 2nd level -->
                                                    <ul class="child">
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/single-listing-1.html" class="nav-link">Single 1</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/single-listing-2.html" class="nav-link">Single 2</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/single-listing-3.html" class="nav-link">Single 3</a>
                                                        </li>
                                                    </ul>
                                                    <!-- end 2nd level -->
                                                </li>
                                            </ul>
                                            <!-- end 1st level -->
                                        </li>
                                        <li class="nav-item has-child">
                                            <a class="nav-link" href="${pageContext.request.contextPath}/#">Pages</a>
                                            <!-- 2nd level -->
                                            <ul class="child">
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/sellers.html" class="nav-link">Sellers</a>
                                                </li>
                                                <li class="nav-item has-child">
                                                    <a href="${pageContext.request.contextPath}/#" class="nav-link">Seller Detail</a>
                                                    <!-- 3rd level -->
                                                    <ul class="child">
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/seller-detail-1.html" class="nav-link">Seller Detail
                                                                1</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/seller-detail-2.html" class="nav-link">Seller Detail
                                                                2</a>
                                                        </li>
                                                    </ul>
                                                    <!-- end 3rd level -->
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/blog.html" class="nav-link">Blog</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/blog-post.html" class="nav-link">Blog Post</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/submit.html" class="nav-link">Submit Ad</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/pricing.html" class="nav-link">Pricing</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/faq.html" class="nav-link">FAQ</a>
                                                </li>
                                            </ul>
                                            <!-- end 2nd level -->
                                        </li>
                                        <li class="nav-item has-child">
                                            <a class="nav-link" href="${pageContext.request.contextPath}/#">Extras</a>
                                            <!--1st level -->
                                            <ul class="child">
                                                <li class="nav-item has-child">
                                                    <a href="${pageContext.request.contextPath}/#" class="nav-link">Grid Variants</a>
                                                    <ul class="child">
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/listing-grid-4-items.html" class="nav-link">4 Items</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/listing-grid-3-items.html" class="nav-link">3 Items</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/listing-grid-2-items.html" class="nav-link">2 Items</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="nav-item has-child">
                                                    <a href="${pageContext.request.contextPath}/#" class="nav-link">User Panel</a>
                                                    <ul class="child">
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/my-profile.html" class="nav-link">My Profile</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/my-ads.html" class="nav-link">My Ads</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/change-password.html" class="nav-link">Change
                                                                Password</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/sign-in.html" class="nav-link">Sign In</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/register.html" class="nav-link">Register</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/elements.html" class="nav-link">Elements</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/typography.html" class="nav-link">Typography</a>
                                                </li>
                                                <li class="nav-item has-child">
                                                    <a href="${pageContext.request.contextPath}/#" class="nav-link">Nested Navigation</a>
                                                    <!--2nd level -->
                                                    <ul class="child">
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/#" class="nav-link">Level 2</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="${pageContext.request.contextPath}/#" class="nav-link">Level 2</a>
                                                        </li>
                                                        <li class="nav-item has-child">
                                                            <a href="${pageContext.request.contextPath}/#" class="nav-link">Level 2</a>
                                                            <!--3rd level -->
                                                            <ul class="child">
                                                                <li class="nav-item has-child">
                                                                    <a href="${pageContext.request.contextPath}/#" class="nav-link">Level 3</a>
                                                                    <!--4th level -->
                                                                    <ul class="child">
                                                                        <li class="nav-item">
                                                                            <a href="${pageContext.request.contextPath}/#" class="nav-link">Level 4</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a href="${pageContext.request.contextPath}/#" class="nav-link">Level 4</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a href="${pageContext.request.contextPath}/#" class="nav-link">Level 4</a>
                                                                        </li>
                                                                    </ul>
                                                                    <!-- end 4th level-->
                                                                </li>
                                                                <li class="nav-item">
                                                                    <a href="${pageContext.request.contextPath}/#" class="nav-link">Level 3</a>
                                                                </li>
                                                                <li class="nav-item">
                                                                    <a href="${pageContext.request.contextPath}/#" class="nav-link">Level 3</a>
                                                                </li>
                                                            </ul>
                                                            <!--end 3rd level-->
                                                        </li>
                                                    </ul>
                                                    <!-- end 2nd level -->
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/image-header.html" class="nav-link">Image Header</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/messaging.html" class="nav-link">Messages</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="${pageContext.request.contextPath}/contact.html">Contact</a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/submit.html" class="btn btn-primary text-caps btn-rounded btn-framed">Submit Ad</a>
                                        </li>
                                    </ul>
                                    <!--Main navigation list-->
                                </div>
                                <!--end navbar-collapse-->
                            </nav>
                            <!--end navbar-->
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/#">Home</a></li>
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/#">Library</a></li>
                                <li class="breadcrumb-item active">Data</li>
                            </ol>
                            <!--end breadcrumb-->
                        </div>
                        <!--end container-->
                    </div>
                    <!--============ End Main Navigation ================================================================-->
                    <!--============ Page Title =========================================================================-->
                    <div class="page-title">
                        <div class="container">
                            <h1>Quản lý phòng (temporary)</h1>
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
                            <div class="col-md-12">

                                <section>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <form method="get" action="${pageContext.request.contextPath}/hehealo1234">
                                                <button href="dadhakhkfha" class="btn btn-primary width-100">Xem giao diện phòng và đánh giá</button>
                                            </form>
                                        </div>
                                        <div class="col-md-6">
                                            <button type="submit" class="btn btn-primary width-100" onclick="openForm()">Tạo thông báo</button>
                                        </div>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <div class="col-md-6">
                                            <button type="submit" class="btn btn-primary width-100" onclick="openForm()">Tạo hóa đơn</button>
                                        </div>
                                        <div class="col-md-6">
                                            <button type="submit" class="btn btn-primary width-100" onclick="openForm()">Người thuê muốn rời đi</button>
                                        </div>

                                    </div>
                                </section>

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
                                <a href="${pageContext.request.contextPath}/#" class="brand">
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
                                                    <a href="${pageContext.request.contextPath}/#">Home</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/#">Listing</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/#">Pages</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/#">Extras</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/#">Contact</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/#">Submit Ad</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <nav>
                                            <ul class="list-unstyled">
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/#">My Ads</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/#">Sign In</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/#">Register</a>
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
                                    <strong>Email:</strong> <a href="${pageContext.request.contextPath}/#">hello@example.com</a>
                                    <br>
                                    <strong>Skype: </strong> Craigs
                                    <br>
                                    <br>
                                    <a href="${pageContext.request.contextPath}/contact.html" class="btn btn-primary text-caps btn-framed">Contact Us</a>
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
                                                function openForm() {
                                                    document.getElementsByClassName("page")[0].style.filter = "blur(8px)";
                                                    document.getElementById("reportForm").style.display = "block";
                                                }

                                                function closeForm() {
                                                    document.getElementsByClassName("page")[0].style.filter = "none";
                                                    document.getElementById("reportForm").style.display = "none";
                                                }
                                                function closeNotify() {
                                                    document.getElementById("notifyBox").style.display = "none";
                                                }
        </script>
    </body>
</html>

