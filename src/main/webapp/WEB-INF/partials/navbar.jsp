<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-default">
    <div class="navbar-container">
        <form class="form search-form" action="/ads/search" method="POST">
            <input class="form-control" name="search" id="search" type="search" placeholder="Search"
                   aria-label="Search">
            <button class="btn" type="submit">Search</button>
        </form>
        <% session = request.getSession();%>

        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test='<%=session.getAttribute("user") == null%>'>
                    <li><a class="nav-link" href="/">Home</a></li>
                    <li><a class="nav-link" href="/about">About Us</a></li>
                    <li><a class="nav-link" href="/register">Register</a></li>
                    <li><a class="nav-link" href="/login">Login</a></li>
                </c:when>
                <c:otherwise>
                    <li><a class="nav-link" href="/">Home</a></li>
                    <li><a class="nav-link" href="/ads">View all posts</a></li>
                    <li><a class="nav-link" href="/profile">Profile</a></li>
                    <li><a class="nav-link" href="/profile/update"> Edit Profile</a></li>
                    <li><a class="nav-link" href="/ads/create">Create Post</a></li>
                    <li><a class="nav-link" href="/logout">Logout</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
        <%--        Genesis messed with this--%>
        <%--        <form class="form" action="/ads/search" method="POST">--%>
        <%--            <input class="form-control" name="search" id="search" type="search" placeholder="Search"--%>
        <%--                   aria-label="Search">--%>
        <%--            <button class="btn " type="submit">Search</button>--%>
        <%--        </form>--%>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>