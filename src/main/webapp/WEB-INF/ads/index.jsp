<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The dao.Ads"/>
    </jsp:include>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="/css/ads-index.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container-fluid w-100">
    <h1>Here Are all the ads!</h1>

        <form action="/cat" method="post">
            <select id="category" name="id" type="text" >
                <c:forEach var="cat" items="${cats}">
                    <option value="${cat.id}">${cat.title}</option>
                </c:forEach>
            </select>
            <button type="submit">Submit</button>
        </form>

    <div class="container-fluid w-100">
        <div class="row">
            <c:forEach var="ad" items="${ads}">
                <div class="post-card d-flex">
                    <h2>${ad.title}</h2>

                    <div class="ad-img-wrapper">
                        <img src="${ad.image}"class ="ad-img">
                        <div class="overlay visible">
                            <p>${ad.description}</p>
                        </div>
                    </div>

                    <form method="get" action="/ad">
                        <input hidden="hidden" name="ad" value="${ad.id}">
                        <input hidden="hidden" name="from" value="ads">
                        <button class="ad-details" type="submit">View Details</button>
                    </form>

                    <c:if test="${sessionScope.user.id == ad.userId}">
                        <form method="post" action="/delete">
                            <input hidden="hidden" name="adid" value="${ad.id}">
                            <input hidden="hidden" name="from" value="ads">
                            <button class="delete-ad" type="submit">Delete Post</button>
                        </form>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
<script>
    const movieCard = document.querySelector(".post-card");
    const overlay = document.querySelector(".overlay")

    movieCard.addEventListener("click", (e)=>{
        e.preventDefault()
        console.log(e);
    })

    movieCard.onmouseout = function(event) {
        /* event.target: parent element */
        overlay.classList.toggle("visible");
    };
    movieCard.onmouseover = function(event) {
        overlay.classList.toggle("visible");
        /* event.target: child element (bubbled) */
    };

</script>
</html>