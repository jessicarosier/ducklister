<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="partials/messages.jsp"%>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>

    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>

        <form action="/register" method="post">
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input id="firstName" name="firstName" class="form-control" type="text" required="required" value="${User.firstName}">
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input id="lastName" name="lastName" class="form-control" type="text" required="required" value="${User.lastName}">
            </div>
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" required="required">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text" required="required">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password" required="required">
            </div>
            <c:if test="${PasswordError != null}">
                <p style="color:red">Passwords do not match.</p>
            </c:if>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password" required="required">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>

    <jsp:include page="partials/script.jsp" />

</body>
</html>
