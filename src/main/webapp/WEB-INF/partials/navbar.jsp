<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <h3><a href="/">Home</a></h3>
        </div>

        <% session = request.getSession();%>

        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test='<%=session.getAttribute("user") == null%>'>
                    <li><a href="/about">About Us</a></li>
                    <li><a href="/register">Register</a></li>
                    <li><a href="/login">Login</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/ads">View all posts</a></li>
                    <li><a href="/profile">Profile</a></li>
                    <li><a href="/ads/create">Create Post</a></li>
                    <li><a href="/logout">Logout</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
<%--        Genesis messed with this--%>
        <form class="form" action="/ads/search" method="POST">
            <input class="form-control" name="search" id="search" type="search" placeholder="Search"
                   aria-label="Search">
            <button class="btn " type="submit">Search</button>
        </form>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>