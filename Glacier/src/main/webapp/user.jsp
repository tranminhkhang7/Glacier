<%-- 
    Document   : user
    Created on : May 30, 2022, 10:25:08 AM
    Author     : Admin
--%>
<%@page import="glacier.user.model.User"%>
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

        <title>Craigs - Easy Buy & Sell Listing HTML Template</title>

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
                                User Data
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
                String search = request.getParameter("keyword");
                if (search == null) {
                    search = "";
                }
                String role = request.getParameter("role");
                if (role == null) {
                    role = "all";
                }

            %>

            <section class="content">
                <section class="block">
                    <div class="container">
                        <%--thanh Search --%>
                        <section>
                            <h2>Search</h2>
                            <form class="sidebar-form form" action="SearchUserController" method="GET">
                                <div class="form-group">
                                    <label for="what" class="col-form-label">Email or user name</label>
                                    <input name="keyword" type="text" class="form-control" id="what" placeholder="Enter keyword and press enter">                                 
                                    <input type="hidden" name="role" value="<%=role%>"/>
                                    <input type="hidden" name="index" value="1"/>
                                    <input type="submit" style="height: 0px; width: 0px; border: none; padding: 0px;" hidefocus="true" />
                                    <br>
                                    <div class="float-xl-none float-md-none float-sm-none" >
                                    </div>
                                </div>
                                <!--end form-group-->
                            </form>         
                        </section>
                        <%--Bảng thông tin người dùng --%>
                        <div class="center">
                            <%
                                List<User> listUser = (List<User>) request.getAttribute("LIST_USER");
                                if (listUser != null) {
                                    if (listUser.size() > 0) {
                            %>
                            <table border="2"style="text-align: center">
                                <thead>
                                    <tr style="background-color:red">
                                        <th>Num</th>
                                        <th style="width:30%">Email</th>
                                        <th>Name</th>
                                        <th>Gender</th>
                                        <th>Phone</th>
                                        <th>Role</th>
                                        <th>Status</th> 
                                        <th></th>

                                    </tr>
                                </thead>
                                
                                    <%
                                        int p = 1;
                                        for (User user : listUser) {
                                    %>
                                    <form action="BanUserController" method="GET">
                                    <tbody>         
                                        <tr>
                                            <td style="height:10px;padding:5px 10px"><%= p++%></td>
                                            <td style="height:10px;padding:5px 10px; text-align: left"><%= user.getEmail()%></td>
                                            <td style="height:10px;padding:5px 10px; text-align: left"><%= user.getName()%></td>
                                            <td style="height:10px;padding:5px 10px; text-align: left"><%= user.getGender()%></td>
                                            <td style="height:10px;padding:5px 10px; text-align: right">
                                                <input name="userPhone" type="hidden" value="<%=user.getPhone()%>"/><%= user.getPhone()%>
                                            </td>
                                            <td style="height:10px;padding:5px 10px; text-align: left">
                                                <input name="userRole" type="hidden" value="<%=user.getRole()%>"/>
                                                <%= user.getRole()%>
                                            </td>
                                            <td style="height:10px;padding:5px 10px"><%=user.getStatus()%></td>
                                            <td style="height:10px;padding:5px 10px">    
                                                <input type="submit" value="Ban User"/>
                                            </td>

                                        </tr> 
                                    </tbody>
                                    </form>
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
                                <a class="page-link" href="?role=<%=role%>&keyword=<%=search%>&index=<%=currentPage - 1%>" aria-label="Previous">
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
                                    <a class="page-link" href="?role=<%=role%>&keyword=<%=search%>&index=<%=i%>"><%=i%></a>
                                </li> 
                                <%
                                } else {
                                %>
                                <li class="page-item">
                                    <a class="page-link" href="?role=<%=role%>&keyword=<%=search%>&index=<%=i%>"><%=i%></a>
                                </li> 
                                <%
                                        }
                                    }
                                    if (currentPage != endPage) {
                                %>
                                <a class="page-link" href="?role=<%=role%>&keyword=<%=search%>&index=<%=currentPage + 1%>" aria-label="Next">
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
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/readmore.min.js"></script>
        <script src="assets/js/custom.js"></script>

    </body>
</html>

