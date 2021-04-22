<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Admin Siden
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <h1>Hej ${sessionScope.email} </h1>

        <div>
        <c:if test="${sessionScope.role == 'employee' }">
            <a class="navbar-brand mb-0 h1 text-dark" href="${pageContext.request.contextPath}/fc/customerlist">Customer List</a>
        </c:if>
        </div>

    </jsp:body>
</t:genericpage>
