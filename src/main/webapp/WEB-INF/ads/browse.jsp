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
<h1>${title}</h1>

  <c:choose>
    <c:when test="${ads.isEmpty()}">
      <p>No ads found.</p>
    </c:when>
    <c:otherwise>
      <c:forEach var="ad" items="${ads}" >
        <h2>${ad.title}</h2>
        <p>${ad.description}</p>
        <form action="/ad" method="post">
          <input hidden="hidden" name="ad" value="${ad.id}">
          <input type="submit" name="title" value="View Details">
        </form>
      </c:forEach>
    </c:otherwise>
  </c:choose>

</div>

<jsp:include page="/WEB-INF/partials/script.jsp" />
</body>
</html>