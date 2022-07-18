<%-- 
    Document   : admin
    Created on : May 23, 2022, 3:40:58 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="glacier.moderator.dbmanager.ModeratorManager"%>
<%@page import="glacier.moderator.dbmanager.Feature"%>
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

        <title>Craigs - Easy Buy & Sell Listing HTML Template</title>
        <style>
            .picback {
                height: 180px;
                background-origin:content-box;
                background-size:cover;
                opacity: 0.9;
            }
        </style>
    </head>
    <body style="font-family: 'Varela Round', sans-serif;">
        <div class="page sub-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->
            <header class="hero">
                <div class="hero-wrapper">


                    <!--============ End Secondary Navigation ===========================================================-->


                    <jsp:include page="header/navigation-admin.jsp" />


                    <!--============ Page Title =========================================================================-->
                    <div class="page-title">
                        <div class="container">
                            <h1 class="opacity-80 center" style="color: red">
                                Quản lý feature
                            </h1>
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

            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Xác nhận</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc muốn tiếp tục?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">KHÔNG</button>
                            <a class="btn btn-primary btn-ok">CÓ</a>
                        </div>
                    </div>
                </div>
            </div>
            <section class="content">
                <section class="block">
                    <div class="container">
                        <form class="hero-form form" action="NewFeatureController">
                            <div class="container">
                                <!--Main Form-->
                                <div class="main-search-form">
                                    <div class="form-row">
                                        <div class="col-md-9 col-sm-9">
                                            <div class="form-group">
                                                <label for="what" class="col-form-label">Thêm feature mới cho các phòng</label>
                                                <input name="feature" type="text" class="form-control" id="what" placeholder="Nhập feature mới">
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-3-->
                                        <div class="col-md-3 col-sm-3">
                                            <button type="submit" class="btn btn-primary width-100">Thêm</button>
                                        </div>
                                        <!--end col-md-3-->
                                    </div>
                                    <!--end form-row-->
                                </div>
                                <!--end main-search-form-->
                                <!--Alternative Form-->
                                <div class="alternative-search-form">
                                </div>
                                <!--end alternative-search-form-->
                            </div>
                            <!--end container-->
                        </form>
                        <div class="center">
                            <table border="2" style="text-align: center">
                                <thead>
                                    <tr style="background-color:red">
                                        <th style="width : 10%">ID</th>
                                        <th style="width : 90%">Name</th>
                                        <th style="width : 10%"></th>
                                    </tr>
                                </thead>
                                <%
                                    ModeratorManager dao = new ModeratorManager();
                                    List<Feature> list = dao.listFeature();
                                    for (Feature item : list) {
                                %>
                                <tbody>
                                    <tr>
                                        <td style="height:10px;padding:5px 10px; text-align: right"><%= item.getId()%></td>
                                        <td style="height:10px;padding:5px 10px; text-align: left"><%= item.getNameFeature()%></td>
                                        <td style="height:10px;padding:5px 10px"><button type="button" data-href="RemoveFeatureController?featureID=<%=item.getId().trim()%>" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="padding : 10px">
                                                Delete
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                                <h2>${requestScope.MESSAGE}</h2>
                        </div>
                    </div>
                </section>
            </section>
            <!--end content-->

            <!--*********************************************************************************************************-->
            <!--************ FOOTER *************************************************************************************-->
            <!--*********************************************************************************************************-->
            <jsp:include page="header/footer-admin.jsp" />
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
            $('#myModal').on('show.bs.modal', function (e) {
                $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            });
        </script>
    </body>
</html>

