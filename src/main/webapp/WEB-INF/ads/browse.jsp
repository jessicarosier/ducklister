<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Browse by category" />
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" >
  <jsp:param name="location" value="browse" />
</jsp:include>

<div class="container">
  <h1>Browse by Category</h1>
<h1>${title}</h1>

  <c:choose>
    <c:when test="${ads.isEmpty()}">
      <form action="/cat" method="post">
        <select id="category" name="id" class="form-control" type="text">
          <c:forEach var="cat" items="${cats}">
            <option value="${cat.id}">${cat.title}</option>
          </c:forEach>
        </select>
        <button type="submit">Submit</button>
      </form>
      <p>No ads found.</p>
    </c:when>
    <c:otherwise>
      <form action="/cat" method="post">
        <select id="category" name="id" class="form-control" type="text">
          <c:forEach var="cat" items="${cats}">
            <option value="${cat.id}">${cat.title}</option>
          </c:forEach>
        </select>
        <button type="submit">Submit</button>
      </form>
      <c:forEach var="ad" items="${ads}" >
        <h2>${ad.title}</h2>
        <p>${ad.description}</p>
        <c:choose>
          <c:when test="${ad.image == null || ad.image == ''}">
            <img class="missing-duck" src="/assets/images/missing-duck.svg" alt="ad image">
          </c:when>
          <c:otherwise>
            <img src="${ad.image}" alt="ad image" class="ad-img">
          </c:otherwise>
        </c:choose>
        <form action="/ad" method="get">
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