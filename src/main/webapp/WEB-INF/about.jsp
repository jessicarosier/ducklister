<%--
  Created by IntelliJ IDEA.
  User: jessicarosier
  Date: 11/12/23
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="About Us" />
  </jsp:include>
  <link href="/css/about.css" rel="stylesheet">
</head>
<body>



<jsp:include page="/WEB-INF/partials/navbar.jsp" >
  <jsp:param name="location" value="about" />
</jsp:include>

  <div class="page-wrapper" >
      <h1>Welcome</h1>
      <div class="about-us">



        <p> Welcome to Duck Lister – the ultimate online community for Jeep enthusiasts to celebrate the unique bond between Jeep owners and their rubber ducks. Our platform provides a fun and interactive space for Jeep Owners to register their beloved vehicles and showcase their rubber duck collections.</p>

        <p>Who are we? We are a passionate team of Jeep enthusiasts who understand that the love for these iconic vehicles goes beyond the ordinary. We recognized the special connection that many Jeep owners share with their rubber ducks wanted to create a dedicated space to honor this quirky tradition.</p>

        <p>Why rubber ducks, you ask? Well, the tradition of adorning Jeeps with rubber ducks has become a symbol of the community's lighthearted spirit and camaraderie. It's a nod to the playful side of off-roading and a way for Jeep owners to express their individuality.</p>

        <p>When you register to use Duck Lister, you can create a personalized profile for your Jeep to showcase your rubber duck collection. Connect with like-minded enthusiasts and discover the diverse array of rubber duck styles that adorn Jeeps around the world.</p>

        <p>Whether you're here to find inspiration for your own rubber duck collection or simply want to connect with fellow Jeep enthusiasts, Duck Lister is your go-to destination. Join us in celebrating the unique bond between Jeep owners and their rubber ducks – because life is too short to be serious all the time.</p>

      </div>
  </div>

<jsp:include page="/WEB-INF/partials/script.jsp" />
</body>
</html>
