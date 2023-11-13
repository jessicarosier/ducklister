<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The dao.Ads"/>
    </jsp:include>
    <link href="/css/ad.css" rel="stylesheet">

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="page-wrapper">
    <main class="container-fluid">
        <div class="row">
            <h1>Here is the selected ad</h1>
            <div class="col-md-6">
                <c:forEach var="ad" items="${ad}">
                    <h2>${ad.title}</h2>
                    <p>${ad.description}</p>
                    <img src="${ad.image}" alt="ad image">
                    <p>${owner.username}</p>
                    <p>${owner.email}</p>

                    <%--  logic to display delete button if the ad belongs to the logged in user --%>
                    <c:if test="${sessionScope.user.id == ad.userId}">
                        <form method="post" action="/delete">
                            <input hidden="hidden" name="adid" value="${ad.id}">
                            <button class="delete-ad" type="submit">Delete Post</button>
                        </form>
                    </c:if>

                    <%--  logic to display comments that belong to an ad IF they exist --%>
                    <%-- commentUserMap is a Hashmap with the username as the key and the comment made by that user as the value  --%>
                    <c:choose>
                        <c:when test="${commentUserMap.size() > 0}">
                            <h2>Comments</h2>
                            <c:forEach var="comment" items="${commentUserMap}">
                                <div style="border: 1px solid black">
                                    <p>${comment.value}</p>
                                    <p>By: ${comment.key}</p>
                                </div>
                            </c:forEach>

                        </c:when>
                        <c:otherwise>
                            <p>Be the first to comment on this post!</p>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <%-- user should only be able to comment if they are logged in --%>
                        <c:when test="${sessionScope.user != null}">
                            <button id="comment" data-id="${ad.id}">Comment</button>
                        </c:when>
                        <%-- if they are not logged in - call to action --%>
                        <c:otherwise>
                            <p>Want to leave a comment? <a href="/login">Login</a> or <a href="/register">Register</a>
                            </p>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </div>
    </main>
</div>

<script src="/js/ad.js"></script>
</body>
</html>