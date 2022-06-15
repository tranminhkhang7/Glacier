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
                    
                    <jsp:include page="header/navigation-landlord.jsp" />
                    
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
                                <section>
                                    <h2>Reviews</h2>
                                    <div class="comments">
                                        <c:forEach items="${Reviews}" var="review">
                                            <div class="comment">
                                                <div class="author">
                                                    <a href="#" class="author-image">
                                                        <div class="background-image">            
                                                            <img src="${review.profile_picture}" alt="alt"/>
                                                        </div>
                                                    </a>
                                                    <div class="author-description">
                                                        <h3>${review.name}</h3>
                                                        <div class="meta">
                                                            <span class="rating" data-rating="${review.rating}"></span>
                                                            <span>${review.time}</span>
                                                        </div>
                                                        <!--                                                end meta-->
                                                        <p>
                                                            ${review.content}
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="page-pagination">
                                        <nav aria-label="Pagination">
                                            <ul class="pagination">

                                                <!--                                    <li class="page-item active">
                                                                                        <a class="page-link" href="#">1</a>
                                                                                    </li>
                                                                                    <li class="page-item">
                                                                                        <a class="page-link" href="#">2</a>
                                                                                    </li>
                                                                                    <li class="page-item">
                                                                                        <a class="page-link" href="#">3</a>
                                                                                    </li>-->

                                                <c:forEach begin="1" end="${endPage}" step="1" var="i">
                                                    <c:choose>
                                                        <c:when test="${currentPage == i}">
                                                            <li class="page-item active">
                                                                <a class="page-link" href="?id=${room.roomID}&index=${i}">${i}</a>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li class="page-item">
                                                                <a class="page-link" href="?id=${room.roomID}&index=${i}">${i}</a>
                                                            </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </ul>
                                        </nav>
                                    </div>
                                    <!--                                <div class="comments">
                                                                        <div class="comment">
                                                                            <div class="author">
                                                                                <a href="#" class="author-image">
                                                                                    <div class="background-image">
                                                                                        <img src="assets/img/author-09.jpg" alt="">
                                                                                    </div>
                                                                                </a>
                                                                                <div class="author-description">
                                                                                    <h3>Jane Doe</h3>
                                                                                    <div class="meta">
                                                                                        <span class="rating" data-rating="4"></span>
                                                                                        <span>02.05.2017</span>
                                                                                    </div>
                                                                                    end meta
                                                                                    <p>
                                                                                        Nam pulvinar tortor nec lacinia efficitur. Integer erat tortor, ultricies
                                                                                        ut est vel, euismod imperdiet lacus. Aenean nec turpis condimentum, mollis
                                                                                        mauris id, scelerisque quam.
                                                                                    </p>
                                                                                </div>
                                                                                end author-description
                                                                            </div>
                                                                            end author
                                                                        </div>
                                                                        end comment

                                                                        <div class="comment">
                                                                            <div class="author">
                                                                                <a href="#" class="author-image">
                                                                                    <div class="background-image">
                                                                                        <img src="assets/img/author-05.jpg" alt="">
                                                                                    </div>
                                                                                </a>
                                                                                <div class="author-description">
                                                                                    <h3>Perfect seller. I am satisfied.</h3>
                                                                                    <div class="meta">
                                                                                        <span class="rating" data-rating="5"></span>
                                                                                        <span>02.05.2017</span>
                                                                                        <h5><a href="#">John Doe</a></h5>
                                                                                    </div>
                                                                                    end meta
                                                                                    <p>
                                                                                        Integer erat tortor, ultricies ut est vel, euismod imperdiet lacus.
                                                                                        Aenean nec turpis condimentum, mollis mauris id, scelerisque quam.
                                                                                    </p>
                                                                                </div>
                                                                                end author-description
                                                                            </div>
                                                                            end author
                                                                        </div>
                                                                        end comment

                                                                        <div class="comment">
                                                                            <div class="author">
                                                                                <a href="#" class="author-image">
                                                                                    <div class="background-image">
                                                                                        <img src="assets/img/author-04.jpg" alt="">
                                                                                    </div>
                                                                                </a>
                                                                                <div class="author-description">
                                                                                    <h3>Quick dispatch and good communication</h3>
                                                                                    <div class="meta">
                                                                                        <span class="rating" data-rating="3"></span>
                                                                                        <span>02.05.2017</span>
                                                                                        <h5><a href="#">Susan Jefferson</a></h5>
                                                                                    </div>
                                                                                    end meta
                                                                                    <p>
                                                                                        Cras luctus aliquet fringilla. In eu cursus nunc. Quisque dolor leo,
                                                                                        vehicula a sem ut, aliquam pretium tellus. Morbi ut mi eleifend,
                                                                                        sollicitudin nisl in, elementum nisi. Praesent sed libero euismod,
                                                                                        pellentesque risus sit amet, faucibus lorem. Pellentesque bibendum
                                                                                        libero sed tempor tristique.
                                                                                    </p>
                                                                                </div>
                                                                                end author-description
                                                                            </div>
                                                                            end author
                                                                        </div>
                                                                        end comment
                                                                    </div>-->
                                    <!--end comment-->
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

