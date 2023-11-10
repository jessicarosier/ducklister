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
  <h1>Browse by Category</h1>

  <c:forEach var="cat" items="${cats}" >
    <h2><a>${cat.title}</a></h2>
    <form>
      <input hidden="hidden" name="catId" value="${cat.id}">
    </form>
  </c:forEach>
</div>

<jsp:include page="/WEB-INF/partials/script.jsp" />
</body>
</html>