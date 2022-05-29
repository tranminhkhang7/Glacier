<%-- 
    Document   : success
    Created on : May 21, 2022, 4:10:51 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <c:set var="user" value="${LOGIN_USER}"/>
        <c:set var="detail" value="${USER_DETAIL}"/>
        <p>${user.email}</p>
        <p>${user.password}</p>
        <p>${detail.name}</p>
        <p>${detail.phone}</p>
        <p>${detail.facebookLink}</p>
        <p>${detail.instagramLink}</p>
        <p>${detail.profilePicture}</p>
    </body>
</html>
