<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Mine ordre
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <h1>Hej ${sessionScope.email} </h1>
        Her er dine tidligere ordre!
        <%--  ${order.cupcakeList.size()} --%>

        <c:forEach var="order" items="${requestScope.userOrderListings}">
            <c:if test="${order != null && not empty order}">
            <table class="table table-dark table-hover">
                <tr>
                 <th>Ordrer nr: <c:out value="#${order.order_id}"/></th>
                    <th>Oprettet: <c:out value="${order.created}"/></th>
                    <th></th>
                    <th>Status:
                        <c:if test="${order.isdelivered}">
                            udleveret
                        </c:if>
                        <c:if test="${!order.isdelivered}">
                            under behandling
                        </c:if></th>
                    <th></th>
                </tr>
                <tr>
                 <th>Topping</th>
                    <th>Bund</th>
                    <th>Antal</th>
                    <th>priser</th>
                    <th></th>
                </tr>
                <c:forEach var="repeat" items="${order.cupcakeList}">
                    <tr>
                        <td>${repeat.top.name}</td>
                        <td>${repeat.bottom.name}</td>
                        <td>${repeat.quantity}</td>
                        <td>${repeat.price}</td>
                        <td></td>
                    </tr>
                </c:forEach>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th>Total: <c:out value="${order.orderTotal}"/></th>
                </tr>
            </table>
            </c:if>
        </c:forEach>

    </jsp:body>
</t:genericpage>
