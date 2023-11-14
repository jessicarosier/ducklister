<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In"/>
    </jsp:include>
    <link href="/css/login.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <div class="row">
        <div class="col login-wrapper">
            <div class="login">
                <img src="/assets/images/logo.svg" alt="Duck" class="duck">
                <h1>Log in and get ducking!</h1>
                <form action="/login" method="POST">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input id="username" name="username" class="form-control" type="text" value="${Username}">
                    </div>
                    <% String incorrectPassword = (String) request.getAttribute("IncorrectPassword");%>
                    <% if (incorrectPassword != null) { %>
                    <p style="color: red;"><%=incorrectPassword%></p><% } %>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" name="password" class="form-control" type="password">
                    </div>
                    <button type="submit">Log In</button>
                </form>
                <br>
                <div class="register-wrapper">
                    <p>Don't have an account?</p>
                    <a href="/register" class="btn">Register here</a>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
