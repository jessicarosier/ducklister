<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The dao.Ads"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Here Are all the ads!</h1>
    <form action="/cat" method="post">
        <select id="category" name="id" class="form-control" type="text">
            <c:forEach var="cat" items="${cats}">
                <option value="${cat.id}">${cat.title}</option>
            </c:forEach>
        </select>
        <button type="submit">Submit</button>
    </form>


    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <form method="post" action="/ad">
                <input hidden="hidden" name="ad" value="${ad.id}">
                <button class="ad-details" type="submit">View Details</button>
            </form>

            <c:if test="${sessionScope.user.id == ad.userId}">
                <form method="post" action="/delete">
                    <input hidden="hidden" name="adid" value="${ad.id}">
                    <input hidden="hidden" name="from" value="ads">
                    <button class="delete-ad" type="submit">Delete Post</button>
                </form>
            </c:if>

        </div>
    </c:forEach>
</div>

<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>