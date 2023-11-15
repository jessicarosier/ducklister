<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Browse by category"/>
    </jsp:include>
    <link href="/css/category.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp">
    <jsp:param name="location" value="browse"/>
</jsp:include>

<div class="page-wrapper">
    <div class="container">
        <section class="row">
            <div class="col-md-8 left-side">
                <h1>Browse by Category</h1>
                <div class="cat-form-wrapper">
                    <c:forEach var="cat" items="${cats}">
                        <form action="/cat" method="post" class="cat-form">
                            <input hidden="hidden" name="id" value="${cat.id}">
                            <input class="cat-title" type="submit" name="title" value="${cat.title}">
                        </form>
                    </c:forEach>
                </div>
            </div>
            <div class="col right-side">
                <div class="cat-img-wrapper">
                    <img src="/assets/images/cat-duck4.jpeg" alt="rubber ducks wearing costumes riding in a jeep" class="category-ducks" >
                </div>
            </div>
        </section>
    </div>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>