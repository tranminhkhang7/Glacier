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
    <body style="font-family: 'Varela Round', sans-serif;">
        <div class="page sub-page">
            <!--*********************************************************************************************************-->
            <!--************ HERO ***************************************************************************************-->
            <!--*********************************************************************************************************-->
            <header class="hero">
                <div class="hero-wrapper">
                    
                    <jsp:include page="header/navigation-admin.jsp" />
                    
                    <!--============ Page Title =========================================================================-->
                    <div class="page-title">
                        <div class="container">
                            <h1 class="opacity-80 center" style="color: red">
                                Reported Data
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
                                        <th style="width:30%">User Email</th>
                                        <th style="width:50%">Detail</th>
                                        <th style="width:20%">Date</th>
                                        <th style="width:20%">Type</th>                           
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
                                            <input type="submit" value="Delete"/>
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
        <script src="assets/js/readmore.min.js"></script>
        <script src="assets/js/custom.js"></script>

    </body>
</html>

