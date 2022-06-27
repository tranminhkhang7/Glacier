<%-- 
    Document   : index.jsp
    Created on : Jun 1, 2022, 8:04:59 AM
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

        <title>Glacier - Thuê bất cứ đâu bạn muốn!</title>

    </head>
    <body style="font-family: 'Varela Round', sans-serif;">
        <c:set var="acc" value="${LOGIN_USER}" />
        <c:set var="user" value="${USER_DETAIL}" />

        <div class="page home-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->


            <header class="hero">
                <div class="hero-wrapper">

                    <jsp:include page="header/navigation-tenant-home.jsp" />

                    <!--============ Page Title =========================================================================-->
                    <div class="page-title" style="color: white">
                        <div class="container">
                            <h1 class="opacity-100 center">
                                <a href="#" style="color: white">Thuê</a> bất cứ đâu bạn muốn!
                            </h1>
                        </div>
                        <!--end container-->
                    </div>
                    <!--============ End Page Title =====================================================================-->
                    <!--============ Hero Form ==========================================================================-->
                    <form class="hero-form form" action="${pageContext.request.contextPath}/search">
                        <div class="container">
                            <!--Main Form-->
                            <div class="main-search-form">
                                <div class="form-row">
                                    <div class="col-md-10 col-sm-10">
                                        <div class="form-group">
                                            <label for="what" class="col-form-label" style="color: white">Bạn đang đi đến đâu?</label>
                                            <input name="keyword" type="text" class="form-control" id="what" placeholder="Nhập vị trí, mô tả phòng mà bạn muốn đến...">
                                        </div>
                                        <!--end form-group-->
                                    </div>
                                    <!--end col-md-3-->
                                    <div class="col-md-2 col-sm-2">
                                        <button type="submit" class="btn btn-primary width-100">Tìm kiếm</button>
                                    </div>
                                    <!--end col-md-3-->
                                </div>
                                <!--end form-row-->
                            </div>
                            <!--end main-search-form-->
                            <!--Alternative Form-->
                            <div class="alternative-search-form">
                                <a href="#collapseAlternativeSearchForm" class="icon" data-toggle="collapse"  aria-expanded="false" aria-controls="collapseAlternativeSearchForm" style="color: white"><i class="fa fa-plus"></i><strong>Thêm bộ lọc</strong></a>
                                <div class="collapse" id="collapseAlternativeSearchForm">
                                    <div class="wrapper">
                                        <div class="form-row">
                                            <%
                                                int i = 1;
                                            %>
                                            <c:forEach items="${requestScope.listFeature}" var="feature">
                                                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12">
                                                    <label>
                                                        <input type="checkbox" name="<%=i%>">
                                                        ${feature}
                                                    </label>
                                                </div>
                                                <%
                                                    i++;
                                                %>
                                            </c:forEach>
                                            <!--end col-xl-6-->

                                        </div>
                                        <!--end row-->
                                    </div>
                                    <!--end wrapper-->
                                </div>
                                <!--end collapse-->
                            </div>
                            <!--end alternative-search-form-->
                        </div>
                        <!--end container-->
                    </form>
                    <!--============ End Hero Form ======================================================================-->
                    <div class="background">
                        <div class="background-image">
                            <img src="${pageContext.request.contextPath}/assets/img/hero-background-image-01.jpg" alt="">
                        </div>
                        <!--end background-image-->
                    </div>
                    <!--end background-->
                </div>
                <!--end hero-wrapper-->
            </header>
            <!--end hero-->

            <!--*********************************************************************************************************-->
            <!--************ CONTENT ************************************************************************************-->
            <!--*********************************************************************************************************-->
            <section class="content">
                <!--============ Featured Ads ===========================================================================-->
                <section class="block">
                    <div class="container">
                        <h2>Xu hướng tìm kiếm</h2>
                        <div class="items grid grid-xl-4-items grid-lg-4-items grid-md-4-items">
                            <div class="item" style="height: 260px">
                                <div class="wrapper">
                                    <div class="image">
                                        <a href="${pageContext.request.contextPath}/search?keyword=Hà+Nội" class="image-wrapper background-image">
                                            <img src="https://live.staticflickr.com/65535/52177527358_384c3bdf02_b.jpg" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
<!--                                    <div class="price">Hà Nội</div>-->

                                    <!--end meta-->
                                    <div class="description">
                                        <!--<p>Ho Chi Minh City is the largest city, business and financial hub of Vietnam. Also known as Saigon, it has a prominent history going back hundreds of years. There are plenty of museums showcasing the country's dark wartime history and classic colonial architecture built by former French rulers.</p>-->
                                    </div>
                                    <!--end description-->
                                </div>
                            </div>
                            <!--end item-->
                            <div class="item" style="height: 260px">
                                <div class="wrapper">
                                    <div class="image">
                                        <a href="${pageContext.request.contextPath}/search?keyword=Đà+Nẵng" class="image-wrapper background-image">
                                            <img src="https://live.staticflickr.com/65535/52177733981_1d9210211d_b.jpg" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
<!--                                    <div class="price">Đà Nẵng</div>-->

                                    <!--end meta-->
                                    <div class="description">
                                        <!--<p>Ho Chi Minh City is the largest city, business and financial hub of Vietnam. Also known as Saigon, it has a prominent history going back hundreds of years. There are plenty of museums showcasing the country's dark wartime history and classic colonial architecture built by former French rulers.</p>-->
                                    </div>
                                    <!--end description-->
                                </div>
                            </div>
                            <!--end item-->
                            <div class="item" style="height: 260px">
                                <div class="wrapper">
                                    <div class="image">
                                        <a href="${pageContext.request.contextPath}/search?keyword=Hồ+Chí+Minh" class="image-wrapper background-image">
                                            <img src="https://live.staticflickr.com/65535/52177965574_de3b148c41_b.jpg" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
<!--                                    <div class="price">TP. Hồ Chí Minh</div>-->

                                    <!--end meta-->
                                    <div class="description">
                                        <!--<p>Ho Chi Minh City is the largest city, business and financial hub of Vietnam. Also known as Saigon, it has a prominent history going back hundreds of years. There are plenty of museums showcasing the country's dark wartime history and classic colonial architecture built by former French rulers.</p>-->
                                    </div>
                                    <!--end description-->
                                </div>
                            </div>
                            <!--end item-->
                            <div class="item" style="height: 260px">
                                <div class="wrapper">
                                    <div class="image">
                                        <a href="${pageContext.request.contextPath}/search?keyword=Cần+Thơ" class="image-wrapper background-image">
                                            <img src="https://live.staticflickr.com/65535/52177743711_3939711600_b.jpg" alt="">
                                        </a>
                                    </div>
                                    <!--end image-->
<!--                                    <div class="price">Cần Thơ</div>-->

                                    <!--end meta-->
                                    <div class="description">
                                        <!--<p>Ho Chi Minh City is the largest city, business and financial hub of Vietnam. Also known as Saigon, it has a prominent history going back hundreds of years. There are plenty of museums showcasing the country's dark wartime history and classic colonial architecture built by former French rulers.</p>-->
                                    </div>
                                    <!--end description-->
                                </div>
                            </div>
                            <!--end item-->
                        </div>
                    </div>
                    <div class="background" data-background-color="#fff"></div>
                    <!--end background-->
                </section>
                <!--============ End Featured Ads =======================================================================-->

                <section class="block">
                    <div class="container">
                        <div class="d-flex align-items-center justify-content-around">

                        </div>
                    </div>

                </section>

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
        <!--<script type="text/javascript" src="http://maps.google.com/maps/api/js"></script>-->
        <script src="${pageContext.request.contextPath}/assets/js/selectize.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/masonry.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/icheck.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

    </body>

</html>


