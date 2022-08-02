<%-- 
    Document   : show-landlord-room-list-as-tetant
    Created on : Aug 1, 2022, 11:33:20 PM
    Author     : KHANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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

        <title>Kết quả tìm kiếm · Glacier</title>

    </head>
    <body style="font-family: 'Varela Round', sans-serif;">
        <c:set var="acc" value="${LOGIN_USER}" />
        <c:set var="user" value="${USER_DETAIL}" />
        <div class="page sub-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->
            <header class="hero">
                <div class="hero-wrapper">

                    <jsp:include page="header/navigation.jsp" />

                    <!--============ Page Title =========================================================================-->
                    <div class="page-title">
                        <div class="container" style="text-align: center">
                            <h1>Phòng của chủ nhà ${Landlord.name}</h1>
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
                        <div class="row flex-column-reverse flex-md-row">
                            <div class="col-md-12 col-sm-12"> 

                                <!--============ Items ==========================================================================-->
                                <div class="items grid grid-xl-4-items grid-lg-4-items grid-md-4-items">

                                    <c:forEach items="${requestScope.list}" var="room">
                                        <div class="item">
                                            <div class="wrapper">
                                                <div class="image">
                                                    <h3>
                                                        <a href="${pageContext.request.contextPath}/SingleRoomView?id=${room.roomID}" class="title">${room.name}</a>
                                                        <span>
                                                            <c:forEach begin="1" end="${room.avgRating}" step="1">
                                                                <i class="fa fa-star"></i>&nbsp;
                                                            </c:forEach>
                                                            <c:forEach begin="1" end="${5-room.avgRating}" step="1">
                                                                <i class="fa fa-star-o"></i>&nbsp;
                                                            </c:forEach>
                                                        </span>
                                                    </h3>
                                                    <a href="${pageContext.request.contextPath}/SingleRoomView?id=${room.roomID}" class="image-wrapper background-image">
                                                        <img src="${pageContext.request.contextPath}/assets/img/image-04.jpg" alt="">
                                                    </a>

                                                </div>
                                                <!--end image-->
                                                <h4 class="location">
                                                    <a href="#">${room.address}</a>
                                                </h4>
                                                <div class="price" style="top:23.5rem !important">                                    
                                                    ${room.price}đ
                                                    <!--<small>VNĐ</small>-->
                                                </div>
                                                <div class="meta">
                                                    <figure>
                                                        <i class="fa fa-calendar-o"></i>${room.date_added}
                                                    </figure>
                                                    <figure>
                                                        <a href="#">
                                                            <i class="fa fa-user"></i>${room.emailLandlord}
                                                        </a>
                                                    </figure>
                                                </div>
                                                <!--end meta-->
                                                <div class="description">
                                                    <p>${room.description}</p>
                                                </div>
                                                <!--end description-->
                                                <a href="${pageContext.request.contextPath}/SingleRoomView?id=${room.roomID}" class="detail text-caps underline">CHI TIẾT</a>
                                            </div>
                                        </div>
                                        <!--end item-->
                                    </c:forEach>




                                </div>
                                <!--============ End Items ======================================================================-->
                                <div class="page-pagination">
                                    <nav aria-label="Pagination">
                                        <ul class="pagination">


                                            <c:forEach begin="1" end="${endPage}" step="1" var="i">
                                                <c:choose>
                                                    <c:when test="${currentPage == i}">
                                                        <li class="page-item active">
                                                            <a class="page-link" href="?keyword=${searchText}${featureParameterSet}&index=${i}">${i}</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item">
                                                            <a class="page-link" href="?keyword=${searchText}${featureParameterSet}&index=${i}">${i}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>





                                        </ul>
                                    </nav>
                                </div>
                                <!--end page-pagination-->
                            </div>

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
            for (let i = 0; i < document.getElementsByClassName("price").length; i++) {

                let priceText = document.getElementsByClassName("price")[i].textContent.trim();

                let textReverse = priceText.split("").reverse().join("").trim();

                var j = 1;
                var count = 0;
                while (j < textReverse.length) {
                    count++;
                    if (count > 3) {
                        textReverse = textReverse.slice(0, j) + "." + textReverse.slice(j);
                        count = 0;
                    }
                    j++;
                }

                let finalPrice = textReverse.split("").reverse().join("");
                document.getElementsByClassName("price")[i].innerHTML = finalPrice;
            }
        </script>
    </body>
</html>

