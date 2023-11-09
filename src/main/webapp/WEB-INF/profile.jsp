<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Welcome, ${sessionScope.user.firstName} ${sessionScope.user.lastName}!</h1>

    <div>
        <c:choose>
            <c:when test="${ads.isEmpty()}">
                <h2>You have no active posts.</h2>
            </c:when>
            <c:otherwise>
                <h2>Your active posts:</h2>

                <c:forEach var="ad" items="${ads}">
                    <div class="col-md-6">
                        <h2>${ad.title}</h2>
                        <p>${ad.description}</p>
                        <c:if test="${sessionScope.user.id == ad.userId}">
                            <form method="post" action="/delete">
                                <input hidden="hidden" name="adid" value="${ad.id}">
                                <button class="delete-ad" type="submit">Delete Post</button>
                            </form>
                        </c:if>
                    </div>
                </c:forEach>
            </c:otherwise>

        </c:choose>


    </div>

</div>

</body>
</html>
