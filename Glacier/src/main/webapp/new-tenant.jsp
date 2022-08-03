

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
<!--        <link rel="stylesheet" href="${pageContext.request.contextPath}/testing/styles.css" />-->
        <script src="https://rawgit.com/sitepoint-editors/jsqrcode/master/src/qr_packed.js"></script>
        <title>Duyệt phòng đang chờ</title>
        <style>
            .page-title a:after{
                background-color: transparent !important;
            }
            #btn-scan-qr img{
                height: 110px;
                margin: 0;
            }
            #close:hover{
                cursor:pointer;
            }
        </style>
    </head>
    <body>
        <div class="page sub-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->
            <header class="hero">
                <div class="hero-wrapper">

                    <jsp:include page="header/navigation-landlord.jsp" />

                    <!--============ End Main Navigation ================================================================-->
                    <!--============ Page Title =========================================================================-->
                    <!--                    <div  class="page-title">
                                            <div style="display:flex; justify-content: space-between;" class="container">
                                                <h1 style="color:black">Khách thuê nhà mới</h1>
                                            </div>
                                            end container
                                            <div  id="container">
                                                <a id="btn-scan-qr">
                                                    <img width="100" src="https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2017/07/1499401426qr_icon.svg">
                                                </a>
                                                <button id="close" onclick="close()">X</button>
                                                <canvas hidden="" id="qr-canvas" ></canvas>
                                                <div id="qr-result" hidden="">
                                                    <b>Data:</b> <span id="outputData"></span>
                                                </div>
                                            </div>
                                        </div>-->
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
            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Xác nhận</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc muốn tiếp tục?
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" data-dismiss="modal">KHÔNG</button>
                            <a class="btn btn-primary btn-ok">CÓ</a>
                        </div>
                    </div>
                </div>
            </div>

            <section class="content">

                <section class="block">
                    <div class="container">
                        <div class="row">
                            <c:if test="${empty requestScope.list}">
                                <div class="col-md-12" style="text-align: center">
                                    <h1>Không có khách nào cần được duyệt</h1>
                                </div>
                            </c:if>
                            <div class="col-md-12 my-5" style="text-align: center">
                                <h1 style="color:#ff0000">ĐỂ XÁC NHẬN VUI LÒNG QUÉT MÃ QR CỦA NGƯỜI THUÊ</h1>
                            </div>
                            <!--                            <div  id="container">
                                                            <a id="btn-scan-qr">
                                                                <img width="100" src="https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2017/07/1499401426qr_icon.svg">
                                                            </a>
                                                            <button id="close" onclick="close()">X</button>
                                                            <canvas hidden="" id="qr-canvas" ></canvas>
                                                            <div id="qr-result" hidden="">
                                                                <b>Data:</b> <span id="outputData"></span>
                                                            </div>
                                                        </div>-->
                            <c:forEach var="room" items="${requestScope.list}">
                                <div class="col-md-12">
                                    <article class="blog-post ">
                                        <div class="article-title">
                                            <h2 class="pb-3"><a href="blog-post.html">${room.name}</a></h2>
                                            <h4 class="location">
                                                <a href="#">${room.address}</a>
                                            </h4>
                                        </div>
                                        <div class="blog-post-content">

                                            <hr>
                                            <div class="author">
                                                <div class="author-image">
                                                    <div class="background-image">
                                                        <img src="${room.profilePicture}" alt="">
                                                    </div>
                                                </div>
                                                <!--end author-image-->
                                                <div class="author-description">
                                                    <div class="section-title">
                                                        <a href="<!-- Link tenant profile -->"><h2>${room.tenantName}</h2><span style="font-size: 12px">${room.emailTenant}</span></a>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button data-href="./accept?action=decline&roomId=${room.roomID}" class="btn btn-secondary" data-toggle="modal" data-target="#myModal">
                                                            Hủy cọc
                                                        </button>
                                                    </div>
                                                </div>
                                                <!--end author-description-->
                                            </div>
                                            <!--end author-->
                                        </div>
                                        <!--end blog-post-content-->
                                    </article>

                                    <!--end Article-->

                                </div>
                            </c:forEach>


                            <!--end col-md-8-->


                        </div>
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
                                <a href="#" class="brand">
                                    <img src="assets/img/logo.png" alt="">
                                </a>
                                <p>
                                    Glacier là nền tảng kết nối người thuê nhà và các chủ trọ. Sẵn sàng sát cánh bến bạn trên mỗi hành trình mà bạn bước đi!
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
            </footer>
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
        <script src="assets/js/readmore.min.js"></script>
        <script src="assets/js/custom.js"></script>
        <script>
            $('#myModal').on('show.bs.modal', function (e) {
                $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            });
        </script>
        <script>
            function close() {
                if (document.getElememtById("qr-canvas").hidden) {
                    document.getElememtById("close").hidden = true;
                }
                document.getElememtById("qr-canvas").hidden = false;
                document.getElememtById("qr-canvas").style.display = "block";
            }
        </script>
        <script src="${pageContext.request.contextPath}/testing/qrCodeScanner.js"></script>
    </body>
</html>