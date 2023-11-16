<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="container-fluid">
    <div class="navbar-container">

        <c:if test="${param.location.equals('search')}">
            <form class="form search-form" action="/ads/search" method="POST">
                <input class="form-control" name="search" id="search" type="search" placeholder="Search"
                       aria-label="Search">
                <button class="btn" type="submit" id="search-button">Search</button>
            </form>
        </c:if>

        <% session = request.getSession();%>

        <ul class="navigation-list">
            <c:choose>
                <c:when test='<%=session.getAttribute("user") == null%>'>
                    <li>
                        <a class="nav-links" href="/" id="first-home">
                            <img class="nav-image" id="first-home-duck" style="display: none"
                                 src="/assets/images/favicon.png">
                            Home</a>
                    </li>
                    <li>
                        <a class="nav-links" href="/about" id="first-about">
                            <img class="nav-image" id="first-about-duck" style="display: none"
                                 src="/assets/images/favicon.png">
                            About Us</a>
                    </li>
                    <li>
                        <a class="nav-links" href="/register" id="first-register">
                            <img class="nav-image" id="first-register-duck" style="display: none"
                                 src="/assets/images/favicon.png">
                            Register</a></li>
                    <li>
                        <a class="nav-links" href="/login" id="login">
                            <img class="nav-image" id="login-duck" style="display: none"
                                 src="/assets/images/favicon.png">
                            Login</a></li>
                </c:when>
                <c:otherwise>
                    <li>
                    <a class="nav-links" href="/" id="home">
                        <img class="nav-image" id="home-duck" style="display: none" src="/assets/images/favicon.png">
                        Home</a>
                    </li>
                    <li>
                        <a class="nav-links" href="/about" id="about">
                            <img class="nav-image" id="about-duck" style="display: none"
                                 src="/assets/images/favicon.png">
                            About Us</a>
                    </li>
                    <li>
                        <a class="nav-links" href="/ads" id="view-all">
                            <img class="nav-image" id="view-all-duck" style="display: none" src="/assets/images/favicon.png">
                            View all posts</a></li>
                    <li>
                        <a class="nav-links" href="/profile" id="profile">
                            <img class="nav-image" id="profile-duck" style="display: none"
                                 src="/assets/images/favicon.png">
                            Profile</a></li>
                    <li>
                        <a class="nav-links" href="/profile/update" id="edit">
                            <img class="nav-image" id="edit-duck" style="display: none"
                                 src="/assets/images/favicon.png">
                            Edit Profile</a></li>
                    <li>
                        <a class="nav-links" href="/ads/create" id="create">
                            <img class="nav-image" id="create-duck" style="display: none"
                                 src="/assets/images/favicon.png">
                            Create Post</a></li>
                    <li>
                        <a class="nav-links" href="/logout" id="logout">
                            <img class="nav-image" id="logout-duck" style="display: none"
                                 src="/assets/images/favicon.png">
                            Logout</a></li>
                </c:otherwise>
            </c:choose>
        </ul>

    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>