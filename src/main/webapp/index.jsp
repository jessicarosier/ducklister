<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="page-wrapper">


    <div class="container">
        <div class="row text-center">
            <div class="logo-wrapper">
                <img class="main-logo" src="assets/images/logo.svg">
            </div>
            <div>
                <a href="/ads" class="btn btn-primary">View All Posts</a>
                <a href="/cat" class="btn btn-primary">Browse by Category</a>
            </div>
        </div>
    </div>
    </div>
    <jsp:include page="/WEB-INF/partials/script.jsp" />
</body>
</html>
