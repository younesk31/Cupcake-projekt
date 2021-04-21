<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Demo Page for Employee Roles
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <h1>Hello ${sessionScope.role} </h1>
        You are now logged in as a EMPLOYEE of our wonderful site.

        <table class="table table-dark table-hover">
            <c:forEach var="order" items="${requestScope.userOrderListings}">
                <tr>
                    <td>Ordre nr: ${order.order_id}</td>
                    <td>${order.created}</td>
                </tr>
                <c:forEach var="line" items="${order.cupcakeList}">
                    <tr>
                        <th>Top</th>
                        <th>Bund</th>
                        <th>Antal</th>
                        <th>Subtotal</th>
                        <td>${line.top.name}</td>
                        <td>${line.bottom.name}</td>
                        <td>${line.quantity}</td>
                        <td>${line.price}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>${order.orderTotal}</td>
                </tr>
            </c:forEach>
            <td></td>
        </table>

    </jsp:body>
</t:genericpage>
