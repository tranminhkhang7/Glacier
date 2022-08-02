<%-- 
    Document   : addroom
    Created on : May 31, 2022, 1:44:57 PM
    Author     : KHANG
--%>


<%@page import="java.util.List"%>
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


        <title>Thêm phòng mới · Glacier</title>

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
                                        <label for="subject" class="col-form-label">Tinh/Thanh pho</label>
                                        <select name="subject" id="subject" style="visibility: visible;z-index: 9999; width: 94.5%; padding: 1.7rem;">
<!--                                            <option>Chọn tỉnh</option>-->
                                        </select>
                                    </div>


                                    <div class="col-md-6">
                                        <label for="topic" class="col-form-label">Quan/Huyen/Thi xa</label>
                                        <select name="topic" id="topic" style="visibility: visible;z-index: 9999; width: 94.5%; padding: 1.7rem;">
                                            <!--<option>Please select subject first</option>-->
                                        </select>
                                    </div>

                                    
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
                                    <input type="file" name="files" class="file-upload-input with-preview" multiple title="Nhấp để chọn ảnh" maxlength="10" accept="gif|jpg|png">
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
        <script>
            var subjectObject = {
                "An Giang": {"An Phú": [], "Châu Đốc": [], "Châu Phú": [], "Châu Thành": [], "Chợ Mới": [], "Long Xuyên": [], "Phú Tân": [], "Tân Châu": [], "Thoại Sơn": [], "Tịnh Biên": [], "Tri Tôn": []},                "Bà Rịa – Vũng Tàu": {"Bà Rịa": [], "Châu Đức": [], "Côn Đảo": [], "Đất Đỏ": [], "Long Điền": [], "Phú Mỹ": [], "Vũng Tàu": [], "Xuyên Mộc": []},                "Bạc Liêu": {"Bạc Liêu": [], "Đông Hải": [], "Giá Rai": [], "Hòa Bình": [], "Hồng Dân": [], "Phước Long": [], "Vĩnh Lợi": []},                "Bắc Giang": {"Bắc Giang": [], "Hiệp Hòa": [], "Lạng Giang": [], "Lục Nam": [], "Lục Ngạn": [], "Sơn Động": [], "Tân Yên": [], "Việt Yên": [], "Yên Dũng": [], "Yên Thế": []},                "Bắc Kạn": {"Ba Bể": [], "Bắc Kạn": [], "Bạch Thông": [], "Chợ Đồn": [], "Chợ Mới": [], "Na Rì": [], "Ngân Sơn": [], "Pác Nặm": []},                "Bắc Ninh": {"Bắc Ninh": [], "Gia Bình": [], "Lương Tài": [], "Quế Võ": [], "Thuận Thành": [], "Tiên Du": [], "Từ Sơn": [], "Yên Phong": []},                "Bến Tre": {"Ba Tri": [], "Bến Tre": [], "Bình Đại": [], "Châu Thành": [], "Chợ Lách": [], "Giồng Trôm": [], "Mỏ Cày Bắc": [], "Mỏ Cày Nam": [], "Thạnh Phú": []},                "Bình Dương": {"Bắc Tân Uyên": [], "Bàu Bàng": [], "Bến Cát": [], "Dầu Tiếng": [], "Dĩ An": [], "Phú Giáo": [], "Tân Uyên": [], "Thủ Dầu Một": [], "Thuận An": []},                "Bình Định": {"An Lão": [], "An Nhơn": [], "Hoài Ân": [], "Hoài Nhơn": [], "Phù Cát": [], "Phù Mỹ": [], "Quy Nhơn": [], "Tây Sơn": [], "Tuy Phước": [], "Vân Canh": [], "Vĩnh Thạnh": []},                "Bình Phước": {"Bình Long": [], "Bù Đăng": [], "Bù Đốp": [], "Bù Gia Mập": [], "Chơn Thành": [], "Đồng Phú": [], "Đồng Xoài": [], "Hớn Quản": [], "Lộc Ninh": [], "Phú Riềng": [], "Phước Long": []},                "Bình Thuận": {"Bắc Bình": [], "Đức Linh": [], "Hàm Tân": [], "Hàm Thuận Bắc": [], "Hàm Thuận Nam": [], "La Gi": [], "Phan Thiết": [], "Phú Quý": [], "Tánh Linh": [], "Tuy Phong": []},                "Cà Mau": {"Cà Mau": [], "Cái Nước": [], "Đầm Dơi": [], "Năm Căn": [], "Ngọc Hiển": [], "Phú Tân": [], "Thới Bình": [], "Trần Văn Thời": [], "U Minh": []},                "Cao Bằng": {"Bảo Lạc": [], "Bảo Lâm": [], "Cao Bằng": [], "Hạ Lang": [], "Hà Quảng": [], "Hòa An": [], "Nguyên Bình": [], "Quảng Hòa": [], "Thạch An": [], "Trùng Khánh": []},                "Cần Thơ": {"Bình Thủy": [], "Cái Răng": [], "Cờ Đỏ": [], "Ninh Kiều": [], "Ô Môn": [], "Phong Điền": [], "Thới Lai": [], "Thốt Nốt": [], "Vĩnh Thạnh": []},                "Đà Nẵng": {"Cẩm Lệ": [], "Hải Châu": [], "Hòa Vang": [], "Hoàng Sa": [], "Liên Chiểu": [], "Ngũ Hành Sơn": [], "Sơn Trà": [], "Thanh Khê": []},                "Đắk Lắk": {"Buôn Đôn": [], "Buôn Hồ": [], "Buôn Ma Thuột": [], "Cư Kuin": [], "Cư M'gar": [], "Ea H'leo": [], "Ea Kar": [], "Ea Súp": [], "Krông Ana": [], "Krông Bông": [], "Krông Búk": [], "Krông Năng": [], "Krông Pắc": [], "Lắk": [], "M'Drắk": []},                "Đắk Nông": {"Cư Jút": [], "Đắk Glong": [], "Đắk Mil": [], "Đắk R'lấp": [], "Đắk Song": [], "Gia Nghĩa": [], "Krông Nô": [], "Tuy Đức": []},                "Điện Biên": {"Điện Biên": [], "Điện Biên Đông": [], "Điện Biên Phủ": [], "Mường Ảng": [], "Mường Chà": [], "Mường Lay": [], "Mường Nhé": [], "Nậm Pồ": [], "Tủa Chùa": [], "Tuần Giáo": []},                "Đồng Nai": {"Biên Hòa": [], "Cẩm Mỹ": [], "Định Quán": [], "Long Khánh": [], "Long Thành": [], "Nhơn Trạch": [], "Tân Phú": [], "Thống Nhất": [], "Trảng Bom": [], "Vĩnh Cửu": [], "Xuân Lộc": []},                "Đồng Tháp": {"TP Cao Lãnh": [], "Huyện Cao Lãnh": [], "Châu Thành": [], "TP. Hồng Ngự": [], "Huyện Hồng Ngự": [], "Lai Vung": [], "Lấp Vò": [], "Sa Đéc": [], "Tam Nông": [], "Tân Hồng": [], "Thanh Bình": [], "Tháp Mười": []},                "Gia Lai": {"An Khê": [], "Ayun Pa": [], "Chư Păh": [], "Chư Prông": [], "Chư Pưh": [], "Chư Sê": [], "Đak Đoa": [], "Đak Pơ": [], "Đức Cơ": [], "Ia Grai": [], "Ia Pa": [], "Kbang": [], "Kông Chro": [], "Krông Pa": [], "Mang Yang": [], "Phú Thiện": [], "Pleiku": []},                "Hà Giang": {"Bắc Mê": [], "Bắc Quang": [], "Đồng Văn": [], "Hà Giang": [], "Hoàng Su Phì": [], "Mèo Vạc": [], "Quản Bạ": [], "Quang Bình": [], "Vị Xuyên": [], "Xín Mần": [], "Yên Minh": []},                "Hà Nam": {"Bình Lục": [], "Duy Tiên": [], "Kim Bảng": [], "Lý Nhân": [], "Phủ Lý": [], "Thanh Liêm": []},                "Hà Nội": {"Ba Đình": [], "Ba Vì": [], "Bắc Từ Liêm": [], "Cầu Giấy": [], "Chương Mỹ": [], "Đan Phượng": [], "Đông Anh": [], "Đống Đa": [], "Gia Lâm": [], "Hà Đông": [], "Hai Bà Trưng": [], "Hoài Đức": [], "Hoàn Kiếm": [], "Hoàng Mai": [], "Long Biên": [], "Mê Linh": [], "Mỹ Đức": [], "Nam Từ Liêm": [], "Phú Xuyên": [], "Phúc Thọ": [], "Quốc Oai": [], "Sóc Sơn": [], "Sơn Tây": [], "Tây Hồ": [], "Thạch Thất": [], "Thanh Oai": [], "Thanh Trì": [], "Thanh Xuân": [], "Thường Tín": [], "Ứng Hòa": []},                "Hà Tĩnh": {"Cẩm Xuyên": [], "Can Lộc": [], "Đức Thọ": [], "Hà Tĩnh": [], "Hồng Lĩnh": [], "Hương Khê": [], "Hương Sơn": [], "Kỳ Anh": [], "Kỳ Anh": [], "Lộc Hà": [], "Nghi Xuân": [], "Thạch Hà": [], "Vũ Quang": []},                "Hải Dương": {"Bình Giang": [], "Cẩm Giàng": [], "Chí Linh": [], "Gia Lộc": [], "Hải Dương": [], "Kim Thành": [], "Kinh Môn": [], "Nam Sách": [], "Ninh Giang": [], "Thanh Hà": [], "Thanh Miện": [], "Tứ Kỳ": []},                "Hải Phòng": {"An Dương": [], "An Lão": [], "Bạch Long Vĩ": [], "Cát Hải": [], "Đồ Sơn": [], "Dương Kinh": [], "Hải An": [], "Hồng Bàng": [], "Kiến An": [], "Kiến Thụy": [], "Lê Chân": [], "Ngô Quyền": [], "Thủy Nguyên": [], "Tiên Lãng": [], "Vĩnh Bảo": []},                "Hậu Giang": {"Châu Thành": [], "Châu Thành A": [], "Long Mỹ": [], "Long Mỹ": [], "Ngã Bảy": [], "Phụng Hiệp": [], "Vị Thanh": [], "Vị Thủy": []},                "Hòa Bình": {"Cao Phong": [], "Đà Bắc": [], "Hòa Bình": [], "Kim Bôi": [], "Lạc Sơn": [], "Lạc Thủy": [], "Lương Sơn": [], "Mai Châu": [], "Tân Lạc": [], "Yên Thủy": []},                "Hưng Yên": {"Ân Thi": [], "Hưng Yên": [], "Khoái Châu": [], "Kim Động": [], "Mỹ Hào": [], "Phù Cừ": [], "Tiên Lữ": [], "Văn Giang": [], "Văn Lâm": [], "Yên Mỹ": []},                "Khánh Hòa": {"Cam Lâm": [], "Cam Ranh": [], "Diên Khánh": [], "Khánh Sơn": [], "Khánh Vĩnh": [], "Nha Trang": [], "Ninh Hòa": [], "Trường Sa": [], "Vạn Ninh": []},                "Kiên Giang": {"An Biên": [], "An Minh": [], "Châu Thành": [], "Giang Thành": [], "Giồng Riềng": [], "Gò Quao": [], "Hà Tiên": [], "Hòn Đất": [], "Kiên Hải": [], "Kiên Lương": [], "Phú Quốc": [], "Rạch Giá": [], "Tân Hiệp": [], "U Minh Thượng": [], "Vĩnh Thuận": []},                "Kon Tum": {"Đăk Glei": [], "Đăk Hà": [], "Đăk Tô": [], "Ia H'Drai": [], "Kon Plông": [], "Kon Rẫy": [], "Kon Tum": [], "Ngọc Hồi": [], "Sa Thầy": [], "Tu Mơ Rông": []},                "Lai Châu": {"Lai Châu": [], "Mường Tè": [], "Nậm Nhùn": [], "Phong Thổ": [], "Sìn Hồ": [], "Tam Đường": [], "Tân Uyên": [], "Than Uyên": []},                "Lạng Sơn": {"Bắc Sơn": [], "Bình Gia": [], "Cao Lộc": [], "Chi Lăng": [], "Đình Lập": [], "Hữu Lũng": [], "Lạng Sơn": [], "Lộc Bình": [], "Tràng Định": [], "Văn Lãng": [], "Văn Quan": []},                "Lào Cai": {"Bắc Hà": [], "Bảo Thắng": [], "Bảo Yên": [], "Bát Xát": [], "Lào Cai": [], "Mường Khương": [], "Sa Pa": [], "Si Ma Cai": [], "Văn Bàn": []},                "Lâm Đồng": {"Bảo Lâm": [], "Bảo Lộc": [], "Cát Tiên": [], "Đạ Huoai": [], "Đà Lạt": [], "Đạ Tẻh": [], "Đam Rông": [], "Di Linh": [], "Đơn Dương": [], "Đức Trọng": [], "Lạc Dương": [], "Lâm Hà": []},                "Long An": {"Bến Lức": [], "Cần Đước": [], "Cần Giuộc": [], "Châu Thành": [], "Đức Hòa": [], "Đức Huệ": [], "Kiến Tường": [], "Mộc Hóa": [], "Tân An": [], "Tân Hưng": [], "Tân Thạnh": [], "Tân Trụ": [], "Thạnh Hóa": [], "Thủ Thừa": [], "Vĩnh Hưng": []},                "Nam Định": {"Giao Thủy": [], "Hải Hậu": [], "Mỹ Lộc": [], "Nam Định": [], "Nam Trực": [], "Nghĩa Hưng": [], "Trực Ninh": [], "Vụ Bản": [], "Xuân Trường": [], "Ý Yên": []},                "Nghệ An": {"Anh Sơn": [], "Con Cuông": [], "Cửa Lò": [], "Diễn Châu": [], "Đô Lương": [], "Hoàng Mai": [], "Hưng Nguyên": [], "Kỳ Sơn": [], "Nam Đàn": [], "Nghi Lộc": [], "Nghĩa Đàn": [], "Quế Phong": [], "Quỳ Châu": [], "Quỳ Hợp": [], "Quỳnh Lưu": [], "Tân Kỳ": [], "Thái Hòa": [], "Thanh Chương": [], "Tương Dương": [], "Vinh": [], "Yên Thành": []},                "Ninh Bình": {"Gia Viễn": [], "Hoa Lư": [], "Kim Sơn": [], "Nho Quan": [], "Ninh Bình": [], "Tam Điệp": [], "Yên Khánh": [], "Yên Mô": []},                "Ninh Thuận": {"Bác Ái": [], "Ninh Hải": [], "Ninh Phước": [], "Ninh Sơn": [], "Phan Rang – Tháp Chàm": [], "Thuận Bắc": [], "Thuận Nam": []},                "Phú Thọ": {"Cẩm Khê": [], "Đoan Hùng": [], "Hạ Hòa": [], "Lâm Thao": [], "Phù Ninh": [], "Phú Thọ": [], "Tam Nông": [], "Tân Sơn": [], "Thanh Ba": [], "Thanh Sơn": [], "Thanh Thủy": [], "Việt Trì": [], "Yên Lập": []},                "Phú Yên": {"Đông Hòa": [], "Đồng Xuân": [], "Phú Hòa": [], "Sơn Hòa": [], "Sông Cầu": [], "Sông Hinh": [], "Tây Hòa": [], "Tuy An": [], "Tuy Hòa": []},                "Quảng Bình": {"Ba Đồn": [], "Bố Trạch": [], "Đồng Hới": [], "Lệ Thủy": [], "Minh Hóa": [], "Quảng Ninh": [], "Quảng Trạch": [], "Tuyên Hóa": []},                "Quảng Nam": {"Bắc Trà My": [], "Đại Lộc": [], "Điện Bàn": [], "Đông Giang": [], "Duy Xuyên": [], "Hiệp Đức": [], "Hội An": [], "Nam Giang": [], "Nam Trà My": [], "Nông Sơn": [], "Núi Thành": [], "Phú Ninh": [], "Phước Sơn": [], "Quế Sơn": [], "Tam Kỳ": [], "Tây Giang": [], "Thăng Bình": [], "Tiên Phước": []},                "Quảng Ngãi": {"Ba Tơ": [], "Bình Sơn": [], "Đức Phổ": [], "Lý Sơn": [], "Minh Long": [], "Mộ Đức": [], "Nghĩa Hành": [], "Quảng Ngãi": [], "Sơn Hà": [], "Sơn Tây": [], "Sơn Tịnh": [], "Trà Bồng": [], "Tư Nghĩa": []},                "Quảng Ninh": {"Ba Chẽ": [], "Bình Liêu": [], "Cẩm Phả": [], "Cô Tô": [], "Đầm Hà": [], "Đông Triều": [], "Hạ Long": [], "Hải Hà": [], "Móng Cái": [], "Quảng Yên": [], "Tiên Yên": [], "Uông Bí": [], "Vân Đồn": []},                "Quảng Trị": {"Cam Lộ": [], "Cồn Cỏ": [], "Đakrông": [], "Đông Hà": [], "Gio Linh": [], "Hải Lăng": [], "Hướng Hóa": [], "Quảng Trị": [], "Triệu Phong": [], "Vĩnh Linh": []},                "Sóc Trăng": {"Châu Thành": [], "Cù Lao Dung": [], "Kế Sách": [], "Long Phú": [], "Mỹ Tú": [], "Mỹ Xuyên": [], "Ngã Năm": [], "Sóc Trăng": [], "Thạnh Trị": [], "Trần Đề": [], "Vĩnh Châu": []},                "Sơn La": {"Bắc Yên": [], "Mai Sơn": [], "Mộc Châu": [], "Mường La": [], "Phù Yên": [], "Quỳnh Nhai": [], "Sơn La": [], "Sông Mã": [], "Sốp Cộp": [], "Thuận Châu": [], "Vân Hồ": [], "Yên Châu": []},                "Tây Ninh": {"Bến Cầu": [], "Châu Thành": [], "Dương Minh Châu": [], "Gò Dầu": [], "Hòa Thành": [], "Tân Biên": [], "Tân Châu": [], "Tây Ninh": [], "Trảng Bàng": []},                "Thái Bình": {"Đông Hưng": [], "Hưng Hà": [], "Kiến Xương": [], "Quỳnh Phụ": [], "Thái Bình": [], "Thái Thụy": [], "Tiền Hải": [], "Vũ Thư": []},                "Thái Nguyên": {"Đại Từ": [], "Định Hóa": [], "Đồng Hỷ": [], "Phổ Yên": [], "Phú Bình": [], "Phú Lương": [], "Sông Công": [], "Thái Nguyên": [], "Võ Nhai": []},                "Thanh Hóa": {"Bá Thước": [], "Bỉm Sơn": [], "Cẩm Thủy": [], "Đông Sơn": [], "Hà Trung": [], "Hậu Lộc": [], "Hoằng Hóa": [], "Lang Chánh": [], "Mường Lát": [], "Nga Sơn": [], "Nghi Sơn": [], "Ngọc Lặc": [], "Như Thanh": [], "Như Xuân": [], "Nông Cống": [], "Quan Hóa": [], "Quan Sơn": [], "Quảng Xương": [], "Sầm Sơn": [], "Thạch Thành": [], "Thanh Hóa": [], "Thiệu Hóa": [], "Thọ Xuân": [], "Thường Xuân": [], "Triệu Sơn": [], "Vĩnh Lộc": [], "Yên Định": []},                "Thành phố Hồ Chí Minh": {"Bình Chánh": [], "Bình Tân": [], "Bình Thạnh": [], "Cần Giờ": [], "Củ Chi": [], "Gò Vấp": [], "Hóc Môn": [], "Nhà Bè": [], "Phú Nhuận": [], "Quận 1": [], "Quận 3": [], "Quận 4": [], "Quận 5": [], "Quận 6": [], "Quận 7": [], "Quận 8": [], "Quận 10": [], "Quận 11": [], "Quận 12": [], "Tân Bình": [], "Tân Phú": [], "Thủ Đức": []},                "Thừa Thiên Huế": {"A Lưới": [], "Huế": [], "Hương Thủy": [], "Hương Trà": [], "Nam Đông": [], "Phong Điền": [], "Phú Lộc": [], "Phú Vang": [], "Quảng Điền": []},                "Tiền Giang": {"Cái Bè": [], "Cai Lậy": [], "Cai Lậy": [], "Châu Thành": [], "Chợ Gạo": [], "Gò Công": [], "Gò Công Đông": [], "Gò Công Tây": [], "Mỹ Tho": [], "Tân Phú Đông": [], "Tân Phước": []},                "Trà Vinh": {"Càng Long": [], "Cầu Kè": [], "Cầu Ngang": [], "Châu Thành": [], "Duyên Hải": [], "Duyên Hải": [], "Tiểu Cần": [], "Trà Cú": [], "Trà Vinh": []},                "Tuyên Quang": {"Chiêm Hóa": [], "Hàm Yên": [], "Lâm Bình": [], "Na Hang": [], "Sơn Dương": [], "Tuyên Quang": [], "Yên Sơn": []},                "Vĩnh Long": {"Bình Minh": [], "Bình Tân": [], "Long Hồ": [], "Mang Thít": [], "Tam Bình": [], "Trà Ôn": [], "Vĩnh Long": [], "Vũng Liêm": []},                "Vĩnh Phúc": {"Bình Xuyên": [], "Lập Thạch": [], "Phúc Yên": [], "Sông Lô": [], "Tam Đảo": [], "Tam Dương": [], "Vĩnh Tường": [], "Vĩnh Yên": [], "Yên Lạc": []},                "Yên Bái": {"Lục Yên": [], "Mù Cang Chải": [], "Nghĩa Lộ": [], "Trạm Tấu": [], "Trấn Yên": [], "Văn Chấn": [], "Văn Yên": [], "Yên Bái": [], "Yên Bình": []}
            };

            window.onload = function () {
                const subjectSel = document.getElementById("subject");
                const topicSel = document.getElementById("topic");
                for (var x in subjectObject) {
                    subjectSel.options[subjectSel.options.length] = new Option(x, x);
                }
                subjectSel.onchange = function () {
                    topicSel.length = 1;
                    for (var y in subjectObject[this.value]) {
                        topicSel.options[topicSel.options.length] = new Option(y, y);
                    }
                }
            }
        </script>
    </body>
</html>

