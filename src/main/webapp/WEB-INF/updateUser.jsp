<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Update Profile!" />
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
  <h1>Update Profile.</h1>
  <form action="/profile/update" method="post">
    <div class="form-group">
      <label for="firstName">First Name</label>
      <input id="firstName" name="firstName" class="form-control" type="text" value="${thisUser.getFirstName()}">
    </div>
    <div class="form-group">
      <label for="lastName">Last Name</label>
      <input id="lastName" name="lastName" class="form-control" type="text" value="${thisUser.getLastName()}">
    </div>
    <div class="form-group">
      <label for="username">Username</label>
      <input id="username" name="username" class="form-control" type="text" value="${thisUser.getUsername()}">
    </div>
    <div class="form-group">
      <label for="email">Email</label>
      <input id="email" name="email" class="form-control" type="text" value="${thisUser.getEmail()}">
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input id="password" name="password" class="form-control" type="password">
      <input hidden="hidden" name="id" class="form-control" type="text" value="${thisUser.getId()}">
    </div>

    <input type="submit" class="btn btn-primary btn-block">
  </form>
</div>
</body>
</html>
