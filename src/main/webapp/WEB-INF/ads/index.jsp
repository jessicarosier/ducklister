<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The dao.Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <form>
        <h2>Browse by category:</h2>
        <label for="category">Category</label>
        <select id="category" name="category" class="form-control" type="text">
            <option value="1">Generic</option>
            <option value="2">Music</option>
            <option value="3">Sports</option>
            <option value="4">Seasonal</option>
            <option value="5">International</option>
            <option value="6">Patriotic</option>
            <option value="7">Movie</option>
            <option value="8">Superhero</option>
        </select>
    </form>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <form method="post" action="/ad">
                <input hidden="hidden" name="ad" value="${ad.id}">
                <button class="ad-details" type="submit" >View Details</button>
            </form>

            <c:if test="${sessionScope.user.id == ad.userId}">
                <form method="post" action="/delete">
                    <input hidden="hidden" name="adid" value="${ad.id}">
                    <button class="delete-ad" type="submit">Delete Post</button>
                </form>
            </c:if>

        </div>
    </c:forEach>
</div>

<jsp:include page="/WEB-INF/partials/script.jsp" />
</body>
</html>