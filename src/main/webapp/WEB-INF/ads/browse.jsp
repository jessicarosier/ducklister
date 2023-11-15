<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Browse by category"/>
    </jsp:include>
    <link href="/css/browse.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp">
    <jsp:param name="location" value="browse"/>
</jsp:include>
<main class="page-wrapper">
    <div class="container">
        <div class="row header-row">
            <div class="header-wrapper">
                <div class="page-header">
                    <h1>Browse by Category</h1>
                </div>
            </div>
        </div>
        <c:choose>
            <c:when test="${ads.isEmpty()}">
                <div class="form-wrapper">
                    <form action="/cat" method="post" class="category-select-form">
                        <select id="category" name="id" class="form-control category-select" type="text">
                            <c:forEach var="cat" items="${cats}">
                                <option value="${cat.id}">${cat.title}</option>
                            </c:forEach>
                        </select>
                        <button type="submit">Submit</button>
                    </form>
                </div>
                <p>No ads found.</p>
            </c:when>
            <c:otherwise>
                <form action="/cat" method="post" class="category-select-form">
                    <select id="category" name="id" class="form-control" type="text">
                        <c:forEach var="cat" items="${cats}">
                            <option value="${cat.id}">${cat.title}</option>
                        </c:forEach>
                    </select>
                    <button type="submit">Submit</button>
                </form>
                <section class="row">
                    <h2>Ads in this category:</h2>
                        <%-- arrow to let users know this row scrolls horizontally   --%>
                    <div class="arrow">
                        <img src="/assets/images/arrow-right-solid.svg" id="arrow-img">
                    </div>
                    <c:forEach var="ad" items="${ads}">
                        <div class="duck-card">
                            <h2>${ad.title}</h2>
                            <p>${ad.description}</p>
                            <c:choose>
                                <c:when test="${ad.image == null || ad.image == ''}">
                                    <img class="ad-img" src="/assets/images/missing-duck.svg" alt="ad image">
                                </c:when>
                                <c:otherwise>
                                    <img src="${ad.image}" alt="ad image" class="ad-img">
                                </c:otherwise>
                            </c:choose>
                            <form action="/ad" method="get">
                                <input hidden="hidden" name="ad" value="${ad.id}">
                                <button type="submit" name="title">View Details</button>
                            </form>
                        </div>
                    </c:forEach>
                </section>
            </c:otherwise>
        </c:choose>

    </div>
</main>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>