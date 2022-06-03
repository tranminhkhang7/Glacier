<%-- 
    Document   : addroom
    Created on : May 31, 2022, 1:44:57 PM
    Author     : KHANG
--%>

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
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/user.css">


	<title>Craigs - Easy Buy & Sell Listing HTML Template</title>

</head>
<body style="font-family: 'Varela Round', sans-serif;">
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
                        <h1>Thêm phòng</h1>
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
                    <form class="form form-submit" action="${pageContext.request.contextPath}/addroom">
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
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label for="name" class="col-form-label required">Tên phòng</label>
                                        <span data-toggle="tooltip" data-placement="top" title="Mô tả ngắn  gọn căn phòng của bạn, tối đa hóa khả năng được tìm kiếm."><i class="fa fa-info-circle"></i></span>
                                        <input name="name" type="text" class="form-control" id="name" placeholder="" required>
                                    </div>
                                    <!--end form-group-->
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="area" class="col-form-label required">Diện tích</label>
                                        <input name="area" type="text" class="form-control" id="area" placeholder="" required>
                                        <span class="input-group-addon">m<sup>2</sup></span>
                                    </div>
                                    <!--end form-group-->
                                </div>
                                <!--end col-md-8-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="price" class="col-form-label required">Giá phòng/tháng</label>
                                        <input name="price" type="text" class="form-control" id="price" required>
                                        <span class="input-group-addon">VNĐ</span>
                                    </div>
                                    <!--end form-group-->
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="deposit" class="col-form-label required" >Tiền cọc</label>
                                        <span data-toggle="tooltip" data-placement="top" title="Đây là tiền cọc cho khách hàng muốn giữ phòng của bạn. Sau khi khách hoàn tất việc đặt phòng và đặt cọc này, phòng của bạn sẽ được đưa về trạng thái Đã thuê trong 48h. Trong trường hợp sau 48h và khách chưa đến đặt phòng, bạn được quyền giữ số tiền này. Chúng tôi đã thông báo điều này đến khách hàng của bạn trước khi họ đặt cọc."><i class="fa fa-info-circle"></i></span>
                                        <input name="deposit" type="text" class="form-control" id="deposit" required>
                                        <span class="input-group-addon" data-toggle="tooltip" data-placement="top" title="Find My Position">VNĐ</span>
                                    </div>

                                    
                                    <!--end form-group-->
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="details" class="col-form-label">Mô tả chi tiết</label>
                                        <textarea name="details" id="details" class="form-control" rows="4"></textarea>
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
                                        <input name="city" type="text" class="form-control" id="city">
                                    </div>
                                    <!--end form-group-->
                                </div>
                                <!--end col-md-6-->

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="district" class="col-form-label">Thành phố/Quận/Huyện/Thị xã</label>
                                        <input name="district" type="text" class="form-control" id="district">
                                    </div>
                                    <!--end form-group-->
                                </div>
                                <!--end col-md-6-->
                            </div>
                            <!--end row-->
                            <div class="form-group">
                                <label for="input-location" class="col-form-label">Địa chỉ chính xác</label>
                                <input name="location" type="text" class="form-control" id="input-location" placeholder="Enter Location">
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
                                <button type="submit" class="btn btn-primary large icon float-right">Đăng bài</button>
                            </div>
                        </section>
                    </form>
                    <!--end form-submit-->
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
	<!--<script src="assets/js/jquery.validate.min.js"></script>-->
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
	<script src="assets/js/jquery-validate.bootstrap-tooltip.min.js"></script>
	<script src="assets/js/jQuery.MultiFile.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/custom.js"></script>

    <script>
        var latitude = 51.511971;
        var longitude = -0.137597;
        var markerImage = "assets/img/map-marker.png";
        var mapTheme = "light";
        var mapElement = "map-submit";
        var markerDrag = true;
        simpleMap(latitude, longitude, markerImage, mapTheme, mapElement, markerDrag);

        
    </script>

    

</body>
</html>

