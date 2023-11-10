<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Browse by category" />
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
  <h1>Browse by Category</h1>

  <c:forEach var="cat" items="${cats}" >

    <form action="/cat" method="post">
      <input hidden="hidden" name="id" value="${cat.id}">
      <input type="submit" name="title" value="${cat.title}">
    </form>
  </c:forEach>
</div>

<jsp:include page="/WEB-INF/partials/script.jsp" />
</body>
</html>