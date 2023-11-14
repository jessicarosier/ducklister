<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: genesiscruz
  Date: 11/9/23
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Search Results"/>
  </jsp:include>
  <title>Title</title>
</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<%--<div class="container">--%>
  <h1>Results for: <c:out value="${searched}"/></h1>
  <c:forEach var="ad" items="${searchedAds}">
<%--    <div class="col">--%>
<%--      <div class="col-md-6">--%>
<%--        <h2>${ad.title}</h2>--%>
<%--        <p>${ad.description}</p>--%>
<%--        <form method="post" action="/ad">--%>
<%--          <input hidden="hidden" name="ad" value="${ad.id}">--%>
<%--&lt;%&ndash;          <button class="ad-details" type="submit" >View Details</button>&ndash;%&gt;--%>
<%--        </form>--%>
<%--  </c:forEach>--%>
<%--    //Genesis messed with this--%>
  <div class="col-md-6">
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
  </div>
</c:forEach>

</body>
</html>
