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
                position: absolute;
                transform: translate(-50%,-50%);
                left: 50%;
                top: 60%;
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

        <title>Quản lý phòng</title>

    </head>
    <body style="font-family: 'Varela Round', sans-serif;">

        <div class="popup" id="reportForm">
            <h2>Thông báo cho người thuê</h2>
                            <form id="bill-form" class="form form-submit"
                                action="${pageContext.request.contextPath}/landlordnotify">
                                <input name="id" type="hidden" value="${id}">                           
                                <div class="card" style="margin-bottom: 5px; background-color: #f2f2f2;">
                                    <div class="card-header" style="font-weight: 700; font-size: 20px;">
                                        <label class="float-left">
                                            <input id="check-home" type="checkbox" name="type" required>
                                            Tiền nhà
                                        </label>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <input disabled id="tien-nha" name="amount" type="number" value="200" class="form-control home" placeholder="Số Tiền *"
                                                autocomplete="off" required>
                                        </div>
                                        <div class="form-group">
                                            <input name="description" type="text" class="form-control home" placeholder="Nội dung"
                                                autocomplete="off">
                                        </div>
                                        <input type="hidden" name="name" value="Tiền nhà">
                                    </div>
                                </div>

                                <div class="card" style="margin-bottom: 5px; background-color: #f2f2f2;">
                                    <div class="card-header" style="font-weight: 700; font-size: 20px;">
                                        <label class="float-left">
                                            <input id="check-electricity" type="checkbox" name="type" value="1"
                                                required>
                                            Tiền điện
                                        </label>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <input name="amount" type="number" class="form-control" placeholder="Số Tiền *"
                                                autocomplete="off" required>
                                        </div>
                                        <div class="form-group">
                                            <input name="descripton" type="text" class="form-control" placeholder="Nội dung"
                                                autocomplete="off">
                                        </div>
                                        <input type="hidden" name="name" value="Tiền điện">
                                    </div>
                                </div>
                                <div class="card" style="margin-bottom: 5px; background-color: #f2f2f2;">
                                    <div class="card-header" style="font-weight: 700; font-size: 20px;">
                                        <label class="float-left">
                                            <input id="check-water" type="checkbox" name="type" value="1" required>
                                            Tiền nước
                                        </label>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <input name="amount" type="number" class="form-control" placeholder="Số Tiền *"
                                                autocomplete="off" required>
                                        </div>
                                        <div class="form-group">
                                            <input name="description" type="text" class="form-control" placeholder="Nội dung"
                                                autocomplete="off">
                                        </div>
                                        <input type="hidden" name="name" value="Tiền nước">
                                    </div>
                                </div>
                                <div class="card" style="margin-bottom: 5px; background-color: #f2f2f2;">
                                    <div class="card-header" style="font-weight: 700; font-size: 20px;">
                                        <label class="float-left">

                                            <input id="check-other" type="checkbox" name="type" value="1" required>
                                            Tiền khác
                                        </label>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <input name="amount" type="text" class="form-control" placeholder="Số Tiền *"
                                                autocomplete="off" required>
                                        </div>
                                        <div class="form-group">
                                            <input name="description" type="text" class="form-control" placeholder="Nội dung"
                                                autocomplete="off">
                                        </div>
                                        <input type="hidden" name="name" value="Tiền khác">
                                    </div>
                                </div>
                            </form>

            <button class="btn btn-secondary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;" onclick="closeForm()">Hủy</button>
        </div>

        <div class="popup" id="disconnectConfirm">
            <h2>Xác nhận hủy kết nối</h2>
            <form class="form form-submit" action="${pageContext.request.contextPath}/disconnect">
                <input name="id" type="hidden" value="${id}">
                <!--                <div class="form-group">
                                    <label for="title" class="col-form-label required">Tiêu đề</label>
                                    <input name="title" type="text" class="form-control" id="title" placeholder="Mô tả ngắn gọn vấn đề của bạn" autocomplete="off" required>
                                </div>-->

                <p>Thao tác này không thể được hoàn tác. Bạn có chắc muốn tiếp tục?</p>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;">OK</button>
                </div>
            </form>

            <button class="btn btn-secondary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;" onclick="closeDisconnectConfirm()">Hủy</button>
        </div>

        <div class="page sub-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->
            <header class="hero">
                <div class="hero-wrapper">

                    <jsp:include page="header/navigation-landlord.jsp" />

                    <!--============ Page Title =========================================================================-->
                    <div class="page-title">
                        <div class="container">
                            <h1>Quản lý phòng</h1>
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
                                <aside class="sidebar">
                                    <!--Author-->
                                    <section>
                                        <h2>Thông tin người thuê</h2>
                                        <div class="box">
                                            <div class="author">
                                                <div class="author-image">
                                                    <div class="background-image">
                                                        <img src="${pageContext.request.contextPath}/assets/img/author-01.jpg" alt="">
                                                    </div>
                                                </div>
                                                <!--end author-image-->
                                                <div class="author-description">
                                                    <h3>${tenant.name}</h3>
                                                    <!--<div class="rating" data-rating="4"></div>-->
                                                    <a href="#" class="text-uppercase">Bắt đầu thuê từ ${rentStartDate}
                                                    </a>
                                                </div>
                                                <!--end author-description-->
                                            </div>
                                            <hr>
                                            <dl>
                                                <dt>Số điện thoại</dt>
                                                <dd>${tenant.phone}</dd>
                                                <dt>Email</dt>
                                                <dd>${tenant.email}</dd>
                                                <dt>Facebook</dt>
                                                <dd>${tenant.facebookLink}</dd>
                                                <dt>Instagram</dt>
                                                <dd>${tenant.facebookLink}</dd>
                                            </dl>
                                            <!--end author-->
                                        </div>
                                        <!--end box-->
                                    </section>
                                    <!--End Author-->
                                </aside>
                            </div>
                            <div class="col-md-12">

                                <section>
                                    <h2>Các chức năng quản lý</h2>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <form method="get" action="${pageContext.request.contextPath}/roomlandlordview">
                                                <input type="hidden" name="id" value="${id}"/>
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
                                            <button type="submit" class="btn btn-primary width-100" onclick="openDisconnectConfirm()">Người thuê muốn rời đi</button>
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
            <jsp:include page="header/footer.jsp" />
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

                                                function openDisconnectConfirm() {
                                                    document.getElementsByClassName("page")[0].style.filter = "blur(8px)";
                                                    document.getElementById("disconnectConfirm").style.display = "block";
                                                }

                                                function closeDisconnectConfirm() {
                                                    document.getElementsByClassName("page")[0].style.filter = "none";
                                                    document.getElementById("disconnectConfirm").style.display = "none";
                                                }

                                                function closeNotify() {
                                                    document.getElementById("notifyBox").style.display = "none";
                                                }
        </script>
    </body>
</html>

