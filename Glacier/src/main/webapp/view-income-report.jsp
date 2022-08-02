<%-- 
    Document   : profile
    Created on : May 29, 2022, 10:07:01 AM
    Author     : ASUS
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="glacier.user.model.Landlord"%>
<%@page import="glacier.landlord.dbmanager.LandlordManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
    <body style="font-family: 'Varela Round', sans-serif;" onload="myFunc(${requestScope.LIST}, ['${requestScope.TYPE}'])">
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

                    <jsp:include page="header/navigation-landlord.jsp" />

                    <!--============ Hero Form ==========================================================================-->

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
                                    <a class="nav-link icon" href="landlord-profile.jsp">
                                        <i class="fa fa-user"></i>Thông tin cá nhận
                                    </a>
                                    <!--<a class="nav-link icon" href="my-ads.html">
                                    <i class="fa fa-heart"></i>My Rooms Listing
                                    </a>-->
                                    <a class="nav-link icon" href="bookmarks.html">
                                        <i class="fa fa-star"></i>Phòng yêu thích
                                    </a>
                                    <a class="nav-link icon" href="changepassword">
                                        <i class="fa fa-recycle"></i>Thay đổi mật khẩu
                                    </a>
                                    <a class="nav-link icon" href="IncomeReportController?room=all&time=all">
                                        <i class="fa fa-bar-chart"></i>Biểu đồ thống kê
                                    </a>
                                </nav>
                            </div>
                            <!--end col-md-3-->
                            <div class="col-md-9">
                                <div class="items list">
                                    <div class="item">
                                        <div class="wrapper">
                                            <table border="0" class="center">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 1000px; padding: 10px; color: red"><h2>Tổng số lượt thuê</h2></th>
                                                        <th style="width: 1000px; padding: 10px; color: red"><h2>Phòng được thuê nhiều nhất</h2></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <%
                                                            LandlordManager dao = new LandlordManager();
                                                            String email = (String) request.getAttribute("EMAIL");
                                                        %>
                                                        <td style="width: 50%; padding: 5px"><h2><%= dao.getRentingTimes(email)%></h2></td>
                                                        <td style="width: 50%; padding: 5px"><h2><%= dao.getMostRented(email)%></h2></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                    <!--end item-->
                                </div>
                                <form action="IncomeReportController">
                                    <div class="col-md-3 col-sm-3 float-right">
                                        <button type="submit" class="btn btn-primary width-70">Xác nhận</button>
                                    </div>
                                    <div class="float-right col-md-3">
                                        <select name="time" id="time" class="small" data-placeholder="Time">
                                            <option value="">Thời gian</option>
                                            <option value="all">Tất cả</option>
                                            <option value="2022">2022</option>
                                            <option value="2021">2021</option>
                                            <option value="2020">2020</option>
                                        </select>
                                    </div>
                                    <div class="float-right col-md-3">
                                        <select name="room" id="room" class="small" data-placeholder="Room">
                                            <option value="">Phòng</option>
                                            <option value="all">Tất cả</option>
                                            <%
                                                List<String> list = dao.getRoomId(email);
                                                for (String id : list) {
                                            %>
                                            <option value="<%=id%>"><%=id%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </form>

                                <br><br><hr>
                                <canvas id="myChart" style="width:100%;max-width:800px"></canvas>
                                <!--end col-md-8-->
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
        <script>
        function myFunc(values, typ) {
            var type = Object.values(typ);
            if (type == "all") {
                var xValues = ["2020", "2021", "2022"];
            } else {
                var xValues = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            }
            var yValues = Object.values(values);
            new Chart("myChart", {
                type: "bar",
                data: {
                    labels: xValues,
                    datasets: [{
                            backgroundColor: "red",
                            data: yValues
                        }]
                },
                options: {
                    legend: {display: false},
                    title: {
                        display: true,
                        text: "Total Income"
                    }
                }
            });
        }
        </script>

    </body>
</html>


