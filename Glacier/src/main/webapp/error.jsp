<%-- 
    Document   : error
<<<<<<< HEAD
    Created on : May 31, 2022, 1:46:54 PM
    Author     : Admin
=======
    Created on : May 28, 2022, 12:51:44 PM
    Author     : ASUS
>>>>>>> dc88e9094f7bd57c4d3a69c34569754f0eac11a2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/user.css">

        <title>LỖI</title>

    </head>
    <body style="font-family: 'Varela Round', sans-serif;">
        <div class="page sub-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->
            <header class="hero">
                <div class="hero-wrapper">
                    <c:if test="${LOGIN_USER.role=='admin'}">
                        <jsp:include page="header/navigation-admin.jsp" />
                    </c:if>
                    <c:if test="${LOGIN_USER.role=='tenant'}">
                        <jsp:include page="header/navigation-landlord.jsp" />
                    </c:if>
                    <c:if test="${LOGIN_USER.role=='landlord'}">
                        <jsp:include page="header/navigation-tenant-home.jsp" />
                    </c:if>

                    <!--============ Page Title =========================================================================-->
                    <div class="page-title">
                        <div class="container">
                            <h1 class="opacity-80 center" style="color: red">
                                Có Lỗi Rồi
                            </h1>
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

            <section class="content center">
                <section class="block">
                    <h1>Có vấn đề gì đó rồi... </h1>
                    <h2 style="color: red">${error}</h2>
                    <!-- errCode=null >> no error code for all other error when using tenant role -->
                    <c:if test="${errCode==null}">
                        <a href="./home" class="btn btn-danger btn-framed"> Quay về Trang chủ! </a>
                    </c:if>
                    <!-- errCode=1 >> WRONG PRIVILLAGE WHEN USING LANDLORD role -->
                    <c:if test="${errCode==1}">
                        <a href="./roomlist" class="btn btn-danger btn-framed"> Quay về Trang chủ! </a>
                    </c:if>
                    <!-- errCode=2 >> WRONG PRIVILLAGE WHEN USING ADMIN role -->
                    <c:if test="${errCode==2}">
                        <a href="./manage" class="btn btn-danger btn-framed"> Quay về Trang chủ! </a>
                    </c:if>    
                </section>
            </section>
            <!--end content-->

            <!--*********************************************************************************************************-->
            <!--************ FOOTER *************************************************************************************-->
            <!--*********************************************************************************************************-->
            <c:if test="${LOGIN_USER.role=='admin'}">
                <jsp:include page="header/footer-admin.jsp" />
            </c:if>
            <c:if test="${LOGIN_USER.role!='admin'}">
                <footer class="footer">
                    <div class="wrapper">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-5">
                                    <a href="#" class="brand">
                                        <img src="assets/img/logo.png" alt="">
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
                                                        <a href="admin.jsp">Trang chủ</a>
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
                                        <!--                        <figure>
                                                                    D1 Street,Long Thanh My<br> 
                                                                    Thu Duc city, Ho Chi Minh city
                                                                </figure>-->
                                        <br>
                                        <strong>Email:</strong> <a href="#">glacier.hostel@gmail.com</a>
                                        <br>
                                        <strong>Phone: </strong> +1 123 456 789
                                        <br>
                                        <br>
                                        <a href="contact.html" class="btn btn-primary text-caps btn-framed">LIÊN HỆ</a>
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
            </c:if>

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


