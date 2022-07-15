<%-- 
    Document   : roomlist
    Created on : May 31, 2022, 8:07:09 PM
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

        <title>Phòng của bạn</title>

        <style>
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

    </head>
    <body style="font-family: 'Varela Round', sans-serif;">
        <c:set var="acc" value="${LOGIN_USER}" />
        <c:set var="user" value="${USER_DETAIL}" />

        <c:if test="${notify == 'deleteSuccess'}">
            <div class="notify" id="notifyBox">
                Đã xóa phòng thành công!
                &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-close" onclick="closeNotify()"></i>
            </div>
            <c:remove var="notify" scope="session" />
        </c:if>
        
        <c:if test="${notify == 'updateSuccess'}">
            <div class="notify" id="notifyBox">
                Cập nhật phòng thành công!
                &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-close" onclick="closeNotify()"></i>
            </div>
            <c:remove var="notify" scope="session" />
        </c:if>
        
        <c:if test="${notify == 'addSuccess'}">
            <div class="notify" id="notifyBox">
                Thêm phòng thành công!
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

                    <!--============ Hero Form ==========================================================================-->
                    <div class="collapse" id="collapseMainSearchForm">
                        <form class="hero-form form">
                            <div class="container">
                                <!--Main Form-->
                                <div class="main-search-form">
                                    <div class="form-row">
                                        <div class="col-md-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="what" class="col-form-label">What?</label>
                                                <input name="keyword" type="text" class="form-control small" id="what" placeholder="What are you looking for?">
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-3-->
                                        <div class="col-md-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="input-location" class="col-form-label">Where?</label>
                                                <input name="location" type="text" class="form-control small" id="input-location" placeholder="Enter Location">
                                                <span class="geo-location input-group-addon" data-toggle="tooltip" data-placement="top" title="Find My Position"><i class="fa fa-map-marker"></i></span>
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-3-->
                                        <div class="col-md-3 col-sm-3">
                                            <div class="form-group">
                                                <label for="category" class="col-form-label">Category?</label>
                                                <select name="category" id="category" class="small" data-placeholder="Select Category">
                                                    <option value="">Select Category</option>
                                                    <option value="1">Computers</option>
                                                    <option value="2">Real Estate</option>
                                                    <option value="3">Cars & Motorcycles</option>
                                                    <option value="4">Furniture</option>
                                                    <option value="5">Pets & Animals</option>
                                                </select>
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-3-->
                                        <div class="col-md-3 col-sm-3">
                                            <button type="submit" class="btn btn-primary width-100 small">Search</button>
                                        </div>
                                        <!--end col-md-3-->
                                    </div>
                                    <!--end form-row-->
                                </div>
                                <!--end main-search-form-->
                                <!--Alternative Form-->
                                <div class="alternative-search-form">
                                    <a href="#collapseAlternativeSearchForm" class="icon" data-toggle="collapse"  aria-expanded="false" aria-controls="collapseAlternativeSearchForm"><i class="fa fa-plus"></i>More Options</a>
                                    <div class="collapse" id="collapseAlternativeSearchForm">
                                        <div class="wrapper">
                                            <div class="form-row">
                                                <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 d-xs-grid d-flex align-items-center justify-content-between">
                                                    <label>
                                                        <input type="checkbox" name="new">
                                                        New
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" name="used">
                                                        Used
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" name="with_photo">
                                                        With Photo
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" name="featured">
                                                        Featured
                                                    </label>
                                                </div>
                                                <!--end col-xl-6-->
                                                <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
                                                    <div class="form-row">
                                                        <div class="col-md-4 col-sm-4">
                                                            <div class="form-group">
                                                                <input name="min_price" type="text" class="form-control small" id="min-price" placeholder="Minimal Price">
                                                                <span class="input-group-addon small">$</span>
                                                            </div>
                                                            <!--end form-group-->
                                                        </div>
                                                        <!--end col-md-4-->
                                                        <div class="col-md-4 col-sm-4">
                                                            <div class="form-group">
                                                                <input name="max_price" type="text" class="form-control small" id="max-price" placeholder="Maximal Price">
                                                                <span class="input-group-addon small">$</span>
                                                            </div>
                                                            <!--end form-group-->
                                                        </div>
                                                        <!--end col-md-4-->
                                                        <div class="col-md-4 col-sm-4">
                                                            <div class="form-group">
                                                                <select name="distance" id="distance" class="small" data-placeholder="Distance" >
                                                                    <option value="">Distance</option>
                                                                    <option value="1">1km</option>
                                                                    <option value="2">5km</option>
                                                                    <option value="3">10km</option>
                                                                    <option value="4">50km</option>
                                                                    <option value="5">100km</option>
                                                                </select>
                                                            </div>
                                                            <!--end form-group-->
                                                        </div>
                                                        <!--end col-md-3-->
                                                    </div>
                                                    <!--end form-row-->
                                                </div>
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
                        <!--end hero-form-->
                    </div>
                    <!--end collapse-->
                    <!--============ End Hero Form ======================================================================-->
                    <!--============ Page Title =========================================================================-->
                    <div class="page-title">
                        <div class="container">
                            <h1>Danh sách phòng của bạn</h1>
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
                        <!--============ Section Title===================================================================-->
                        <!-- <div class="section-title clearfix"> -->
                        <!-- <div class="float-left float-xs-none">
                            <label class="mr-3 align-text-bottom">Sort by: </label>
                            <select name="sorting" id="sorting" class="small width-200px" data-placeholder="Default Sorting" >
                                <option value="">Default Sorting</option>
                                <option value="1">Newest First</option>
                                <option value="2">Oldest First</option>
                                <option value="3">Lowest Price First</option>
                                <option value="4">Highest Price First</option>
                            </select>

                        </div> -->
                        <!-- <div class="float-right d-xs-none thumbnail-toggle">
                            <a href="#" class="change-class" data-change-from-class="list" data-change-to-class="grid" data-parent-class="items">
                                <i class="fa fa-th"></i>
                            </a>
                            <a href="#" class="change-class active" data-change-from-class="grid" data-change-to-class="list" data-parent-class="items">
                                <i class="fa fa-th-list"></i>
                            </a>
                        </div> -->
                        <!-- </div> -->
                        <!--============ Items ==========================================================================-->
                        <div class="items list grid-xl-4-items grid-lg-3-items grid-md-2-items">

                            <a href="${pageContext.request.contextPath}/addroom" class="item call-to-action">
                                <div class="wrapper">
                                    <div class="title">
                                        <i class="fa fa-plus-square-o"></i>
                                        Thêm phòng
                                    </div>
                                </div>
                            </a>
                            <br>
                            <!--end item-->
                            <c:forEach items="${requestScope.list}" var="room">
                                <div class="item">
                                    <c:if test="${room.status.trim() eq 'unavailable'}">
                                        <div class="ribbon-diagonal">
                                            <div class="ribbon-diagonal__inner">
                                                <span>ĐÃ THUÊ</span>
                                            </div>
                                        </div>
                                    </c:if>

                                    <!--end ribbon-->
                                    <div class="wrapper">
                                        <div class="image">
                                            <h3>
                                                <c:choose>
                                                    <c:when test="${room.status.trim() eq 'unavailable'}">
                                                        <a href="${pageContext.request.contextPath}/roomlist/room?id=${room.roomID}">${room.name}</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="${pageContext.request.contextPath}/editroom?id=${room.roomID}">${room.name}</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </h3>
                                            <a href="single-listing-1.html" class="image-wrapper background-image">
                                                <img src="${pageContext.request.contextPath}/assets/img/image-01.jpg" alt="">
                                            </a>
                                        </div>
                                        <!--end image-->
                                        <h4 class="location">
                                            <a href="#">${room.address}</a>
                                        </h4>
                                        <div class="price priceStyle">${room.price}đ</div>
                                        <div class="meta">
                                            <figure>
                                                <i class="fa fa-calendar-o"></i>${room.date_added}
                                            </figure>
                                        </div>
                                        <!--end meta-->
                                        <div class="description">
                                            <p>${room.description}
                                        </div>
                                        <!--end description-->
                                        <div class="additional-info">
                                            <ul>
                                                <li>
                                                    <figure>DIỆN TÍCH</figure>
                                                    <aside>${room.area}</aside>
                                                </li>
                                                <li>
                                                    <figure>ĐÁNH GIÁ BỞI NGƯỜI XEM</figure>
                                                    <aside>${room.avgRating} <i class="fa fa-star"></i></aside>
                                                </li>

                                            </ul>
                                        </div>
                                        <!--end addition-info-->
                                        <c:choose>
                                            <c:when test="${room.status.trim() eq 'unavailable'}">
                                                <a href="${pageContext.request.contextPath}/roomlist/room?id=${room.roomID}" class="detail text-caps underline">Quản lý</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/editroom?id=${room.roomID}" class="detail text-caps underline">Chỉnh sửa</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:forEach>
                            <!--end item-->






                        </div>
                        <!--============ End Items ======================================================================-->
                        <div class="page-pagination">
                            <nav aria-label="Pagination">
                                <ul class="pagination">


                                    <c:forEach begin="1" end="${endPage}" step="1" var="i">
                                        <c:choose>
                                            <c:when test="${currentPage == i}">
                                                <li class="page-item active">
                                                    <a class="page-link" href="${pageContext.request.contextPath}/roomlist?index=${i}">${i}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link" href="${pageContext.request.contextPath}/roomlist?index=${i}">${i}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>


                                </ul>
                            </nav>
                        </div>
                        <!--end page-pagination-->
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
                    for (let i = 0; i < document.getElementsByClassName("priceStyle").length; i++) {

                        let priceText = document.getElementsByClassName("priceStyle")[i].textContent.trim();

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
                        document.getElementsByClassName("priceStyle")[i].innerHTML = finalPrice;
                    }
        </script>
        <script>
            function closeNotify() {
                document.getElementById("notifyBox").style.display = "none";
            }
        </script>

    </body>
</html>
