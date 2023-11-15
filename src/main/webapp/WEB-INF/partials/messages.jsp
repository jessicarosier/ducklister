<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--When a user successfully registers and is redirected to the Login page - notify them that their registration was successfull--%>
<c:if test="${sessionScope.register != null}">
    <h3 class="error">Registration Successful. Please Log in</h3>
</c:if>




