<%-- 
    Document   : editroom
    Created on : May 31, 2022, 9:26:32 PM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css" type="text/css">
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
        <c:set var="acc" value="${LOGIN_USER}" />
        <c:set var="user" value="${USER_DETAIL}" />

        <div class="popup" id="deleteConfirmation">
            <h2>Cảnh báo</h2>
            <form class="form form-submit" action="${pageContext.request.contextPath}/deleteroom" method="POST">
                <input name="id" type="hidden" value="${room.roomID}">
                <!--                <div class="form-group">
                                    <label for="title" class="col-form-label required">Tiêu đề</label>
                                    <input name="title" type="text" class="form-control" id="title" placeholder="Mô tả ngắn gọn vấn đề của bạn" autocomplete="off" required>
                                </div>-->
                <p>Thao tác này không thể được hoàn tác. Tất cả các dữ liệu liên quan đến phòng này đều sẽ bị xóa. Bạn có muốn tiếp tục?</p>


                <div class="form-group">
                    <button type="submit" class="btn btn-primary large icon float-left" style="font-size: 16px; margin: 10px 20px 0px 0px;">Xóa</button>
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
                            <h1>Chỉnh sửa thông tin phòng</h1>
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
                        <!-- <section>
                            <div class="alert alert-warning" role="alert">
                                <h2 class="alert-heading">You don't have an account!</h2>
                                <p>You can submit only 1 ad at a time. To submit more, you need to
                                    <a href="sign-in.html" class="link"><strong>Sign In</strong></a> or
                                    <a href="register.html" class="link"><strong>Register</strong></a></p>
                            </div>
                        </section> -->
                        <form class="form form-submit" action="${pageContext.request.contextPath}/editroom">
                            <section>
                                <h2>Thông tin cơ bản</h2>
                                <!-- <div class="form-group" id="type">
                                    <label for="type" class="required">Type</label>
                                    <figure>
                                        <label class="framed">
                                            <input type="radio" name="status" value="1" required>
                                            Offer
                                        </label>
                                        <label class="framed">
                                            <input type="radio" name="status" value="2" required>
                                            Demand
                                        </label>
                                    </figure>
                                </div> -->
                                <input name="id" type="hidden" value="${room.roomID}">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="name" class="col-form-label required">Tên phòng</label>
                                            <span data-toggle="tooltip" data-placement="top" title="Mô tả ngắn  gọn căn phòng của bạn, tối đa hóa khả năng được tìm kiếm."><i class="fa fa-info-circle"></i></span>
                                            <input name="name" type="text" class="form-control" id="name" placeholder="" value="${room.name.trim()}" required>
                                        </div>
                                        <!--end form-group-->
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="area" class="col-form-label required">Diện tích</label>
                                            <input name="area" type="text" class="form-control" id="area" placeholder="" value="${room.area}" required>
                                            <span class="input-group-addon">m<sup>2</sup></span>
                                        </div>
                                        <!--end form-group-->
                                    </div>

                                    <!--end col-md-8-->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="price" class="col-form-label required">Giá phòng/tháng</label>
                                            <input name="price" type="text" class="form-control" id="price" value="${room.price}" required>
                                            <span class="input-group-addon">VNĐ</span>
                                        </div>
                                        <!--end form-group-->
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="deposit" class="col-form-label required" >Tiền cọc</label>
                                            <span data-toggle="tooltip" data-placement="top" title="Đây là tiền cọc cho khách hàng muốn giữ phòng của bạn. Sau khi khách hoàn tất việc đặt phòng và đặt cọc này, phòng của bạn sẽ được đưa về trạng thái Đã thuê trong 48h. Trong trường hợp sau 48h và khách chưa đến đặt phòng, bạn được quyền giữ số tiền này. Chúng tôi đã thông báo điều này đến khách hàng của bạn trước khi họ đặt cọc."><i class="fa fa-info-circle"></i></span>
                                            <input name="deposit" type="text" class="form-control" id="deposit" value="${room.deposit}" required>
                                            <span class="input-group-addon" data-toggle="tooltip" data-placement="top" title="Find My Position">VNĐ</span>
                                        </div>


                                        <!--end form-group-->
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="details" class="col-form-label">Mô tả chi tiết</label>
                                            <textarea name="details" id="details" class="form-control" rows="4"" >${room.description.trim()}</textarea>
                                        </div>
                                    </div>
                                </div>

                            </section>
                            <!--end Thông tin cơ bản-->

                            <section>
                                <h2>Địa điểm</h2>
                                <div class="row">
                                    <!-- <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="city" class="col-form-label required">Thành phố/Tỉnh</label>
                                            <select name="city" id="city" data-placeholder="Chọn Thành phố/Tỉnh" required>
                                                <option value="" selected="selected">Select subject</option>
                                            </select>
                                        </div>
    
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="district" class="col-form-label required">Thành phố/Quận/Huyện/Thị xã</label>
                                            <select name="district" id="district" required>
                                                <option value="" selected="selected">Please select subject first</option>
                                            </select>
                                        </div>
    
                                    </div> -->

                                    <!--end col-md-6-->

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="city" class="col-form-label">Thành phố/Tỉnh</label>
                                            <input name="city" type="text" class="form-control" value="TP. Hồ Chí Minh" id="city">
                                        </div>
                                        <!--end form-group-->
                                    </div>
                                    <!--end col-md-6-->

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="district" class="col-form-label">Thành phố/Quận/Huyện/Thị xã</label>
                                            <input name="district" type="text" class="form-control" value="Thủ Đức" id="district">
                                        </div>
                                        <!--end form-group-->
                                    </div>
                                    <!--end col-md-6-->
                                </div>
                                <!--end row-->
                                <div class="form-group">
                                    <label for="input-location" class="col-form-label">Địa chỉ chính xác</label>
                                    <input name="location" type="text" class="form-control" id="input-location" placeholder="Enter Location" value="${room.detailAddress.trim()}" >
                                    <span class="geo-location input-group-addon" data-toggle="tooltip" data-placement="top" title="Find My Position"><i class="fa fa-map-marker"></i></span>
                                </div>
                                <!--end form-group-->
                                <label>Map</label>
                                <div class="map height-400px" id="map-submit"></div>
                                <input name="latitude" type="text" class="form-control" id="latitude" hidden>
                                <input name="longitude" type="text" class="form-control" id="longitude" hidden>
                            </section>

                            <section>
                                <h2>Ảnh</h2>
                                <div class="file-upload-previews"></div>
                                <div class="file-upload">
                                    <input type="file" name="files[]" class="file-upload-input with-preview" multiple title="Nhấp để chọn ảnh" maxlength="10" accept="gif|jpg|png">
                                    <span><i class="fa fa-plus-circle"></i>Chọn hoặc kéo ảnh vào đây</span>
                                </div>
                            </section>


                            <section class="clearfix">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary large icon float-right">Hoàn tất</button>
                                </div>
                            </section>
                        </form>
                        <!--end form-submit-->


                        <div class="form form-submit">
                            <section class="clearfix">
                                <div class="form-group">
                                    <button class="btn btn-framed btn-primary large icon float-right" onclick="openForm()">Xóa phòng</button>
                                </div>
                            </section>
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
        <!--<script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery-validate.bootstrap-tooltip.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jQuery.MultiFile.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

        <script>
                                        var latitude = 51.511971;
                                        var longitude = -0.137597;
                                        var markerImage = "${pageContext.request.contextPath}/assets/img/map-marker.png";
                                        var mapTheme = "light";
                                        var mapElement = "map-submit";
                                        var markerDrag = true;
                                        simpleMap(latitude, longitude, markerImage, mapTheme, mapElement, markerDrag);
        </script>

        <script>
            function openForm() {
                document.getElementsByClassName("page")[0].style.filter = "blur(8px)";
                document.getElementById("deleteConfirmation").style.display = "block";
            }

            function closeForm() {
                document.getElementsByClassName("page")[0].style.filter = "none";
                document.getElementById("deleteConfirmation").style.display = "none";
            }
        </script>



    </body>
</html>
