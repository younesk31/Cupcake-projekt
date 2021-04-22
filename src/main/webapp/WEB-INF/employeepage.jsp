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

        <c:if test="${sessionScope.role == 'employee' }">
            <a href="${pageContext.request.contextPath}/fc/customerlist" class="btn btn-lg btn btn-outline-dark" role="button">Kunde Liste</a>
        </c:if>

    </jsp:body>
</t:genericpage>
