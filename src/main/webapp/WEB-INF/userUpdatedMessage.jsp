<%--
  Created by IntelliJ IDEA.
  User: lpeluyera
  Date: 11/13/23
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Updated Message</title>
</head>
<body>
<form action="/profile" method="get"></form>
    <h1>Profile Updated Successfully</h1>
    <button type="submit">Continue</button>
</body>
<script>
    const button = document.querySelector("button");
    button.addEventListener("click",()=>{
    document.querySelector("form").submit();
    });
</script>
</html>
