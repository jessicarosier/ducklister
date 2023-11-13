<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Create a new Ad" />
  </jsp:include>
</head>
<body>
<div class="container">
  <h1>Create a new Ad</h1>
  <form action="/ads/create" method="post">
    <div class="form-group">
      <label for="title">Title</label>
      <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
    </div>
    <div class="form-group">
      <label for="description">Description</label>
      <textarea id="description" name="description" class="form-control" type="text">${ad.description}</textarea>
    </div>
    <div class="form-group">
      <p>Category</p>
      <label> Generic
        <input type="checkbox" name="generic" value="1">
      </label>
      <label> Music
        <input type="checkbox" name="music" value="2">
      </label>
      <label> Sports
        <input type="checkbox" name="sports" value="3">
      </label>
      <label> Seasonal
        <input type="checkbox" name="seasonal" value="4">
      </label>
      <label> International
        <input type="checkbox" name="international" value="5">
      </label>
      <label> Patriotic
        <input type="checkbox" name="patriotic" value="6">
      </label>
      <label> Movie
        <input type="checkbox" name="movie" value="7">
      </label>
      <label> Superhero
        <input type="checkbox" name="superhero" value="8">
      </label>
    </div>
    <input type="submit" class="btn btn-block btn-primary">
  </form>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp" />
</body>
</html>
