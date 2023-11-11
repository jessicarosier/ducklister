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
                    <p>${owner.username}</p>
                    <p>${owner.email}</p>

                    <c:if test="${sessionScope.user.id == ad.userId}">
                        <form method="post" action="/delete">
                            <input hidden="hidden" name="adid" value="${ad.id}">
                            <button class="delete-ad" type="submit">Delete Post</button>
                        </form>
                    </c:if>
                    <c:if test="${comment != null}">
                        <div>
                            <h3>${comment.username}</h3>
                            <p>${comment.comment}</p>
                        </div>
                    </c:if>
                    <button id="comment" data-id="${ad.id}">Comment</button>
                </c:forEach>
            </div>

        </div>
    </main>
</div>

<script src="/js/ad.js"></script>
</body>
</html>