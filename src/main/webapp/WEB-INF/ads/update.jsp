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
        <jsp:param name="title" value="Update Ad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>Edit the ad:</h1>
    <form action="/update" method="post">
        <c:forEach var="ad" items="${thisAd}">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text">
                        ${ad.description}
                </textarea>
            </div>
            <input hidden="hidden" name="adId" value="${ad.id}">
        </c:forEach>
        <div class="form-group">
            <p>Category</p>
            <label> Generic
                <c:choose>
                    <c:when test="${generic != null}">
                        <input type="checkbox" name="generic" value="1" checked>
                    </c:when>
                    <c:otherwise>
                        <input type="checkbox" name="generic" value="1">
                    </c:otherwise>
                </c:choose>
            </label>
            <label> Music
                <c:choose>
                    <c:when test="${music != null}">
                        <input type="checkbox" name="music" value="2" checked>
                    </c:when>
                    <c:otherwise>
                        <input type="checkbox" name="music" value="2">
                    </c:otherwise>
                </c:choose>
            </label>
            <label> Sports
                <c:choose>
                    <c:when test="${sports != null}">
                        <input type="checkbox" name="sports" value="3" checked>
                    </c:when>
                    <c:otherwise>
                        <input type="checkbox" name="sports" value="3">
                    </c:otherwise>
                </c:choose>
            </label>
            <label> Seasonal
                <c:choose>
                    <c:when test="${seasonal != null}">
                        <input type="checkbox" name="seasonal" value="4" checked>
                    </c:when>
                    <c:otherwise>
                        <input type="checkbox" name="seasonal" value="4">
                    </c:otherwise>
                </c:choose>
            </label>
            <label> International
                <c:choose>
                    <c:when test="${international != null}">
                        <input type="checkbox" name="international" value="5" checked>
                    </c:when>
                    <c:otherwise>
                        <input type="checkbox" name="international" value="5">
                    </c:otherwise>
                </c:choose>
            </label>
            <label> Patriotic
                <c:choose>
                    <c:when test="${patriotic != null}">
                        <input type="checkbox" name="patriotic" value="6" checked>
                    </c:when>
                    <c:otherwise>
                        <input type="checkbox" name="patriotic" value="6">
                    </c:otherwise>
                </c:choose>
            </label>
            <label> Movie
                <c:choose>
                    <c:when test="${movie != null}">
                        <input type="checkbox" name="movie" value="7" checked>
                    </c:when>
                    <c:otherwise>
                        <input type="checkbox" name="movie" value="7">
                    </c:otherwise>
                </c:choose>
            </label>
            <label> Superhero
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
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
