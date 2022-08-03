<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<footer class="footer">
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <a href="#" class="brand">
                        <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="">
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
                                        <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
                                    </li>

                                </ul>
                            </nav>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <nav>
                                <ul class="list-unstyled">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/contact">Liên lạc</a>
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
                        <!--                                    <figure>
                                                                124 Abia Martin Drive<br>
                                                                New York, NY 10011
                                                            </figure>-->
                        <br>
                        <strong>Email:</strong> <a href="#">glacier.hostel@gmail.com</a>
                        <br>
                        <strong>Phone: </strong>  +84 123 456 789
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
                <img src="${pageContext.request.contextPath}/assets/img/footer-background-icons.jpg" alt="">
            </div>
            <!--end background-image-->
        </div>
        <!--end background-->
    </div>
</footer>