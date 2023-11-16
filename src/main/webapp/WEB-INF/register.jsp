<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="partials/messages.jsp" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!"/>
    </jsp:include>
    <link href="/css/register.css" rel="stylesheet">
</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp">
    <jsp:param name="location" value="register"/>
</jsp:include>
<div class="container">
    <div class="register-form-container">
        <div class="register-form-wrapper">
            <h1>Register for a new account</h1>
            <div class="heart-duck-wrapper">
            <p>It's quack and easy.</p>
                <img class="nav-image" id="hidden-duck" src="/assets/images/heart-eyes-duck.png">
            </div>


            <form action="/register" method="post" id="register-form">

                <div class="form-group input-wrapper">
                    <label for="firstName"></label>
                    <input id="firstName" name="firstName" class="form-control full-name" type="text"
                           required="required"
                           value="${FirstName}" placeholder="First name">
                    <label for="lastName"></label>
                    <input id="lastName" name="lastName" class="form-control full-name" type="text" required="required"
                           value="${LastName}" placeholder="Last name">
                </div>

                <c:if test="${UsernameError != null}">
                    <p style="color: red;">${UsernameError}</p>
                </c:if>
                <div class="form-group single-input-wrapper">
                    <label for="username"></label>
                    <input id="username" name="username" class="form-control username-email" type="text"
                           required="required"
                           value="${Username}" placeholder="Username">
                </div>
                <% String emailError = (String) request.getAttribute("EmailError");%>
                <% if (emailError != null) { %>
                <p style="color: red;"><%=emailError%>
                </p><% } %>

                <div class="form-group single-input-wrapper">
                    <label for="email"></label>
                    <input id="email" name="email" class="form-control username-email" type="email" required="required"
                           value="${Email}" placeholder="name@example.com">
                </div>
                <% String passwordError = (String) request.getAttribute("PasswordError");%>
                <% if (passwordError != null) { %>
                <p style="color: red;"><%=passwordError%>
                </p><% } %>

                <div class="form-group input-wrapper">
                    <label for="password"></label>
                    <input id="password" name="password" class="form-control password" type="password"
                           required="required" placeholder="New Password">
                    <label for="confirm_password"></label>
                    <input id="confirm_password" name="confirm_password" class="form-control password" type="password"
                           required="required" placeholder="Confirm Password">
                </div>

                    <button id="register-button" type="submit">Sign Up</button>

            </form>
        </div>
    </div>
</div>

<jsp:include page="partials/script.jsp"/>
<script src="/js/register.js"></script>
</body>
</html>
