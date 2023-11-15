<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--LOGIN MESSAGES--%>
<c:if test="${sessionScope.register != null}">
    <h3 class="error">Registration Successful. Please Log in</h3>
</c:if>



<%--CREATE AD ERROR MESSAGES--%>
<c:if test="${sessionScope.titleError != null}">
    <h3 class="error">${sessionScope.titleError}</h3>
</c:if>

<c:if test="${sessionScope.descriptionError != null}">
    <h3 class="error">${sessionScope.descriptionError}</h3>
</c:if>

<c:if test="${sessionScope.categoryError != null}">
    <h3 class="error">${sessionScope.categoryError}</h3>
</c:if>


