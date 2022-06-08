<%-- 
    Document   : landlord-notification
    Created on : Jun 7, 2022, 7:44:42 PM
    Author     : KHANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        <c:set var="acc" value="${LOGIN_USER}" />
        <c:set var="user" value="${USER_DETAIL}" />

        <div class="popup" id="reportForm">
            <h2>Thông báo cho người thuê</h2>
            <form class="form form-submit" action="./landlordnotify">
                <input name="id" type="hidden" value="${room.roomID}">
                <!--                <div class="form-group">
                                    <label for="title" class="col-form-label required">Tiêu đề</label>
                                    <input name="title" type="text" class="form-control" id="title" placeholder="Mô tả ngắn gọn vấn đề của bạn" autocomplete="off" required>
                                </div>-->
                <div class="form-group">
                    <label for="title" class="col-form-label required">Tiêu đề</label>
                    <input name="content" type="text" class="form-control" id="title" placeholder="Nội dung báo cáo chi tiết cho quản trị viên" autocomplete="off" required>
                </div>
                <div class="form-group">
                    <label for="title" class="col-form-label required">Nội dung thông báo</label>
                    <textarea name="content" type="text" class="form-control" id="title" placeholder="Nội dung báo cáo chi tiết cho quản trị viên" autocomplete="off" required></textarea>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;">Gửi</button>
                </div>
            </form>

            <button class="btn btn-secondary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;" onclick="closeForm()">Hủy</button>
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
                            <h1>Lịch sử thông báo</h1>
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
                                    <form class="form inputs-underline">
                                        <h3>Tìm kiếm thông báo</h3>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="name" id="name" placeholder="Nhập cụm từ gợi nhớ đến thông báo của bạn">
                                        </div>
                                        <!--end form-group-->
                                    </form>
                                </section>
                                <section>
                                    <c:forEach items="${requestScope.list}" var="notification">
                                        <div class="answer">
                                            <div class="box">
                                                <h3>${notification.title}</h3>
                                                <p>
                                                    ${notification.content}
                                                </p>
                                            </div>
                                            <figure>${notification.date}</figure>
                                        </div>
                                        <!--end answer-->
                                    </c:forEach>
                                    <button type="submit" class="btn btn-primary width-100" onclick="openForm()">Bấm vô đây :v</button>



                                </section>
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
                                <!--end page-pagination-->
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

        <script src="assets/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="assets/js/popper.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
        <script src="assets/js/selectize.min.js"></script>
        <script src="assets/js/masonry.pkgd.min.js"></script>
        <script src="assets/js/icheck.min.js"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/custom.js"></script>

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
