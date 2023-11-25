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
<jsp:include page="/WEB-INF/partials/navbar.jsp" >
    <jsp:param name="location" value="ad" />
</jsp:include>
<div class="page-wrapper">
    <main class="container-fluid">
        <div class="row main-row" style="width: 100%">

            <div class="col-md-6">

                <c:forEach var="ad" items="${ad}">
                    <div class="post-card d-flex">
                        <h2>${ad.title}</h2>
                        <p>${ad.description}</p>
                        <div class="ad-img-wrapper">
                            <c:choose>
                                <c:when test="${ad.image == null || ad.image == ''}">
                                    <img class="missing-duck" src="/assets/images/missing-duck.svg" alt="ad image">
                                </c:when>
                                <c:otherwise>
                                    <img src="${ad.image}" alt="ad image" class="ad-img">
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <form method="get" action="/userProfile" class="post-card-form">
                            <input hidden="hidden" name="username" value="${owner.getUsername()}">
                            <input hidden="hidden" name="location" value="viewUser">
                            <button type="submit" contenteditable="false" value="By: ${owner.getUsername()}">By: ${owner.getUsername()}</button>
                        </form>


                        <%--  logic to display delete button if the ad belongs to the logged in user --%>
                        <c:if test="${sessionScope.user.id == ad.userId}">
                            <form method="post" action="/delete" class="post-card-form">
                                <input hidden="hidden" name="adid" value="${ad.id}">
                                <input hidden="hidden" name="from" value="ad">
                                <button class="delete-ad" type="submit">Delete Post</button>
                            </form>
                        </c:if>
                    </div>

                </c:forEach>


            </div>
<%--            end of col left--%>
            <div class="comments-feed-wrapper col-md-6">


                    <c:forEach var="ad" items="${ad}">

                        <c:choose>
                            <%-- user should only be able to comment if they are logged in --%>
                            <c:when test="${sessionScope.user != null}">
                                <button id="comment" class="comment-btn" data-id="${ad.id}">Click here to Comment</button>
                            </c:when>
                            <%-- if they are not logged in - call to action --%>
                            <c:otherwise>
                                <p>Want to leave a comment? <a href="/login">Login</a> or <a href="/register">Register</a>
                                </p>
                            </c:otherwise>
                        </c:choose>
                        <div class="comments-feed">
                        <div class="comments">
                                <%--  logic to display comments that belong to an ad IF they exist --%>
                                <%-- commentUserMap is a Hashmap with the username as the key and the comment made by that user as the value  --%>
                            <c:choose>

                                <c:when test="${commentUserMap.size() > 0}">
                                    <h2 class="comments-h2" hidden="hidden">Comments</h2>
                                    <c:forEach var="comment" items="${commentUserMap}">
                                        <div class="comment" >
                                            <form method="get" action="/userProfile" class="form-inside-comment">
                                                <input hidden="hidden" name="username" value="${comment.value.getUsername()}">
                                                <input hidden="hidden" name="location" value="viewUser">
                                               <b>
                                                   <input style="min-width: 75px; background-color: transparent; border: none; text-decoration: underline" type="submit" contenteditable="false" value="${comment.value.getUsername()}">
                                               </b>
                                            </form>
                                            <br>
                                            <p>${comment.key}</p>
                                        </div>
                                    </c:forEach>

                                </c:when>
                                <c:otherwise>
                                    <p>Be the first to comment on this post!</p>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                    </c:forEach>

            </div>
        </div>
    </main>
</div>

<script src="/js/ad.js"></script>
</body>
</html>