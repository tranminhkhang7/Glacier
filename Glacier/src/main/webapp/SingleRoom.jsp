<%-- 
    Document   : SingleRoom
    Created on : May 24, 2022, 1:34:52 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="ThemeStarz">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Varela+Round" rel="stylesheet">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.css" type="text/css">
        <link rel="stylesheet" href="assets/css/selectize.css" type="text/css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css" type="text/css">
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

        <title>${room.name} · Glacier</title>

    </head>
    <body style="font-family: 'Varela Round', sans-serif;">
        <c:set var="acc" value="${LOGIN_USER}" />
        <c:set var="user" value="${USER_DETAIL}" />

        <div class="popup" id="reportForm">
            <h2>Báo cáo cho quản trị viên</h2>
            <form class="form form-submit" action="./report">
                <input name="id" type="hidden" value="${room.roomID}">
                <!--                <div class="form-group">
                                    <label for="title" class="col-form-label required">Tiêu đề</label>
                                    <input name="title" type="text" class="form-control" id="title" placeholder="Mô tả ngắn gọn vấn đề của bạn" autocomplete="off" required>
                                </div>-->
                <div class="form-group">
                    <label for="title" class="col-form-label required">Nội dung báo cáo</label>
                    <input name="content" type="text" class="form-control" id="title" placeholder="Nội dung báo cáo chi tiết cho quản trị viên" autocomplete="off" required>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;">Gửi</button>
                </div>
            </form>

            <button class="btn btn-secondary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;" onclick="closeForm()">Hủy</button>
        </div>

        <c:if test="${notify == 'report'}">
            <div class="notify" id="notifyBox">
                Báo cáo cho quản trị viên thành công!
                &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-close" onclick="closeNotify()"></i>
            </div>
        </c:if>
        <div class="page sub-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->
            <header class="hero">
                <div class="hero-wrapper">

                    <jsp:include page="header/navigation-with-search-header.jsp" />

                    <!--============ Hero Form ==========================================================================-->
                    <div class="collapse" id="collapseMainSearchForm" style="">
                        <form class="hero-form form" action="${pageContext.request.contextPath}/search">
                            <div class="container">
                                <!--Main Form-->
                                <div class="main-search-form">
                                    <div class="form-row">
                                        <div class="col-md-10 col-sm-10">
                                            <div class="form-group">
                                                <label for="what" class="col-form-label">Bạn đang đi đến đâu?</label>
                                                <input name="keyword" type="text" class="form-control" id="what" maxlength="80" placeholder="Nhập vị trí, mô tả phòng mà bạn muốn đến...">
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
                                    <a href="#collapseAlternativeSearchForm" class="icon" data-toggle="collapse"  aria-expanded="false" aria-controls="collapseAlternativeSearchForm"><i class="fa fa-plus"></i><strong>Thêm bộ lọc</strong></a>
                                    <div class="collapse" id="collapseAlternativeSearchForm">
                                        <div class="wrapper">
                                            <div class="form-row">
                                                <div class="col-md-3 col-sm-0">
                                                </div>
                                                <div class="col-md-3 col-sm-12">
                                                    <div class="form-group">
                                                        <input name="min_price" type="number" min="100000" max="100000000" step="1" class="form-control small" id="min-price" placeholder="Giá tối thiểu">
                                                        <span class="input-group-addon small">VNĐ</span>
                                                    </div>
                                                    <!--end form-group-->
                                                </div>
                                                <!--end col-md-4-->
                                                <div class="col-md-3 col-sm-12">
                                                    <div class="form-group">
                                                        <input name="max_price" type="number" min="100000" max="100000000" step="1" class="form-control small" id="max-price" placeholder="Giá tối đa">
                                                        <span class="input-group-addon small">VNĐ</span>
                                                    </div>
                                                    <!--end form-group-->
                                                </div>
                                                <!--end col-md-4-->
                                            </div>
                                            <div class="form-row">
                                                <c:forEach items="${requestScope.listFeature}" var="feature">
                                                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12">
                                                        <label>
                                                            <input type="checkbox" name="${feature.id}">
                                                            ${feature.name}
                                                        </label>
                                                    </div>

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
                    </div>
                    <!--============ End Hero Form ======================================================================-->
                    <!--============ Page Title =========================================================================-->

                    <div class="page-title">
                        <div class="container clearfix" >
                            <div class="float-left float-xs-none" style="width: 100%">
                                <div>
                                    <h1>
                                        ${room.name}
                                        <!--                                    <span class="tag">Offer</span>-->
                                    </h1>
                                </div>
                            </div>
                            <div class="float-left float-xs-none" style="width: 75%">
                                <div style="font-size: 18px;color:#ff0000" class="active">
                                    <span>
                                        <c:forEach begin="1" end="${room.avgRating}" step="1">
                                            <i class="fa fa-star"></i>&nbsp;
                                        </c:forEach>
                                        <c:forEach begin="1" end="${5-room.avgRating+1}" step="1">
                                            <i class="fa fa-star-o"></i>&nbsp;
                                        </c:forEach>
                                    </span>
                                </div>

                                <h4 class="location">
                                    <a href="#">${room.address}</a>
                                </h4>
                                <c:if test="${not empty acc}" >
                                    <h1>
                                        <br>
                                        <!--                                        <span data-toggle="tooltip" data-placement="bottom" title="Save this room"><i class="fa fa-bookmark"></i></span>&nbsp;&nbsp;-->
                                        <a onclick="openForm()">
                                            <span data-toggle="tooltip" data-placement="bottom" title="Báo cáo cho quản trị viên"><i class="fa fa-warning"></i></span>
                                        </a>
                                    </h1>
                                </c:if>
                            </div>
                            <div class="float-right float-xs-none price" style="width: 25%">
                                <div class="number priceStyle">${room.price}<small>đ</small></div>
                                <strong>/tháng</strong>
                                <hr>

                                <c:if test="${not empty acc}">
                                    <c:if test="${FStatus==true}">
                                        <form action="AddFavouriteController">    
                                            <input name="id" value="${room.roomID}" type="hidden">
                                            <input name="email" value="${acc.email}" type="hidden">
                                            <button class="btn btn-primary btn-framed" style="width: 100%" type="submit">Thêm vào Yêu thích <i class="fa fa-heart-o"></i></button>
                                        </form>
                                    </c:if>               
                                    <c:if test="${FStatus==false}">
                                        <form action="RemoveFavouriteController">    
                                            <input name="id" value="${room.roomID}" type="hidden">
                                            <input name="email" value="${acc.email}" type="hidden">
                                            <button class="btn btn-primary btn-framed" style="width: 100%" type="submit">Bỏ Yêu thích <i class="fa fa-heart-o"></i></button>
                                        </form>
                                    </c:if>
                                </c:if>

                            </div>
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
                        <!--Gallery Carousel-->
                        <section>
                            <div class="gallery-carousel owl-carousel">
                                <% int key = 1;%>
                                <c:forEach items="${requestScope.ROOM_IMAGES}" var="image">
                                    <img src="https://storage.googleapis.com/glacier-bucket/Room_Pictures/${image.roomId}_${image.picId}.PNG" alt="" data-hash="<%=key%>">
                                    <%key++;%>
                                </c:forEach>
                            </div>
                            <div class="gallery-carousel-thumbs owl-carousel">
                                <% int key1 = 1; %>
                                <c:forEach items="${requestScope.ROOM_IMAGES}" var="image">
                                    <%if (key1 == 1) {%>
                                    <a href="#<%=key1%>" class="owl-thumb active-thumb background-image">
                                        <img src="https://storage.googleapis.com/glacier-bucket/Room_Pictures/${image.roomId}_${image.picId}.PNG" alt="">
                                    </a>
                                    <%key1++;%>
                                    <%} else {%>
                                    <a href="#<%=key1%>" class="owl-thumb background-image">
                                        <img src="https://storage.googleapis.com/glacier-bucket/Room_Pictures/${image.roomId}_${image.picId}.PNG" alt="">
                                    </a>
                                    <%key1++;%>
                                    <%}%>
                                </c:forEach>      
                            </div>
                        </section>
                        <!--end Gallery Carousel-->
                        <div class="row flex-column-reverse flex-md-row">
                            <!--============ Listing Detail =============================================================-->
                            <div class="col-md-8">
                                <!--Description-->

                                <section>
                                    <h2>Mô tả</h2>
                                    <p style="">
                                        ${room.description}
                                    </p>
                                </section>
                                <!--end Description-->
                                <!--Details-->
                                <section>

                                    <h2>Chi tiết</h2>
                                    <dl class="columns-2">
                                        <dt>Ngày thêm</dt>
                                        <dd>${room.date_added}</dd>
                                        <dt>Loại</dt>
                                        <dd>Offer</dd>
                                        <dt>Trạng thái</dt>
                                        <dd>${room.status}</dd>
                                        <!--                                    <dt>First Owner</dt>
                                                                            <dd>Yes</dd>-->
                                        <dt>Địa chỉ</dt>
                                        <dd>${room.detailAddress}</dd>
                                        <dt>Tiền thuê tháng</dt>
                                        <dd class="priceStyle">${room.price}<small>đ</small></dd>
                                        <!--                                    <dt>Color</dt>
                                                                            <dd>White, Grey</dd>
                                                                            <dt>Height</dt>
                                                                            <dd>47cm</dd>
                                                                            <dt>Width</dt>
                                                                            <dd>203cm</dd>
                                                                            <dt>Length</dt>
                                                                            <dd>54cm</dd>-->
                                    </dl>
                                </section>
                                <!--end Details-->
                                <!--                                Features-->
                                <c:if test="${not empty f}">
                                    <section>
                                        <h2 style="">Phòng chúng tôi có gì</h2>
                                        <ul class="features-checkboxes columns-4">
                                            <c:forEach items="${f}" var="feature">
                                                <c:if test="${not empty feature}">
                                                    <li style="font-weight: bold">${feature}</li>       
                                                    </c:if>
                                                </c:forEach>
                                        </ul>
                                    </section>
                                </c:if>
                                <!--                                end Features-->


                                <!--Similar Ads-->
                                <!--                            <section>
                                                                <h2>Similar Ads</h2>
                                                                <div class="items list compact">
                                                                    <div class="item">
                                                                        <div class="ribbon-featured">Featured</div>
                                                                        end ribbon
                                                                        <div class="wrapper">
                                                                            <div class="image">
                                                                                <h3>
                                                                                    <a href="#" class="tag category">Home & Decor</a>
                                                                                    <a href="single-listing-1.html" class="title">Furniture for sale</a>
                                                                                    <span class="tag">Offer</span>
                                                                                </h3>
                                                                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                                                                    <img src="assets/img/image-01.jpg" alt="">
                                                                                </a>
                                                                            </div>
                                                                            end image
                                                                            <h4 class="location">
                                                                                <a href="#">Manhattan, NY</a>
                                                                            </h4>
                                                                            <div class="price">$80</div>
                                                                            <div class="meta">
                                                                                <figure>
                                                                                    <i class="fa fa-calendar-o"></i>02.05.2017
                                                                                </figure>
                                                                                <figure>
                                                                                    <a href="#">
                                                                                        <i class="fa fa-user"></i>Jane Doe
                                                                                    </a>
                                                                                </figure>
                                                                            </div>
                                                                            end meta
                                                                            <div class="description">
                                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis lobortis</p>
                                                                            </div>
                                                                            end description
                                                                            <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                                                                        </div>
                                                                    </div>
                                                                    end item
                                
                                                                    <div class="item">
                                                                        <div class="wrapper">
                                                                            <div class="image">
                                                                                <h3>
                                                                                    <a href="#" class="tag category">Education</a>
                                                                                    <a href="single-listing-1.html" class="title">Creative Course</a>
                                                                                    <span class="tag">Offer</span>
                                                                                </h3>
                                                                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                                                                    <img src="assets/img/image-02.jpg" alt="">
                                                                                </a>
                                                                            </div>
                                                                            end image
                                                                            <h4 class="location">
                                                                                <a href="#">Nashville, TN</a>
                                                                            </h4>
                                                                            <div class="price">$125</div>
                                                                            <div class="meta">
                                                                                <figure>
                                                                                    <i class="fa fa-calendar-o"></i>28.04.2017
                                                                                </figure>
                                                                                <figure>
                                                                                    <a href="#">
                                                                                        <i class="fa fa-user"></i>Peter Browner
                                                                                    </a>
                                                                                </figure>
                                                                            </div>
                                                                            end meta
                                                                            <div class="description">
                                                                                <p>Proin at tortor eros. Phasellus porta nec elit non lacinia. Nam bibendum erat at leo faucibus vehicula. Ut laoreet porttitor risus, eget suscipit tellus tincidunt sit amet. </p>
                                                                            </div>
                                                                            end description
                                                                            <div class="additional-info">
                                                                                <ul>
                                                                                    <li>
                                                                                        <figure>Start Date</figure>
                                                                                        <aside>25.06.2017 09:00</aside>
                                                                                    </li>
                                                                                    <li>
                                                                                        <figure>Length</figure>
                                                                                        <aside>2 months</aside>
                                                                                    </li>
                                                                                    <li>
                                                                                        <figure>Bedrooms</figure>
                                                                                        <aside>3</aside>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                            end addition-info
                                                                            <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                                                                        </div>
                                                                    </div>
                                                                    end item
                                
                                                                    <div class="item">
                                                                        <div class="wrapper">
                                                                            <div class="image">
                                                                                <h3>
                                                                                    <a href="#" class="tag category">Adventure</a>
                                                                                    <a href="single-listing-1.html" class="title">Into The Wild</a>
                                                                                    <span class="tag">Ad</span>
                                                                                </h3>
                                                                                <a href="single-listing-1.html" class="image-wrapper background-image">
                                                                                    <img src="assets/img/image-03.jpg" alt="">
                                                                                </a>
                                                                            </div>
                                                                            end image
                                                                            <h4 class="location">
                                                                                <a href="#">Seattle, WA</a>
                                                                            </h4>
                                                                            <div class="price">$1,560</div>
                                                                            <div class="meta">
                                                                                <figure>
                                                                                    <i class="fa fa-calendar-o"></i>21.04.2017
                                                                                </figure>
                                                                                <figure>
                                                                                    <a href="#">
                                                                                        <i class="fa fa-user"></i>Peak Agency
                                                                                    </a>
                                                                                </figure>
                                                                            </div>
                                                                            end meta
                                                                            <div class="description">
                                                                                <p>Nam eget ullamcorper massa. Morbi fringilla lectus nec lorem tristique gravida</p>
                                                                            </div>
                                                                            end description
                                                                            <a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
                                                                        </div>
                                                                    </div>
                                                                    end item
                                
                                                                    <div class="center">
                                                                        <a href="#" class="btn btn-primary text-caps btn-framed">Show All</a>
                                                                    </div>
                                                                </div>
                                                                end items.list.compact
                                                            </section>-->
                                <!--end Similar Ads-->
                            </div>
                            <!--============ End Listing Detail =========================================================-->
                            <!--============ Sidebar ====================================================================-->
                            <div class="col-md-4">
                                <aside class="sidebar">
                                    <!--Author-->
                                    <section>
                                        <h2>Người cho thuê</h2>
                                        <div class="box">
                                            <div class="author">
                                                <div class="author-image">
                                                    <div class="background-image">
                                                        <img src="${Landlord.profilePicture}" alt="">
                                                    </div>
                                                </div>
                                                <!--end author-image-->
                                                <div class="author-description">
                                                    <h3>${Landlord.name}</h3>
                                                    <a href="${pageContext.request.contextPath}/TenantViewLandlordRoomList?email=${Landlord.email}" class="text-uppercase">XEM DANH SÁCH PHÒNG
                                                    </a>
                                                </div>
                                                <!--end author-description-->
                                            </div>
                                            <hr>
                                            <dl>
                                                <dt>Phone</dt>
                                                <dd>${Landlord.phone}</dd>
                                                <dt>Email</dt>
                                                <dd>${Landlord.email}</dd>
                                            </dl>
                                            <!--end author-->            
                                        </div>
                                        <!--end box-->
                                    </section>
                                    <c:if test="${not empty acc}">
                                        <section>
                                            <h2>Đặt phòng</h2>
                                            <div class="box">
                                                <h3 style="text-align: center">Tiền đặt cọc:&nbsp;&nbsp;  ${room.deposit}đ</h3>
                                                <form action="./ToDeposit">
                                                    <input name="id" value="${room.roomID}" type="hidden">
                                                    <button style="display:block;margin: auto" class="btn btn-framed btn-primary" type="submit">Tiến hành đặt cọc</button>
                                                </form>
                                            </div>
                                        </section>
                                    </c:if>
                                    <!--End Author-->

                                </aside>

                            </div>
                            <!--============ End Sidebar ================================================================-->
                        </div>
                        <hr>
                        <section>
                            <h2>Bản đồ</h2>
                            <div class="map height-300px" id="map-small">
                                <iframe width="450"
                                        height="250"
                                        style="width: 100%; height: 100%"
                                        frameborder="0" style="border:0"
                                        referrerpolicy="no-referrer-when-downgrade"
                                        src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCCYLuixh0QamoPxzrTZTCNGOtd0fwYQoQ&q=${room.detailAddress}" allowfullscreen>
                                </iframe>
                            </div>
                        </section>
                        <hr>
                        <section>
                            <h2>Nhà được gợi ý</h2>
                            <div class="items list compact">
                                <c:forEach items="${requestScope.ROOM_BY_FEATURE}" begin="0" end="2" var="roomByFeature">
                                    <div class="item">                                 
                                        <!--end ribbon-->
                                        <div class="wrapper">
                                            <div class="image">
                                                <h3>
                                                    <a href="./SingleRoomView?id=${roomByFeature.roomID}" class="title">${roomByFeature.name}</a>                                                    
                                                </h3>
                                                <a href="./SingleRoomView?id=${roomByFeature.roomID}" class="image-wrapper background-image">
                                                    <img src="assets/img/image-01.jpg" alt="">
                                                </a>
                                            </div>
                                            <!--end image-->
                                            <h4 class="location">
                                                <a href="#">${roomByFeature.address}</a>
                                            </h4>
                                            <div class="price priceStyle">${roomByFeature.price}<small> VNĐ</small></div>
                                            <div class="meta">
                                                <figure>
                                                    <i class="fa fa-calendar-o"></i>${roomByFeature.date_added}
                                                </figure>
                                                <figure>
                                                    <a href="#">
                                                        <i class="fa fa-user"></i>${Landlord.name}
                                                    </a>
                                                </figure>
                                            </div>
                                            <!--end meta-->
                                            <div class="description">
                                                <p>${roomByFeature.description}</p>
                                            </div>
                                            <!--end description-->
                                        </div>
                                    </div>
                                </c:forEach>
                                <!--end item-->
                            </div>
                            <!--end items.list.compact-->
                        </section>
                        <hr>
                        <section>
                            <h2>Viết đánh giá</h2>
                            <c:if test="${user==null}">
                                <div class="box" style="width: 100%">
                                    <a href="./login" style="width: 100%">Bạn phải đăng nhập trước khi đánh giá</a>
                                </div>                                                                 
                            </c:if>
                            <c:if test="${user!=null}">
                                <form class="form" action="WriteComment">
                                    <input name="roomID" value="${room.roomID}" type="hidden">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="username" class="col-form-label">Tên người dùng</label>
                                                <div class="box" style="padding: 1.75rem">${user.name}</div> 
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-8-->
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <label for="rating" class="col-form-label">Chất lượng</label>                                            
                                                <select required="" name="rating" id="rating" data-placeholder="Select Rating">
                                                    <option value="">Lựa chọn của bạn</option>
                                                    <option value="1" data-option-stars="1">Kinh khủng</option>
                                                    <option value="2" data-option-stars="2">Trung bình</option>
                                                    <option value="3" data-option-stars="3">Ổn</option>
                                                    <option value="4" data-option-stars="4">Rất tốt</option>
                                                    <option value="5" data-option-stars="5">Tuyệt vời</option>
                                                </select>
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-4-->
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="review" class="col-form-label">Đánh giá chi tiết của bạn</label>
                                                <textarea name="review" id="review" class="form-control" rows="4" placeholder="Căn phòng tuyệt nhất tôi từng ở"></textarea>
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-12-->
                                    </div>
                                    <button type="submit" class="btn btn-primary icon float-right width-20">Đăng<i class="fa fa-chevron-right"></i></button>
                                    <!--end row-->
                                </form>                               
                            </c:if>
                            <!--end form-->
                        </section>
                        <hr style="margin-top: 10rem">
                        <section>
                            <h2>Đánh giá</h2>
                            <div class="comments">
                                <c:if test="${empty Reviews}">
                                    <h3>Không có đánh giá</h3>
                                </c:if>
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
                                                <div style="display: inline-block; " class="meta">
                                                    <span class="rating" data-rating="${review.rating}"/>
                                                    <span><fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${review.date}" /></span>
                                                </div>

                                                <div class="popup" id="reportCommentForm">
                                                    <h2>Báo cáo cho quản trị viên</h2>
                                                    <form class="form form-submit" action="./reportcomment">
                                                        <input type="hidden" value="${review.id}" name="commentId" />
                                                        <input type="hidden" value="${room.roomID}" name="roomID" />
                                                        <input type="hidden" value="${review.email}" name="email" />
<!--                                                        <input type="hidden" value="${review.content}" name="content" />-->
                                                        <!--                <div class="form-group">
                                                                            <label for="title" class="col-form-label required">Tiêu đề</label>
                                                                            <input name="title" type="text" class="form-control" id="title" placeholder="Mô tả ngắn gọn vấn đề của bạn" autocomplete="off" required>
                                                                        </div>-->
                                                        <div class="form-group">
                                                            <label for="title" class="col-form-label required">Nội dung báo cáo</label>
                                                            <input name="content" type="text" class="form-control" id="title" placeholder="Nội dung báo cáo chi tiết cho quản trị viên" autocomplete="off" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <button type="submit" class="btn btn-primary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;">Gửi</button>
                                                        </div>
                                                    </form>

                                                    <button class="btn btn-secondary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;" onclick="closeCommentForm()">Hủy</button>
                                                </div>
                                                <c:if test="${not empty acc}" >                                                      
                                                    <a style="cursor:pointer" onclick="openCommentForm()" class="float-right">
                                                        <span data-toggle="tooltip" data-placement="bottom" title="Reporting this comment"><i class="fa fa-2x fa-warning"></i></span>
                                                    </a>
                                                </c:if>
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
        <script src="assets/js/icheck.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/custom.js"></script>
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
            function openForm() {
                document.getElementsByClassName("page")[0].style.filter = "blur(8px)";
                document.getElementById("reportForm").style.display = "block";
            }
            function closeForm() {
                document.getElementsByClassName("page")[0].style.filter = "none";
                document.getElementById("reportForm").style.display = "none";
            }
            function openCommentForm() {
//                document.getElementsByClassName("page")[0].style.filter = "blur(8px)";
                document.getElementById("reportCommentForm").style.display = "block";
            }
            function closeCommentForm() {
//                document.getElementsByClassName("page")[0].style.filter = "none";
                document.getElementById("reportCommentForm").style.display = "none";
            }
            function closeNotify() {
                document.getElementById("notifyBox").style.display = "none";
            }
        </script>
        <!--        <script>
                    var latitude = 51.511971;
                    var longitude = -0.137597;
                    var markerImage = "assets/img/map-marker.png";
                    var mapTheme = "light";
                    var mapElement = "map-small";
                    simpleMap(latitude, longitude, markerImage, mapTheme, mapElement);
                </script>-->

    </body>
</html>