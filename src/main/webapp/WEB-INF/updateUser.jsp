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
        <input required id="firstName" name="firstName" class="form-control" type="text" value="${thisUser.getFirstName()}">
      </div>
      <div class="form-group">
        <label for="lastName">Last Name</label>
        <input required id="lastName" name="lastName" class="form-control" type="text" value="${thisUser.getLastName()}">
      </div>
      <div class="form-group">
        <label for="username">Username</label>
        <input required id="username" name="username" class="form-control" type="text" value="${thisUser.getUsername()}">
      </div>
      <div class="form-group">
        <label for="email">Email</label>
        <input required id="email" name="email" class="form-control" type="text" value="${thisUser.getEmail()}">
      </div>

      <input hidden="hidden" name="id" value="${thisUser.getId()}">

      <input type="submit" class="btn btn-primary btn-block">
    </form>

    <h2>Update Password.</h2>

    <form method="post" action="/profile/update/password">
      <div class="form-group">
        <label for="password">New Password</label>
        <input required id="password" name="password" class="form-control" type="password">
      </div>
      <div class="form-group">
        <label for="confirm_password">Confirm Password</label>
        <input required id="confirm_password" name="confirm_password" class="form-control" type="password">
      </div>
      <input hidden="hidden" name="id" value="${thisUser.getId()}">
      <input type="submit" class="btn btn-primary btn-block">
    </form>
  </div>
</body>
</html>
