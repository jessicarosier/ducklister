<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to DuckLister!" />
    </jsp:include>
    <link href="css/landing.css" rel="stylesheet" >
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" >
        <jsp:param name="location" value="home" />
     </jsp:include>
    <div class="page-wrapper">


    <div class="container">
        <div class="row text-center">
            <div class="logo-wrapper">
                <img class="main-logo" src="assets/images/logo-transparent.png">
            </div>
            <div>
                <a href="/ads" class="btn button">View All Posts</a>
                <a href="/cat" class="btn button">Browse by Category</a>
            </div>
        </div>
    </div>
    </div>
    <jsp:include page="/WEB-INF/partials/script.jsp" />
</body>
</html>
