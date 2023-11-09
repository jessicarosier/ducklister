<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Viewing All The dao.Ads" />
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
  <h1>Here Are all the ads!</h1>

  <c:forEach var="ad" items="${ads}">
    <div class="col-md-6">
      <h2>${ad.title}</h2>
      <p>${ad.description}</p>
      <form method="post" action="/delete">
        <input hidden="hidden" name="adid" value="${ad.id}">
        <button class="delete-ad" type="submit">Delete Post</button>
      </form>
    </div>
  </c:forEach>
</div>

<jsp:include page="/WEB-INF/partials/script.jsp" />
</body>
</html>