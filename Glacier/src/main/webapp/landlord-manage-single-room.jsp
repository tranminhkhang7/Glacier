<%--
    Document   : landlord-manage-single-room
    Created on : Jun 10, 2022, 12:20:40 AM
    Author     : KHANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
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
            .popup {
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

            .popup h2 {
                margin-top: -20px;
            }

            .popup p {
                font-size: 14px;
                text-align: justify;
                margin: 20px 0;
                line-height: 25px;
            }

            .popup label {
                font-size: 16px;
            }

            .notify {
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

                transform: translate(-50%, -50%);

                display: block;
            }
            .box::after{
                content: ''!important;
                background-color: transparent !important;
                box-shadow: none !important;
            }
            .box::before{
                border-style: none !important;
            }
            #bill-form{

            }
        </style>

        <title>Quản lý phòng</title>

    </head>

    <body style="font-family: 'Varela Round', sans-serif;">

        <div class="popup" id="billForm" style="top: 50%">
            <h2>Hóa đơn cho người thuê</h2>
            <form id="bill-form" class="form form-submit" action="CreateBillController">
                <input name="id" type="hidden" value="${id}">
                <div class="card" style="margin-bottom: 5px; background-color: #f2f2f2;">
                    <div class="card-header" style="font-weight: 700; font-size: 20px;">
                        <label class="float-left">
                            <input id="check-home" type="checkbox" value="Tiền nhà" name="name">
                            Tiền nhà
                        </label>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <fmt:parseNumber var = "deposit_int" integerOnly = "true" type = "number" value = "${deposit}" />
                            <input readonly disabled id="home" name="amount" type="text" value="${deposit_int}" class="form-control home"
                                   placeholder="Số Tiền *" autocomplete="off" required>
                        </div>
                        <div class="form-group">
                            <input disabled name="description" type="text" id="home-description" class="form-control home" placeholder="Nội dung"
                                   autocomplete="off">
                        </div>

                    </div>
                </div>

                <div class="card" style="margin-bottom: 5px; background-color: #f2f2f2;">
                    <div class="card-header" style="font-weight: 700; font-size: 20px;">
                        <label class="float-left">
                            <input id="check-electricity" value="Tiền điện" type="checkbox" name="name">
                            Tiền điện
                        </label>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <input disabled name="amount" type="number" id="electric" class="form-control" placeholder="Số Tiền *"
                                   autocomplete="off" required>
                        </div>
                        <div class="form-group">
                            <input disabled name="description" type="text" id="electric-description" class="form-control" placeholder="Nội dung"
                                   autocomplete="off">
                        </div>

                    </div>
                </div>
                <div class="card" style="margin-bottom: 5px; background-color: #f2f2f2;">
                    <div class="card-header" style="font-weight: 700; font-size: 20px;">
                        <label class="float-left">
                            <input id="check-water" value="Tiền nước" type="checkbox" name="name">
                            Tiền nước
                        </label>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <input disabled name="amount" type="number" id="water" class="form-control" placeholder="Số Tiền *"
                                   autocomplete="off" required>
                        </div>
                        <div class="form-group">
                            <input disabled name="description" type="text" id="water-description" class="form-control" placeholder="Nội dung"
                                   autocomplete="off">
                        </div>
                        <!--                    <input type="hidden" name="name" value="Tiền nước">-->
                    </div>
                </div>
                <div class="card" style="margin-bottom: 5px; background-color: #f2f2f2;">
                    <div class="card-header" style="font-weight: 700; font-size: 20px;">
                        <label class="float-left">

                            <input id="check-other" value="Tiền khác" type="checkbox" name="name">
                            Tiền khác
                        </label>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <input disabled name="amount" type="text" id="other" class="form-control" placeholder="Số Tiền *" autocomplete="off"
                                   required>
                        </div>
                        <div class="form-group">
                            <input disabled name="description" type="text" id="other-description" class="form-control" placeholder="Nội dung"
                                   autocomplete="off" required>
                        </div>
                        <!--                    <input type="hidden" name="name" value="Tiền khác">-->
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary large icon float-left" style="font-size: 16px; margin: 19px 20px 0px 0px;">Gửi</button>
                </div>
            </form>

            <button class="btn btn-secondary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;"
                    onclick="closeBillForm()">Hủy</button>
        </div>

        <div class="popup" id="requestForm">
            <h2>Thông báo cho người thuê</h2>
            <form class="form form-submit" action="${pageContext.request.contextPath}/landlordnotify" method="POST">
                <input name="id" type="hidden" value="${id}">

                <div class="form-group">
                    <label for="title" class="col-form-label required">Tiêu đề</label>
                    <input name="title" type="text" class="form-control" id="title" placeholder="Tiêu đề thông báo" autocomplete="off" required>
                </div>
                <div class="form-group">
                    <label for="content" class="col-form-label required">Nội dung thông báo</label>
                    <textarea name="content" type="text" class="form-control" id="content" placeholder="Nội dung thông báo chi tiết" autocomplete="off" required></textarea>
                </div>
<!--                <input type="hidden" value="${requestScope.currentPage}" name="page" />
                <input type="hidden" id="emailLandlordSend" value="" name="emailLandlord" />-->
                <div class="form-group">
                    <button type="submit" class="btn btn-primary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;">Gửi</button>
                </div>
            </form>

            <button class="btn btn-secondary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;" onclick="closeForm()">Hủy</button>
        </div>

        <div class="popup" id="disconnectConfirm">
            <h2>Xác nhận hủy kết nối</h2>
            <form class="form form-submit" action="${pageContext.request.contextPath}/disconnect" method="POST">
                <input name="id" type="hidden" value="${id}">
                <!--                <div class="form-group">
                                        <label for="title" class="col-form-label required">Tiêu đề</label>
                                        <input name="title" type="text" class="form-control" id="title" placeholder="Mô tả ngắn gọn vấn đề của bạn" autocomplete="off" required>
                                    </div>-->

                <p>Thao tác này không thể được hoàn tác. Bạn có chắc muốn tiếp tục?</p>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary large icon float-left"
                            style="font-size: 16px; margin: 10px 20px 0px 0px;">OK</button>
                </div>
            </form>

            <button class="btn btn-secondary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;"
                    onclick="closeDisconnectConfirm()">Hủy</button>
        </div>

        <c:if test="${notify == 'deleteSuccess'}">
            <div class="notify" id="notifyBox">
                Đã xóa phòng thành công!
                &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-close" onclick="closeNotify()"></i>
            </div>
            <c:remove var="notify" scope="session" />
        </c:if>

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
                                            <div class="author" style="margin-bottom: 10%;">


                                                <img style="z-index:2000; border-radius: 50%; max-width: 100px; min-height: 100px" src="${tenant.profilePicture.trim()}" alt="" />

                                                <!--end author-image-->
                                                <div style="display: inline-block;" class="author-description">
                                                    <h3>${tenant.name}</h3>

                                                    <!--<div class="rating" data-rating="4"></div>-->
                                                    <a href="#" class="text-uppercase">Bắt đầu thuê từ ${rentStartDate}
                                                    </a>
                                                </div>
                                                <div style="display: inline-block; margin-left: -10px; padding-left:0" class="col-md-3 float-right">
                                                    <form class="mb-5" method="get" action="${pageContext.request.contextPath}/roomlandlordview">
                                                        <input type="hidden" name="id" value="${id}"/>
                                                        <button class="btn btn-primary">Xem giao diện phòng và đánh giá</button>
                                                    </form>
                                                    <button style="width: 285px" type="submit" class="btn btn-primary"
                                                            onclick="openDisconnectConfirm()">Người thuê muốn rời đi</button>
                                                </div>

                                                <!--end author-description-->

                                            </div>

                                            <hr>
                                            <dl>
                                                <dt>Số điện thoại</dt>
                                                <dd>${tenant.phone}</dd>
                                                <dt>Email</dt>
                                                <dd>${tenant.email}</dd>

                                            </dl>
                                            <!--end author-->
                                        </div>
                                        <!--end box-->
                                    </section>
                                    <!--End Author-->
                                </aside>
                            </div>
                            <div class="col-md-12">
                                <div class="row" style="justify-content: space-around">
                                    <div class="col-md-8 box" style="height: fit-content">
                                        <h2>Các hóa đơn gần đây</h2>
                                        <c:if test="${empty bd0}">
                                            <c:if test="${not empty bd1}">
                                                <div class="answer">
                                                    <div style="background-color: #f2f2f2" class="box">
                                                        <h3>Bill #${bd1[0].billID}</h3>
                                                        <c:forEach items="${bd1}" var="b">
                                                            <p>
                                                                ${b.purpose} - ${b.amount}đ - ${b.description}
                                                            </p>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${not empty bd2}">
                                                <div class="answer">
                                                    <div class="box">
                                                        <h3>Bill #${bd2[0].billID}</h3>
                                                        <c:forEach items="${bd2}" var="b">
                                                            <p>
                                                                ${b.purpose} - ${b.amount}đ - ${b.description}
                                                            </p>
                                                        </c:forEach>
                                                    </div>
                                                </div>  
                                            </c:if>
                                        </c:if>
                                        <c:if test="${not empty bd0}">
                                            <div class="answer">
                                                <div style="background-color: #f2f2f2" class="box">
                                                    <h3>${bd0}</h3>
                                                </div>
                                            </div>  
                                        </c:if>

                                        <div style="display: inline-block; padding-left: 0;" class="col-md-3">
                                            <a href="/Glacier/AllBills?id=${id}"><button class="btn btn-danger btn-framed"> Xem tất cả hóa đơn</button></a>
                                        </div>
                                    </div>


                                    <div class="col-md-2">
                                        <div class="col-md-12">
                                            <div style="display: inline-block; right:10%; " class="col-md-3">
                                                <button onclick="openBillForm()" class="btn btn-danger btn-framed">Tạo hóa đơn</button>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="col-md-12">
                                            <div style="display: inline-block; right:10%; " class="col-md-3">
                                                <button onclick="openForm()" type="submit" class="btn btn-danger btn-framed">Tạo thông báo</button>
                                            </div>
                                        </div>
                                    </div>


                                </div>
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
        <script type="text/javascript"
        src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
<!--        <script src="${pageContext.request.contextPath}/assets/js/selectize.min.js"></script>-->
        <script src="${pageContext.request.contextPath}/assets/js/masonry.pkgd.min.js"></script>
<!--        <script src="${pageContext.request.contextPath}/assets/js/icheck.min.js"></script>-->
        <script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

        <script>
                                                    function openForm() {
                                                        document.getElementsByClassName("page")[0].style.filter = "blur(8px)";
                                                        document.getElementById("requestForm").style.display = "block";
                                                        let emailLandlord = document.getElementById("emailLandlord").innerHTML;
                                                        document.getElementById("emailLandlordSend").value = emailLandlord;
                                                    }

                                                    function closeForm() {
                                                        document.getElementsByClassName("page")[0].style.filter = "none";
                                                        document.getElementById("requestForm").style.display = "none";
                                                        document.getElementById("emailLandlordSend").value = "";
                                                    }

                                                    function openBillForm() {
                                                        document.getElementsByClassName("page")[0].style.filter = "blur(8px)";
                                                        document.getElementById("billForm").style.display = "block";

                                                    }

                                                    function closeBillForm() {
                                                        document.getElementsByClassName("page")[0].style.filter = "none";
                                                        document.getElementById("billForm").style.display = "none";
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
                                                    let homeCheckBox = document.getElementById('check-home');
                                                    let electricCheckbox = document.getElementById('check-electricity');
                                                    let waterCheckbox = document.getElementById('check-water');
                                                    let otherCheckbox = document.getElementById('check-other');
                                                    homeCheckBox.addEventListener('click', function () {
                                                        if (homeCheckBox.checked === false) {
                                                            //document.getElementById('home').disabled = true;
                                                            document.getElementById('home-description').disabled = true;
                                                        } else {
                                                            document.getElementById('home').disabled = false;
                                                            document.getElementById('home-description').disabled = false;
                                                        }
                                                    })
                                                    electricCheckbox.addEventListener('click', function () {
                                                        if (electricCheckbox.checked === false) {
                                                            document.getElementById('electric').disabled = true;
                                                            document.getElementById('electric-description').disabled = true;
                                                        } else {
                                                            document.getElementById('electric').disabled = false;
                                                            document.getElementById('electric-description').disabled = false;
                                                        }
                                                    })
                                                    waterCheckbox.addEventListener('click', function () {
                                                        if (waterCheckbox.checked == false) {
                                                            document.getElementById('water').disabled = true;
                                                            document.getElementById('water-description').disabled = true;
                                                        } else {
                                                            document.getElementById('water').disabled = false;
                                                            document.getElementById('water-description').disabled = false;
                                                        }
                                                    })
                                                    otherCheckbox.addEventListener('click', function () {
                                                        if (otherCheckbox.checked == false) {
                                                            document.getElementById('other').disabled = true;
                                                            document.getElementById('other-description').disabled = true;
                                                        } else {
                                                            document.getElementById('other').disabled = false;
                                                            document.getElementById('other-description').disabled = false;
                                                        }
                                                    })
        </script>
    </body>

</html>
