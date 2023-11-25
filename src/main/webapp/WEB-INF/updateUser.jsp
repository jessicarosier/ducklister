<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Profile!"/>
    </jsp:include>
    <link href="/css/update-user.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp">
    <jsp:param name="location" value="updateUser"/>
</jsp:include>
<div class="page-wrapper">
    <div class="update-container">
        <div class="form-container">
            <div class="update-user-form-wrapper">

                <h1>Update Profile.</h1>
                <form action="/profile/update" method="post">

                    <div class="form-group">
                        <label for="file-upload" class="custom-file-upload">Update Profile Pic
                            <input type="file" id="file-upload">
                        </label>
                        <input type="hidden" id="image-url" name="image" value="${thisUser.getAvatar()}">
                        <img src="${thisUser.getAvatar()}" name="adImage" alt="ad image" class="ad-image"
                             id="temp-pic">
                    </div>

                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input required id="firstName" name="firstName" class="form-control" type="text"
                               value="${thisUser.getFirstName()}">
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input required id="lastName" name="lastName" class="form-control" type="text"
                               value="${thisUser.getLastName()}">
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input required id="username" name="username" class="form-control" type="text"
                               value="${thisUser.getUsername()}">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input required id="email" name="email" class="form-control" type="text"
                               value="${thisUser.getEmail()}">
                    </div>
                    <h2>Update Jeep.</h2>
                    <div class="form-group">
                        <label for="model">Model</label>
                        <input required id="model" name="model" class="form-control" type="text"
                               value="${thisUser.getJeepModel()}">
                    </div>
                    <div class="form-group">
                        <label for="year">Year</label>
                        <input required id="year" name="year" class="form-control" type="text"
                               value="${thisUser.getJeepYear()}">
                    </div>
                    <div class="form-group">
                        <label for="color">Color</label>
                        <input required id="color" name="color" class="form-control" type="text"
                               value="${thisUser.getJeepColor()}">
                    </div>

                    <input hidden="hidden" name="id" value="${thisUser.getId()}">

                    <button type="submit">Submit</button>
                </form>
            </div>
            <div class="update-password-form-wrapper">
                <h2>Update Password.</h2>

                <form method="post" action="/profile/update/password">
                    <div class="form-group">
                        <label for="password">New Password</label>
                        <input required id="password" name="password" class="form-control" type="password">
                    </div>
                    <div class="form-group">
                        <label for="confirm_password">Confirm Password</label>
                        <input required id="confirm_password" name="confirm_password" class="form-control"
                               type="password">
                    </div>
                    <input hidden="hidden" name="id" value="${thisUser.getId()}">
                    <button type="submit">Submit</button>
                </form>

            </div>
        </div>
    </div>
</div>

</body>

<script src="//static.filestackapi.com/filestack-js/3.x.x/filestack.min.js"></script>
<script src="/js/updateUser.js" type="module"></script>
</html>
