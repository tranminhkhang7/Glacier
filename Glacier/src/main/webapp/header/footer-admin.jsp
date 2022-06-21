<%-- 
    Document   : footer-admin
    Created on : Jun 8, 2022, 8:57:25 PM
    Author     : KHANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>

<c:set var="acc" value="${LOGIN_USER}" />
<c:set var="user" value="${USER_DETAIL}" />
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
                                    <li>
                                        <a href="SearchUserController?keyword=&index=1&role=all">Người dùng</a>
                                    </li>
                                    <li>
                                        <a href="new-feature.jsp">Thêm feature</a>
                                    </li>

                                </ul>
                            </nav>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <nav>
                                <ul class="list-unstyled">
                                    <li>
                                        <a href="ReportedController?index=1&type=all">Bị báo cáo</a>
                                    </li>
                                    <li>
                                        <a href="#">Liên hệ</a>
                                    </li>
                                    <li>
                                        <a href="VerifyRoomController?index=1">Xét duyệt phòng mới</a>
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