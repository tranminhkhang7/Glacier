<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>

<c:set var="acc" value="${LOGIN_USER}" />
<c:set var="user" value="${USER_DETAIL}" />

<!--============ Secondary Navigation ===============================================================-->
<div class="secondary-navigation">
    <div class="container">
        <ul class="left">
            <li>
                <span>
                    <i class="fa fa-envelope"></i> glacier.hostel@gmail.com
                </span>
            </li>
        </ul>
        <!--end left-->
        <ul class="right">

            <c:if test="${empty acc}" >
                <li>
                    <a href="${pageContext.request.contextPath}/login">
                        <i class="fa fa-sign-in"></i>Đăng nhập
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/register">
                        <i class="fa fa-pencil-square-o"></i>Đăng ký
                    </a>
                </li>
            </c:if>
            <c:if test="${not empty acc}" >
                <li>
                    <a href="${pageContext.request.contextPath}/account">
                        <i class="fa fa-user"></i>${user.name}
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/logout">
                        <i class="fa fa-sign-out"></i>Đăng xuất
                    </a>
                </li>
            </c:if>
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
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                <img src="assets/img/logo.png" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbar">
                <!--Main navigation list-->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/home">Trang chủ</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/contact">Liên lạc</a>
                    </li>
                    <c:if test="${not empty acc}" >
                        <li class="nav-item">
                            <a href="submit.html" class="btn btn-primary text-caps btn-rounded">QUẢN LÝ PHÒNG THUÊ</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="btn btn-primary text-caps btn-rounded"><i class="fa fa-bell"></i> 23</a>
                        </li>
                    </c:if>
                </ul>
                <!--Main navigation list-->
            </div>
            <!--end navbar-collapse-->
        </nav>
        <!--end navbar-->
    </div>
    <!--end container-->
</div>
<!--============ End Main Navigation ================================================================-->
