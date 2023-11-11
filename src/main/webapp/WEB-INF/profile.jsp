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
<div class="page-wrapper">
    <div class="container">
        <h1>Welcome, ${sessionScope.user.firstName} ${sessionScope.user.lastName}!</h1>

        <main class="profile">
            <div class="row">
                <section class="col-md-6">
                    <div class="profile-info">
                        <h2>Tell us about your Jeep</h2>
                        <p>Model: </p>
                        <p>year: </p>
                        <p>color: </p>
                        <button class="update-profile">Save to your Profile</button>
                    </div>
                </section>
                <section class="col-md-6">
                    <c:choose>
                        <c:when test="${ads.isEmpty()}">
                            <h2>You have no active posts.</h2>
                            <a href="/ads/create">Create a post now!</a>
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
                                            <input hidden="hidden" name="from" value="profile">
                                            <button class="delete-ad" type="submit">Delete Post</button>
                                        </form>
                                        <form method="get" action="/update">
                                            <input hidden="hidden" name="ad" value="${ad.id}">
                                            <input hidden="hidden" name="from" value="profile">
                                            <button class="update-ad" type="submit">Update Post</button>
                                        </form>
                                    </c:if>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </section>
            </div>
        </main>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/profile.js"></script>
<script src="//static.filestackapi.com/filestack-js/3.x.x/filestack.min.js"></script>
</body>
</html>
