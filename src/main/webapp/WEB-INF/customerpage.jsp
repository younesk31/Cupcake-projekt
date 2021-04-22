<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Kunde Siden
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <h1>Hej ${sessionScope.email} </h1>

        <c:if test="${sessionScope.role == 'customer' }">
            <a href="${pageContext.request.contextPath}/fc/showmyorders" class="btn btn-lg btn btn-outline-secondary" role="button">Dine Ordre</a>
            <a href="${pageContext.request.contextPath}/fc/orderpage" class="btn btn-lg btn btn-outline-success" role="button">Bestil</a>
            <a href="${pageContext.request.contextPath}#" class="btn btn-lg btn btn-outline-dark" role="button">Se Udvalg af Cupcakes</a>
        </c:if>

    </jsp:body>
</t:genericpage>
