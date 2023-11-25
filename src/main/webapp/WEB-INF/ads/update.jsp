<%--
  Created by IntelliJ IDEA.
  User: jessicarosier
  Date: 11/9/23
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update ad"/>
    </jsp:include>
    <link href="${pageContext.request.contextPath}/css/update.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp">
    <jsp:param name="location" value="update"/>
</jsp:include>
<div class="container p-4">
    <div class="content">
        <div class="edit-ad-text">
            <h1 class="text-center">Update Your Duck</h1>
        </div>
        <form action="/update" method="post" class="form-edit">
            <img src="${User.avatar}" name="avatar" alt="avatar" class="avatar" id="profile-pic">
            <c:forEach var="ad" items="${thisAd}">

                <div class="form-group title">
                    <label for="title">Title</label>
                    <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
                </div>

                <div class="form-group description">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" class="form-control" type="text">${ad.description}
                    </textarea>
                </div>

                <div class="edit-image-content">
                    <input hidden="hidden" name="adId" value="${ad.id}">
                    <label for="file-upload" class="custom-file-upload">Edit Image
                        <input type="file" id="file-upload">
                    </label>
                    <input type="hidden" id="image-url" name="image" value="">
                    <img src="" name="adImage" alt="ad image" class="ad-image" id="temp-pic">
                </div>


            </c:forEach>
            <div class="form-group category">
                <div class="align-p">
                    <p><b>Select categories</b></p></div>
                <div class="categories-group">
                    <label class="category-label"> Generic
                        <c:choose>
                            <c:when test="${generic != null}">
                                <input type="checkbox" name="generic" value="1" checked>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="generic" value="1">
                            </c:otherwise>
                        </c:choose>
                    </label>
                    <label class="category-label"> Music
                        <c:choose>
                            <c:when test="${music != null}">
                                <input type="checkbox" name="music" value="2" checked>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="music" value="2">
                            </c:otherwise>
                        </c:choose>
                    </label>
                    <label class="category-label"> Sports
                        <c:choose>
                            <c:when test="${sports != null}">
                                <input type="checkbox" name="sports" value="3" checked>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="sports" value="3">
                            </c:otherwise>
                        </c:choose>
                    </label>
                    <label class="category-label"> Seasonal
                        <c:choose>
                            <c:when test="${seasonal != null}">
                                <input type="checkbox" name="seasonal" value="4" checked>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="seasonal" value="4">
                            </c:otherwise>
                        </c:choose>
                    </label>
                    <label class="category-label"> International
                        <c:choose>
                            <c:when test="${international != null}">
                                <input type="checkbox" name="international" value="5" checked>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="international" value="5">
                            </c:otherwise>
                        </c:choose>
                    </label>
                    <label class="category-label"> Patriotic
                        <c:choose>
                            <c:when test="${patriotic != null}">
                                <input type="checkbox" name="patriotic" value="6" checked>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="patriotic" value="6">
                            </c:otherwise>
                        </c:choose>
                    </label>
                    <label class="category-label"> Movie
                        <c:choose>
                            <c:when test="${movie != null}">
                                <input type="checkbox" name="movie" value="7" checked>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="movie" value="7">
                            </c:otherwise>
                        </c:choose>
                    </label>
                    <label class="category-label"> Superhero
                        <c:choose>
                            <c:when test="${superhero != null}">
                                <input type="checkbox" name="superhero" value="8" checked>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="superhero" value="8">
                            </c:otherwise>
                        </c:choose>
                    </label>
                </div>
            </div>
            <button type="submit">Submit</button>
        </form>
    </div>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
<script src="//static.filestackapi.com/filestack-js/3.x.x/filestack.min.js"></script>
<script type="module" src="/js/updateAdImage.js"></script>
</body>
</html>
