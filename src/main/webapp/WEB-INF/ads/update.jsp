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
    <jsp:param name="title" value="Update Ad" />
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
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
    <input type="submit" class="btn btn-block btn-primary">
    </c:forEach>
  </form>
</div>
</body>
</html>
