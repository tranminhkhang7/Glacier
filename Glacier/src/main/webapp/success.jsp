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
        <p>${detail.gender}</p>
        <img src="https://storage.googleapis.com/glacier-bucket/Camap2.jpg?x-goog-signature=746cbe3823d6684bf35e7b7b40b7dd26f7f440f8447cc91613eb6998885e99e0b5a00d883c44f066b12923cea24642476965faa8ddf59a0679d8bbf39adb1295a19ba264020e75b1f4480ba2b7cbb08d07734ee3a7d73e4db14bdc986bf718e5a59a62711c781469cb117c4cd07e002e367ea8620f3ae5a011f26661893aa5dc77e105d837bda638ffdeaf0ec4063d02d00f49184e98e0ed108066f5cfa8b924cbdc16c42c6fbed9c57d22de32c18089e6965c52d0ed4e71941e055e12f1f1f8a474759f7670f1d067acf484cf495c79c3804894f829eb1657ed87f76e72e83922073eb3ffc9caaef1eb4cca347676b5ca6a36c519a59e54d483f40d3d6e86d7&x-goog-algorithm=GOOG4-RSA-SHA256&x-goog-credential=service-account%40glacier-351418.iam.gserviceaccount.com%2F20220620%2Fasia-east2%2Fstorage%2Fgoog4_request&x-goog-date=20220620T153347Z&x-goog-expires=600&x-goog-signedheaders=host" alt="Khong co hinh`"/>
        <img src="https://storage.googleapis.com/glacier-bucket/Camap2.jpg?GoogleAccessId=service-account@glacier-351418.iam.gserviceaccount.com&Expires=1655736949&Signature=P%2Bj3VcdOgqt%2FdGv5NDmyssKbOzRr2TD5r293uctwwwPvcQWc2LJWJtLAGuJgR%2FEYxBLAHQ%2FnU3nkalMowf6nvU3PeAk5EKhhBoIZN8LdiFFKqOZa7EleeVOYS06YIgf69lHEfJFXjSgNTtiuYJ2zbCudMlmUDmdRNHkB6j6QXz71lzFZZHIVyjILTgLEueCdQi0zN1xHcjtqMJ7N9e4GP42sCK8VUgfICC3WAOmovgWIhiBhkuOSWHnpKeW10RDKjNz80kidakCnmj8GUxr1RjVb2G2O7Tu9RdoXEZ14NU5Sw8X8sUk4%2FNkoGWpqHnOgWP7Li2suOBX4mmS5v4Q4XQ%3D%3D" alt="">

        <img src="https://storage.googleapis.com/glacier-bucket/Camap2.jpg?x-goog-signature=3e85f29db17d4ea47cd2ceeb280575909554a55a252bb29e14ffb2c7ebd92b4c25780b1c79869017d9a0c93f67b414d2c08ad40624e9e41def63eb016773910913ba0abaa0d551d6e1cc7a818534160057a69478321179f96ef69529a3ae3da5dd4b8fdc39f24409b0edab721b46f2fe76d8711bfd3b0d2b0bd5813dac06720d78fa7c03682ce5f81ccdce268e5848bb2bbeb774d031365207a285f2bf5532ccc6bd1c349d4be33d99d51fe85e351b0315db14ff2165ab5020b632021e2689421aa55307f73e2c8cdb0609570877219b2ff83fcb7fca47271e87edaf8a22cedb3f311a03cd2da037e4ccd7392f308218881fb5124b0f5f4ec62d730a47e55b95&x-goog-algorithm=GOOG4-RSA-SHA256&x-goog-credential=service-account%40glacier-351418.iam.gserviceaccount.com%2F20220620%2Fasia-east2%2Fstorage%2Fgoog4_request&x-goog-date=20220620T143901Z&x-goog-expires=600&x-goog-signedheaders=host" alt="hehe"/>
    </body>
</html>
