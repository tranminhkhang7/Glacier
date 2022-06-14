<%-- 
    Document   : error
<<<<<<< HEAD
    Created on : May 31, 2022, 1:46:54 PM
    Author     : Admin
=======
    Created on : May 28, 2022, 12:51:44 PM
    Author     : ASUS
>>>>>>> dc88e9094f7bd57c4d3a69c34569754f0eac11a2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR</title>
    </head>
    <body>

        <h1>FAULT!!</h1>

        <h1>Something went wrong!!!</h1>
        <h2 style="color: red">${error}</h2>
        <!-- errCode=null >> no error code for all other error when using tenant role -->
        <c:if test="${errCode==null}">
             <a href="./home"> BACK TO HOME! </a>
        </c:if>
        <!-- errCode=1 >> WRONG PRIVILLAGE WHEN USING LANDLORD role -->
        <c:if test="${errCode==1}">
             <a href="./roomlist"> BACK TO HOME! </a>
        </c:if>
        <!-- errCode=1 >> WRONG PRIVILLAGE WHEN USING LANDLORD role -->
        <c:if test="${errCode==2}">
             <a href="./manage"> BACK TO HOME! </a>
        </c:if>     
    </body>
</html>
