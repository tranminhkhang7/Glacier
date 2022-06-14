<%-- 
    Document   : header-admin
    Created on : Jun 8, 2022, 9:02:05 PM
    Author     : KHANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>

<c:set var="acc" value="${LOGIN_USER}" />
<c:set var="user" value="${USER_DETAIL}" />
<!--============ Secondary Navigation ===============================================================-->
<div class="secondary-navigation">
    <div class="container">
<!--        <ul class="left">
            <li>
                <span>
                    <i class="fa fa-envelope"></i> glacier.hostel@gmail.com
                </span>
            </li>
        </ul>-->
        <!--end left-->
        <ul class="right">
            <li>
                <a href="${pageContext.request.contextPath}/logout">
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
            <a class="navbar-brand" href="admin.jsp">
                <img src="assets/img/logo.png" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbar">
                <!--Main navigation list-->
                <ul class="navbar-nav">
                    <li class="nav-item active has-child">
                        <a class="nav-link" href="SearchUserController?keyword=&index=1&role=all">User</a>
                        <ul class="child">
                            <li class="nav-item" >
                                <a href="SearchUserController?keyword=&role=landlord&index=1" class="nav-link" >Landlords</a>
                            </li>
                            <li class="nav-item">
                                <a href="SearchUserController?keyword=&role=tenant&index=1" class="nav-link">Tenants</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item has-child">
                        <a class="nav-link" href="ReportedController?index=1&type=all">Reported</a>
                        <!-- 1st level -->
                        <ul class="child">
                            <li class="nav-item">
                                <a href="ReportedController?index=1&type=room" class="nav-link">Rooms</a>
                            </li>
                            <li class="nav-item">
                                <a href="ReportedController?index=1&type=comment" class="nav-link">Comments</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.html">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a href="admin.jsp" class="btn btn-primary text-caps btn-rounded btn-framed">Home</a>
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

