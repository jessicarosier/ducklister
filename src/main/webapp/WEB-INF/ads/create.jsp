<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
    <link href="/css/create.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp">
    <jsp:param name="location" value="create"/>
</jsp:include>
<div class="container">
    <div id="message" class="messages">
        <%--Form Validation error messages are dynamically placed here with JavaScript--%>
    </div>
    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post" id="create-ad-form">
        <%--  if the user tries to subit a from with missing information, keep the values for the fields that they DID fill in    --%>
        <div class="form-group">
            <c:choose>
                <c:when test="${ad.title != null}">
                    <label for="title">Title</label>
                    <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
                </c:when>
                <c:otherwise>
                    <label for="title">Title</label>
                    <input id="title" name="title" class="form-control" type="text">
                </c:otherwise>
            </c:choose>
        </div>
        <div class="form-group">
            <c:choose>
                <c:when test="${ad.description != null}">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" class="form-control"
                              type="text">${ad.description}</textarea>
                </c:when>
                <c:otherwise>
                    <label for="description">Description</label>
                    <textarea id="description" name="description" class="form-control" type="text"></textarea>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="image-upload-wrapper">
            <c:choose>
                <c:when test="${ad.image != null}">
                    <label for="file-upload" class="custom-file-upload">
                        <i class="fa fa-cloud-upload"></i> Upload Image
                        <input type="file" id="file-upload">
                    </label>
                    <input type="hidden" id="image-url" name="image" value="${ad.image}">
                    <img src="${ad.image}" name="adImage" alt="ad image" class="ad-image" id="temp-pic">
                </c:when>
                <c:otherwise>
                    <label for="file-upload" class="custom-file-upload">
                        <i class="fa fa-cloud-upload"></i> Upload Image
                        <input type="file" id="file-upload">
                    </label>
                    <input type="hidden" id="image-url" name="image" value="">
                    <img src="" name="adImage" alt="ad image" class="ad-image" id="temp-pic">
                </c:otherwise>
            </c:choose>
        </div>

        <div class="form-group">
            <p>Category</p>


            <c:choose>
                <c:when test="${generic != null}">
                    <label> Generic
                        <input class="category" type="checkbox" name="generic" value="1" checked>
                    </label>
                </c:when>
                <c:otherwise>
                    <label> Generic
                        <input class="category" type="checkbox" name="generic" value="1">
                    </label>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${music != null}">
                    <label> Music
                        <input class="category" type="checkbox" name="music" value="2" checked>
                    </label>
                </c:when>
                <c:otherwise>
                    <label> Music
                        <input class="category" type="checkbox" name="music" value="2">
                    </label>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${sports != null}">
                    <label>Sports
                        <input class="category" type="checkbox" name="sports" value="3" checked>
                    </label>
                </c:when>
                <c:otherwise>
                    <label>Sports
                        <input class="category" type="checkbox" name="sports" value="3">
                    </label>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${seasonal != null}">
                    <label>Sports
                        <input class="category" type="checkbox" name="seasonal" value="4" checked>
                    </label>
                </c:when>
                <c:otherwise>
                    <label>Sports
                        <input class="category" type="checkbox" name="seasonal" value="4">
                    </label>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${international != null}">
                    <label> International
                        <input class="category" type="checkbox" name="international" value="5" checked>
                    </label>
                </c:when>
                <c:otherwise>
                    <label> International
                        <input class="category" type="checkbox" name="international" value="5">
                    </label>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${patriotic != null}">
                    <label>Patriotic
                        <input class="category" type="checkbox" name="patriotic" value="6" checked>
                    </label>
                </c:when>
                <c:otherwise>
                    <label>Patriotic
                        <input class="category" type="checkbox" name="patriotic" value="6">
                    </label>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${movie != null}">
                    <label>Movie
                        <input class="category" type="checkbox" name="movie" value="7" checked>
                    </label>
                </c:when>
                <c:otherwise>
                    <label>Movie
                        <input class="category" type="checkbox" name="movie" value="7">
                    </label>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${superhero != null}">
                    <label>Superhero
                        <input class="category" type="checkbox" name="superhero" value="8" checked>
                    </label>
                </c:when>
                <c:otherwise>
                    <label>Superhero
                        <input class="category" type="checkbox" name="superhero" value="8">
                    </label>
                </c:otherwise>
            </c:choose>
            </label>
        </div>
        <button type="submit" id="submit-button" class="btn btn-block btn-primary"> Submit</button>
    </form>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
<script src="/js/create-ad.js" type="module"></script>
</body>
</html>
