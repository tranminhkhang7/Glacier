<%-- 
    Document   : Deposit
    Created on : Jun 14, 2022, 10:51:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Glacier - Deposit</title>
        <style>
            .bill th, .bill td{
                border: solid 1px black;
            }
        </style>
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
                    <h1 style="text-align: center;">${room.name}</h1>
                    <h2 style="text-align: center;color: #6c757d;">${room.address}</h2>
                    <hr>
                    <div class="container box">
                        <h2 style="text-align: center;margin-bottom:1rem;margin-bottom: 2rem; font-size: 25px">THÔNG TIN PHÒNG TRỌ</h2>
                        <section>
                            <div class="row flex-column flex-md-row">
                                <div style="width: 60%;margin-left: auto;margin-right: auto;margin-bottom: auto" class="col-md-8">
                                    <img src="assets/img/image-20.jpg" alt="" width="100%">
                                    <!--                                            <div class="gallery-carousel owl-carousel" >
                                                                                   
                                                                                    <img src="assets/img/image-01.jpg" alt="" data-hash="2">
                                                                                    <img src="assets/img/image-21.jpg" alt="" data-hash="3">
                                                                                    <img src="assets/img/image-22.jpg" alt="" data-hash="4">
                                                                                    <img src="assets/img/image-23.jpg" alt="" data-hash="5">
                                                                                    <img src="assets/img/image-14.jpg" alt="" data-hash="6">
                                                                                </div>
                                                                                <div class="gallery-carousel-thumbs owl-carousel">
                                                                                    <a href="#1" class="owl-thumb active-thumb background-image">
                                                                                        <img src="assets/img/image-20.jpg" alt="">
                                                                                    </a>
                                                                                    <a href="#2" class="owl-thumb background-image">
                                                                                        <img src="assets/img/image-01.jpg" alt="">
                                                                                    </a>
                                                                                    <a href="#3" class="owl-thumb background-image">
                                                                                        <img src="assets/img/image-21.jpg" alt="">
                                                                                    </a>
                                                                                    <a href="#4" class="owl-thumb background-image">
                                                                                        <img src="assets/img/image-22.jpg" alt="">
                                                                                    </a>
                                                                                    <a href="#5" class="owl-thumb background-image">
                                                                                        <img src="assets/img/image-23.jpg" alt="">
                                                                                    </a>
                                                                                    <a href="#6" class="owl-thumb background-image">
                                                                                        <img src="assets/img/image-14.jpg" alt="">
                                                                                    </a>
                                                                                </div>-->
                                </div>
                                <div class="col-md-4">
                                    <section>
                                        <!--                                                <h2 style="text-align: center;margin-bottom: 2rem">Người cho thuê</h2>-->
                                        <div class="box">
                                            <div class="author">
                                                <div class="author-image">
                                                    <div class="background-image">
                                                        <img src="assets/img/author-01.jpg" alt=""> <!-- pictur not yet available -->
                                                    </div>
                                                </div>
                                                <!--end author-image-->
                                                <div class="author-description">
                                                    <h3>Jane Doe</h3>
                                                    <div class="rating" data-rating="4"></div>
                                                    <a href="seller-detail-1.html" class="text-uppercase">Show My Listings
                                                        <span class="appendix">(12)</span>
                                                    </a>
                                                </div>
                                                <!--end author-description-->
                                            </div>
                                            <hr>
                                            <dl>
                                                <dt>Phone</dt>
                                                <dd>830-247-0930</dd>
                                                <dt>Email</dt>
                                                <dd>hijane@example.com</dd>
                                            </dl>
                                            <!--end author-->
                                        </div>
                                        <!--end box-->
                                    </section>
                                    <dl style="font-size: 17px">
                                        <dt>Loại</dt>
                                        <dd>Offer</dd>
                                        <dt>Trạng thái</dt>
                                        <dd>${room.status}</dd>
                                        <dt>Địa chỉ</dt>
                                        <dd>${room.detailAddress}</dd>
                                        <dt>Tiền thuê tháng</dt>
                                        <dd>${room.price}<small>VND</small></dd>
                                        <dt>Tiền cọc</dt>
                                        <dd>${room.deposit}<small>VND</small></dd>
                                    </dl>
                                </div>
                            </div>                                   
                        </section>
                    </div>
                    <hr>
                    <div class="box container">
                        <h2 style="text-align: center">THANH TOÁN</h2>
                        <div>
                            <table class="bill" style="width: 100%">
                                <tr>
                                    <th>STT</th>
                                    <th>Tên mục trả tiền</th>
                                    <th>Mô tả</th>
                                    <th>Số tiền</th>
                                    <th>Đơn vị tính</th>
                                </tr>
                                <!-- để foreach ở đây nếu có xài  --> 
                                <tr>
                                    <td>1</td>
                                    <td>Tiền đặt cọc cho phòng ${room.name}</td>
                                    <td>Tiền đặt cọc giữ phòng chờ xử lí</td>
                                    <td>${room.deposit}</td>
                                    <td>VNĐ</td>
                                </tr>
                                <!-- đóng foreach ở đây nếu có xài -->
                            </table>
                            <div style="float: right">
                                <hr>
                                <div style="text-align: center" class="">Tổng tiền: ${room.deposit} VNĐ</div>
                                <hr>
                                <form action="deposit">
                                    <input name="id" value="${id}" type="hidden">
                                    <button class="btn btn-framed btn-primary" type="submit">Xác nhận thanh toán</button>
                                </form>
                            </div>
                                    
                            <div class="clearfix"></div>
                            <br>
                            <p><b>Lưu ý: </b></p>
                            <p>- Sau khi hoàn tất thanh toán, bạn cần kiểm tra phòng trọ trực tiếp. Dù cho quyết định thuê hoặc không, bạn sẽ được Chủ nhà xác nhận và được hoàn tiền số tiền cọc này. Nếu bạn không nhận được xác nhận đó từ chủ nhà, sau 2 ngày, phòng sẽ tiếp tục được đăng tin và số tiền cọc sẽ không được hoàn lại.</p>
                            <p>- Trong 2 ngày chờ duyệt từ chủ nhà, bạn sẽ không Hủy đặt cọc. Hãy chắn chắn bạn muốn đặt cọc trước khi thực hiện thao tác này.</p>
                        </div>
                        
                        

                    </div>
                    <!--Gallery Carousel-->
                    <!--                        <section>
                                                <div class="gallery-carousel owl-carousel">
                                                    <img src="assets/img/image-20.jpg" alt="" data-hash="1">
                                                    <img src="assets/img/image-01.jpg" alt="" data-hash="2">
                                                    <img src="assets/img/image-21.jpg" alt="" data-hash="3">
                                                    <img src="assets/img/image-22.jpg" alt="" data-hash="4">
                                                    <img src="assets/img/image-23.jpg" alt="" data-hash="5">
                                                    <img src="assets/img/image-14.jpg" alt="" data-hash="6">
                                                </div>
                                                <div class="gallery-carousel-thumbs owl-carousel">
                                                    <a href="#1" class="owl-thumb active-thumb background-image">
                                                        <img src="assets/img/image-20.jpg" alt="">
                                                    </a>
                                                    <a href="#2" class="owl-thumb background-image">
                                                        <img src="assets/img/image-01.jpg" alt="">
                                                    </a>
                                                    <a href="#3" class="owl-thumb background-image">
                                                        <img src="assets/img/image-21.jpg" alt="">
                                                    </a>
                                                    <a href="#4" class="owl-thumb background-image">
                                                        <img src="assets/img/image-22.jpg" alt="">
                                                    </a>
                                                    <a href="#5" class="owl-thumb background-image">
                                                        <img src="assets/img/image-23.jpg" alt="">
                                                    </a>
                                                    <a href="#6" class="owl-thumb background-image">
                                                        <img src="assets/img/image-14.jpg" alt="">
                                                    </a>
                                                </div>
                                            </section>-->
                    <!--end Gallery Carousel-->
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
