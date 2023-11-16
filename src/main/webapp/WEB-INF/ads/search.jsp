<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: genesiscruz
  Date: 11/9/23
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Search Results"/>
    </jsp:include>
    <link href="/css/search.css" rel="stylesheet">
    <title>Title</title>
</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp">
    <jsp:param name="location" value="search"/>
</jsp:include>
<div class="container-fluid w-100">
    <h1>Results for: <c:out value="${searched}"/></h1>
    <div class="container-fluid w-100">
        <div class="row">
            <div class="arrow">
                <img src="/assets/images/arrow-right-solid.svg" id="arrow-img">
            </div>
            <c:forEach var="ad" items="${searchedAds}">
                <div class="post-card">
                    <div>
                        <h2>${ad.title}</h2>
                        <p>${ad.description}</p>
                    </div>
                    <div class="ad-img-wrapper">
                        <c:choose>
                            <c:when test="${ad.image == null || ad.image == ''}">
                                <img class="ad-img" src="/assets/images/missing-duck.svg" alt="ad image">
                            </c:when>
                            <c:otherwise>
                                <img src="${ad.image}" alt="ad image" class="ad-img">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <form method="get" action="/ad">
                        <input hidden="hidden" name="ad" value="${ad.id}">
                        <input hidden="hidden" name="from" value="ads">
                        <button class="ad-details" type="submit">View Details</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
