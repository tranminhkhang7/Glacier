<%-- 
    Document   : register
    Created on : May 21, 2022, 5:37:15 PM
    Author     : ASUS
--%>
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

    <title>Glacier - Đăng ký</title>
    <style>
        .form-group.invalid .form-control {
            border-color: #f33a58;
        }

        .form-group.invalid .form-message {
            color: #f33a58;
        }

        .form-message {
            font-size: 1.2rem;
            line-height: 1.6rem;
            padding: 4px 0 0;
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
                <jsp:include page="../header/navigation.jsp" />
                <!--============ End Main Navigation ================================================================-->
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
                                            <input name="keyword" type="text" class="form-control small" id="what"
                                                placeholder="What are you looking for?">
                                        </div>
                                        <!--end form-group-->
                                    </div>
                                    <!--end col-md-3-->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="form-group">
                                            <label for="input-location" class="col-form-label">Where?</label>
                                            <input name="location" type="text" class="form-control small"
                                                id="input-location" placeholder="Enter Location">
                                            <span class="geo-location input-group-addon" data-toggle="tooltip"
                                                data-placement="top" title="Find My Position"><i
                                                    class="fa fa-map-marker"></i></span>
                                        </div>
                                        <!--end form-group-->
                                    </div>
                                    <!--end col-md-3-->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="form-group">
                                            <label for="category" class="col-form-label">Category?</label>
                                            <select name="category" id="category" class="small"
                                                data-placeholder="Select Category">
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
                                <a href="#collapseAlternativeSearchForm" class="icon" data-toggle="collapse"
                                    aria-expanded="false" aria-controls="collapseAlternativeSearchForm"><i
                                        class="fa fa-plus"></i>More Options</a>
                                <div class="collapse" id="collapseAlternativeSearchForm">
                                    <div class="wrapper">
                                        <div class="form-row">
                                            <div
                                                class="col-xl-6 col-lg-12 col-md-12 col-sm-12 d-xs-grid d-flex align-items-center justify-content-between">
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
                                                            <input name="min_price" type="text"
                                                                class="form-control small" id="min-price"
                                                                placeholder="Minimal Price">
                                                            <span class="input-group-addon small">$</span>
                                                        </div>
                                                        <!--end form-group-->
                                                    </div>
                                                    <!--end col-md-4-->
                                                    <div class="col-md-4 col-sm-4">
                                                        <div class="form-group">
                                                            <input name="max_price" type="text"
                                                                class="form-control small" id="max-price"
                                                                placeholder="Maximal Price">
                                                            <span class="input-group-addon small">$</span>
                                                        </div>
                                                        <!--end form-group-->
                                                    </div>
                                                    <!--end col-md-4-->
                                                    <div class="col-md-4 col-sm-4">
                                                        <div class="form-group">
                                                            <select name="distance" id="distance" class="small"
                                                                data-placeholder="Distance">
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
                        <h1>Đăng ký</h1>
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
                    <div class="row justify-content-center">
                        <div class="col-xl-4 col-lg-5 col-md-6 col-sm-8">
                            <form class="form clearfix" id="form-1" novalidate method = "post">
                                <div class="form-group">
                                    <label for="fullname" class="col-form-label required">Tên của bạn </label>
                                    <input id="fullname" name="name" type="text" class="form-control"
                                        placeholder="Tên của bạn">
                                    <span class="form-message"></span>
                                </div>
                                <!--end form-group-->
                                <div class="form-group">
                                    <label for="email" class="col-form-label required">Email</label>
                                    <input name="email" type="text" class="form-control" id="email"
                                        placeholder="Email">
                                    <span class="form-message"></span>
                                </div>
                                <!--end form-group-->
                                <div class="form-group">
                                    <label for="password" class="col-form-label required">Mật khẩu</label>
                                    <input name="password" type="password" class="form-control" id="password"
                                        placeholder="Mật khẩu">
                                    <span class="form-message"></span>
                                </div>
                                <!--end form-group-->
                                <div class="form-group">
                                    <label for="repeat_password" class="col-form-label required">Nhập lại mật khẩu</label>
                                    <input name="repeat_password" type="password" class="form-control"
                                        id="repeat_password" placeholder="Nhập lại mật khẩu">
                                    <span class="form-message"></span>
                                </div>
                                <!--end form-group-->
                                <div class="form-group">
                                    <label for="phone_number" class="col-form-label required">Số điện thoại</label>
                                    <input name="phone_number" type="text" class="form-control"
                                        id="phone_number" placeholder="VD: 098463183">
                                    <span class="form-message"></span>
                                </div>
                                <!--end form-group-->
                                <div class="form-group">
                                    <label for="hehe" class="col-form-label required">Bạn muốn trở thành ?</label>
                                    <select id="hehe" name="role">
                                        <option value="Tenant">Người thuê nhà</option>
                                        <option value="Landlord">Người cho thuê</option>
                                    </select>
                                </div>
                                <!--end form-group-->
                                <div class="form-group">
                                    <label for="Gender" class="col-form-label required">Giới tính</label>
                                    <div id="Gender"></div>
                                    <span style="padding-right: 20px;">Nam</span><input name="gender"
                                        type="radio" class="form-control" id="Male" checked value="male">
                                    <span style="padding-right: 20px;">Nữ</span><input name="gender"
                                        type="radio" class="form-control" id="Female" value="female">
                                </div>
                                <!--end form-group-->
                                <div class="d-flex justify-content-between align-items-baseline">
                                    <label>
                                    </label>
                                    <button type="submit" class="btn btn-danger">Đăng ký</button>
                                </div>

                            </form>
                            <hr>
                        </div>
                        <!--end col-md-6-->
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
        <jsp:include page="../header/footer.jsp" />
        <!--end footer-->
    </div>
    <!--end page-->

    <script src="assets/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="assets/js/popper.min.js"></script>
    <script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript"
        src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
    <script src="assets/js/selectize.min.js"></script>
    <script src="assets/js/masonry.pkgd.min.js"></script>
    <script src="assets/js/icheck.min.js"></script>
    <script src="assets/js/jquery.validate.min.js"></script>
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/validate.js"></script>
    <script>

        Validator({
            form: '#form-1',
            errorElement: '.form-message',
            formGroupSelector: '.form-group',
            rules: [
                Validator.isRequired('#fullname'),
                Validator.excludeNumber('#fullname'),
                Validator.isEmail('#email'),
                Validator.minLength('#fullname', 6),
                Validator.isRequired('#password'),
                Validator.minLength('#password', 6),
                Validator.isRequired('#repeat_password'),
                Validator.isPhoneNumber('#phone_number'),
                Validator.isConfirmed('#repeat_password', () => {
                    return document.querySelector('#form-1 #password').value;
                }, 'Mật khẩu nhập lại không chính xác'),
                
            ],
            // onSubmit: (data) => {

            // }
        })
        let error = document.querySelectorAll('.form-group .error')
        Array.from(document.querySelectorAll('.form-group .error')).forEach((el) => el.classList.remove('error'));
        console.log(error.length);
        // for (let i = 0; i < error.length; i++) {
        //     error[i].style.display = 'none';
        //     console.log(error[i]);
        // }
        [].forEach.call(error, function (el) {
            el.classList.remove("error");
        });
        // $('#email').change(() => {
        //     for (let i = 0; i < error.length; i++) {
        //         error[i].classList.remove('error');
        //         console.log(error[i]);
        //     }
        // })
    </script>
</body>

</html>

