<%-- 
    Document   : user
    Created on : May 30, 2022, 10:25:08 AM
    Author     : Admin
--%>
<%@page import="glacier.user.model.Reported"%>
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
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/user.css">

        <title>Craigs</title>

    </head>
    <body>
        <div class="page sub-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->
            <header class="hero">
                <div class="hero-wrapper">
                    <!--============ Secondary Navigation ===============================================================-->
                    <div class="secondary-navigation">
                        <div class="container">
                            <ul class="left">
                                <li>
                                    <span>
                                        <i class="fa fa-phone"></i> +1 123 456 789
                                    </span>
                                </li>
                            </ul>
                            <!--end left-->
                            <ul class="right">
                                <li>
                                    <a href="sign-in.html">
                                        <i class="fa fa-sign-out"></i>Đăng xuất
                                    </a>
                                </li>
                            </ul>
                            <!--end right-->
                        </div>
                        <!--end container-->
                    </div>
                    <!--============ End Secondary Navigation ===========================================================-->
                    <!--============ Main Navigation ====================================================================-->
                    <div class="main-navigation">
                        <div class="container">
                            <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                                <a class="navbar-brand" href="index.html">

                                </a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="navbar">
                                    <!--Main navigation list-->
                                    <ul class="navbar-nav">
                                        <li class="nav-item active has-child">
                                            <a class="nav-link" href="SearchUserController?keyword=a&index=1&role=all">Người dùng</a>
                                            <ul class="child">
                                                <li class="nav-item">
                                                    <a href="SearchUserController?keyword=&role=landlord&index=1" class="nav-link">Người cho thuê</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="SearchUserController?keyword=&role=tenant&index=1" class="nav-link">Người thuê</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item has-child">
                                            <a class="nav-link" href="ReportedController?index=1&type=all">Bị tố cáo</a>
                                            <!-- 1st level -->
                                            <ul class="child">
                                                <li class="nav-item">
                                                    <a href="ReportedController?index=1&type=room" class="nav-link">Phòng</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="ReportedController?index=1&type=comment" class="nav-link">Bình luận</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="contact.html">Liên hệ</a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="admin.jsp" class="btn btn-primary text-caps btn-rounded btn-framed">Trang chủ</a>
                                        </li>
                                    </ul>
                                    <!--Main navigation list-->
                                </div>
                                <!--end navbar-collapse-->
                                <!--end main-search-form-toggle-->
                            </nav>
                            <!--end navbar-->

                            <!--end breadcrumb-->
                        </div>
                        <!--end container-->
                    </div>
                    <!--============ End Main Navigation ================================================================-->
                    <!--============ Page Title =========================================================================-->
                    <div class="page-title">
                        <div class="container">
                            <h1 class="opacity-80 center" style="color: red">
                                Thông tin tố cáo
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
            <%
                String type = request.getParameter("type");
                if (type == null) {
                    type = "all";
                }
            %>

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
                        <%--Bảng thông tin report --%>
                        <div class="center">
                            <%
                                List<Reported> listReported = (List<Reported>) request.getAttribute("LIST_REPORTED");
                                if (listReported != null) {
                                    if (listReported.size() > 0) {
                            %>
                            <table border="2"style="text-align: center">
                                <thead>
                                    <tr style="background-color:red">
                                        <th style="width:10%">ID</th>
                                        <th style="width:30%">Email người dùng</th>
                                        <th style="width:50%">Chi tiết</th>
                                        <th style="width:20%">Thời gian</th>
                                        <th style="width:20%">Loại</th>                           
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <%
                                    for (Reported reported : listReported) {
                                %>

                                <tbody>         
                                    <tr>
                                        <td style="height:10px;padding:5px 10px; text-align: right"><%= reported.getId()%></td>
                                        <td style="height:10px;padding:5px 10px; text-align: left"><%= reported.getUserEmail()%></td>
                                        <td style="height:10px;padding:5px 10px; text-align: left"><%= reported.getDetail()%></td>
                                        <td style="height:10px;padding:5px 10px; text-align: right"><%= reported.getDate()%></td>
                                        <td style="height:10px;padding:5px 10px; text-align: left"><%= reported.getType()%></td>
                                        <td style="height:10px;padding:5px 10px">    
                                            <button type="button" data-href="DeleteReportedController?id=<%= reported.getId()%>&type=<%= reported.getType()%>&action=ignore" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                                Bỏ qua
                                            </button>
                                        </td>
                                        <td style="height:10px;padding:5px 10px">    
                                            <button type="button" data-href="DeleteReportedController?id=<%= reported.getId()%>&type=<%= reported.getType()%>&action=delete" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                                Xóa
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>

                                <%
                                    }
                                %>
                            </table>
                            <%
                                    }
                                }
                            %>

                        </div>
                    </div>
                    <%--Mục phân trang --%>
                    <div class="page-pagination">
                        <nav aria-label="Pagination">
                            <ul class="pagination">
                                <%
                                    int currentPage = (int) request.getAttribute("CURRENT_PAGE");
                                    int endPage = (int) request.getAttribute("END_PAGE");
                                    if (currentPage != 1) {
                                %>
                                <a class="page-link" href="?type=<%=type%>&index=<%=currentPage - 1%>" aria-label="Previous">
                                    <span aria-hidden="true">
                                        <i class="fa fa-chevron-left"></i>
                                    </span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <%
                                    }
                                    for (int i = 1; i <= endPage; i++) {
                                        if (currentPage == i) {
                                %>
                                <li class="page-item active">
                                    <a class="page-link" href="?type=<%=type%>&index=<%=i%>"><%=i%></a>
                                </li> 
                                <%
                                } else {
                                %>
                                <li class="page-item">
                                    <a class="page-link" href="?type=<%=type%>index=<%=i%>"><%=i%></a>
                                </li> 
                                <%
                                        }
                                    }
                                    if (currentPage != endPage) {
                                %>
                                <a class="page-link" href="?type=<%=type%>index=<%=currentPage + 1%>" aria-label="Next">
                                    <span aria-hidden="true">
                                        <i class="fa fa-chevron-right"></i>
                                    </span>
                                    <span class="sr-only">Next</span>
                                </a>
                                <%
                                    }
                                %>                                
                            </ul>
                        </nav>
                    </div>
                    <!--end container-->
                </section>
                <!--end block-->
            </section>
            <!--end content-->
            <!--*********************************************************************************************************-->
            <!--************ FOOTER *************************************************************************************-->
            <!--*********************************************************************************************************-->
            <footer class="footer">
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
                                                    <a href="admin.jsp">Home</a>
                                                </li>
                                                <li>
                                                    <a href="SearchUserController?keyword=&index=1&role=all" >User</a>
                                                </li>

                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <nav>
                                            <ul class="list-unstyled">
                                                <li>
                                                    <a href="ReportedController?index=1&type=all">Reported</a>
                                                </li>
                                                <li>
                                                    <a href="#">Contact</a>
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
                                        D1 Street,Long Thanh My<br> 
                                        Thu Duc city, Ho Chi Minh city
                                    </figure>
                                    <br>
                                    <strong>Email:</strong> <a href="#">hello@example.com</a>
                                    <br>
                                    <strong>Skype: </strong> Glacier
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
            </footer>
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
        <script src="assets/js/readmore.min.js"></script>
        <script src="assets/js/custom.js"></script>

        <script>
            $('#myModal').on('show.bs.modal', function (e) {
                $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            });
        </script>

    </body>
</html>

