<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <link href="${pageContext.request.contextPath}/css/profile.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="page-wrapper">
    <div class="container">
        <c:choose>
        <c:when test="${location == 'viewUser'}">
            <h1>${userToView.firstName} ${userToView.lastName}!</h1>
            <c:choose>
                <c:when test="${userToView.avatar != null}">
                    <img src="${userToView.avatar}" name="avatar" alt="avatar" class="avatar" id="profile-pic">
                </c:when>
                <c:otherwise>
                    <img src="/assets/images/default-profile.png" name="avatar" alt="avatar" class="avatar" id="profile-pic">
                </c:otherwise>
            </c:choose>
            <main class="profile">
                <div class="row">
                    <section class="col-md-6">
                                <div class="profile-info">
                                    <h2>${userToView.username}'s Jeep:</h2>
                                    <p>Model: ${userToView.getJeepModel()}</p>
                                    <p>year: ${userToView.getJeepYear()}</p>
                                    <p>color: ${userToView.getJeepColor()}</p>
                                </div>
                    </section>
                    <section class="col-md-6">
                        <c:choose>
                            <c:when test="${usersAds.isEmpty()}">
                                <h2>${userToView.username} has no active posts.</h2>
                            </c:when>
                            <c:otherwise>
                                <h2>${userToView.username}'s active posts:</h2>
                                <c:forEach var="ad" items="${usersAds}">
                                    <div class="col-md-6">
                                        <h2>${ad.title}</h2>
                                        <p>${ad.description}</p>
                                        <c:choose>
                                            <c:when test="${ad.image != null}">
                                                <img src="${ad.image}" alt="ad image">
                                            </c:when>
                                            <c:otherwise>
                                                <img class="missing-duck" src="/assets/images/missing-duck.svg" alt="ad image" style="width: 250px">
                                            </c:otherwise>
                                        </c:choose>
                                        <form method="get" action="/ad">
                                            <input hidden="hidden" name="ad" value="${ad.id}">
                                            <input hidden="hidden" name="from" value="ads">
                                            <button class="ad-details" type="submit">View Details</button>
                                        </form>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </section>
                </div>
            </main>
        </c:when>
        <c:otherwise>

        <h1>Welcome, ${thisUser.firstName} ${thisUser.lastName}!</h1>

        <c:choose>
            <c:when test="${sessionScope.user.avatar == null}">
                <div class="image-upload-wrapper">
                    <label>Upload Profile Picture
                        <input type="file" id="file-upload">
                    </label>
                    <form id="image-form" method="post" action="/images">
                        <input type="hidden" id="image-url" name="image" value="">
                        <input type="hidden" name="location" value="profile">
                    </form>
                    <img src="/assets/images/default-profile.png" name="avatar" alt="avatar" class="avatar"
                         id="temp-pic">
                </div>
            </c:when>
            <c:otherwise>
                <img src="${sessionScope.user.avatar}" name="avatar" alt="avatar" class="avatar" id="profile-pic">
            </c:otherwise>
        </c:choose>
        <main class="profile">
            <div class="row">
                <section class="col-md-6">
                    <c:choose>
                        <c:when test="${thisUser.getJeepModel() ==null || thisUser.getJeepYear() == null || thisUser.getJeepColor() == null }">
                            <div class="profile-info">
                                <h2>Tell us about your Jeep</h2>
                                <p>Model: </p>
                                <p>year: </p>
                                <p>color: </p>
                                <form method="get" action="/profile/update">
                                    <button class="update-profile">Update Info</button>
                                </form>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="profile-info">
                                <h2>Your Jeep:</h2>
                                <p>Model: ${thisUser.getJeepModel()}</p>
                                <p>year: ${thisUser.getJeepYear()}</p>
                                <p>color: ${thisUser.getJeepColor()}</p>
                            </div>

                        </c:otherwise>
                    </c:choose>

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
                                    <c:choose>
                                        <c:when test="${ad.image != null}">
                                            <img src="${ad.image}" alt="ad image">
                                        </c:when>
                                        <c:otherwise>
                                            <img class="missing-duck" src="/assets/images/missing-duck.svg" alt="ad image">
                                        </c:otherwise>
                                    </c:choose>
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
                    </c:otherwise>
                    </c:choose>
                </section>
            </div>
        </main>
    </div>
</div>
<script src="//static.filestackapi.com/filestack-js/3.x.x/filestack.min.js"></script>
<script src="/js/profile.js" type="module"></script>

</body>
</html>
