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

	<title>Craigs - Easy Buy & Sell Listing HTML Template</title>

</head>
<body onload="myFunction(${requestScope.IS_VERIFIED})">
    <div class="page sub-page">
        <!--*********************************************************************************************************-->
        <!--************ HERO ***************************************************************************************-->
        <!--*********************************************************************************************************-->
        <section class="hero">
            <div class="hero-wrapper">
                
                <jsp:include page="/header/navigation-access.jsp" />
                
                <!--============ Hero Form ==========================================================================-->
 
                <!--end collapse-->
                <!--============ End Hero Form ======================================================================-->
                <!--============ Page Title =========================================================================-->
                <div class="page-title" >
                    <div class="container">
                        <h1 style="color:black;font-size: 300%;text-align: center; padding-top:20px">Mail Verification</h1>
                    </div>
                    <!--end container-->
                </div>
                <!--============ End Page Title =====================================================================-->
                <div class="background">
                    <div class="background-image">
                        <img src="${pageContext.request.contextPath}/assets/img/hero-background-image-02.jpg" alt="">
                    </div>
                    <!--end background-image-->
                </div>
                <!--end background-->
            </div>
            <!--end hero-wrapper-->
        </section>
        <!--end hero-->

        <!--*********************************************************************************************************-->
        <!--************ CONTENT ************************************************************************************-->
        <!--*********************************************************************************************************-->
        <section class="content" >
            <section class="block">
                <div class="container">
                    <div class="row justify-content-center">
                        <div id="box1" class="col-md-6">                           
                            <img style="border-radius: 50%;background-color: #6c757d;position:relative;margin-bottom:-30px;display: block; margin-left: auto; margin-right: auto;" width="80" src="data:image/png;base64,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" alt="success">
                            <div class="" style="outline:2px solid green;color: black; background-color: rgb(252, 252, 252);min-height: 28vh; text-align: center;">                                
                                <h2 style="padding-top: 35px; margin-bottom: 20px;">Verify your email address</h2>
                                <p>We have sent you an email to verify your identity </p>
                                <p  style="padding-bottom: 10px">Please check out your mail box to follow the instruction to verify your email address</p>
                                <h3>Thank you!</h3>
                            </div>
                        
                        </div>
                        <!--end col-md-6-->
                        <div id="box2" class="col-md-6">         
                            <img style="border-radius: 50%;background-color: #6c757d;position:relative;margin-bottom:-30px;display: block; margin-left: auto; margin-right: auto;" width="80" src="https://icon-library.com/images/failed-icon/failed-icon-7.jpg" alt="success">
                            <div class="" style="outline:2px solid red;color: black; background-color: rgb(252, 252, 252);min-height: 28vh; text-align: center;">                                
                                <h2 style="padding-top: 35px; margin-bottom: 20px;">Something went wrong</h2>
                                <p>Your verification link is no longer available</p>
                                <p  style="padding-bottom: 10px">Please go to registeration for another verify</p>
                                <h3>Thank you!</h3>
                            </div>
                        
                        </div>
                        <!--end col-md-6-->
                        
                    </div>
                    
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
        <section class="footer">
            <div class="wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5">
                            <a href="#" class="brand">
                                <img src="assets/img/logo.png" alt="">
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
                                                <a href="#">Home</a>
                                            </li>
                                            <li>
                                                <a href="#">Listing</a>
                                            </li>
                                            <li>
                                                <a href="#">Pages</a>
                                            </li>
                                            <li>
                                                <a href="#">Extras</a>
                                            </li>
                                            <li>
                                                <a href="#">Contact</a>
                                            </li>
                                            <li>
                                                <a href="#">Submit Ad</a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <nav>
                                        <ul class="list-unstyled">
                                            <li>
                                                <a href="#">My Ads</a>
                                            </li>
                                            <li>
                                                <a href="#">Sign In</a>
                                            </li>
                                            <li>
                                                <a href="#">Register</a>
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
                                <strong>Email:</strong> <a href="#">hello@example.com</a>
                                <br>
                                <strong>Skype: </strong> Craigs
                                <br>
                                <br>
                                <a href="contact.html" class="btn btn-primary text-caps btn-framed">Contact Us</a>
                            </address>
                        </div>
                        <!--end col-md-4-->
                    </div>
                    <!--end row-->
                </div>
                <div class="background">
                    <div class="background-image original-size">
                        <img src="assets/img/footer-background-icons.jpg" alt="">
                    </div>
                    <!--end background-image-->
                </div>
                <!--end background-->
            </div>
        </section>
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
	<script src="assets/js/jquery.validate.min.js"></script>
	<script src="assets/js/custom.js"></script>
    <script>
        function myFunction(check){
        if(check == true){
        var box1 = document.getElementById("box1");
        var box2 = document.getElementById("box2");
        box1.style.display = "block";
        box2.style.display = "none";
        }else{
            var box1 = document.getElementById("box1");
        var box2 = document.getElementById("box2");
        box1.style.display = "none";
        box2.style.display = "block";
        }
        }
    </script>
</body>
</html>
