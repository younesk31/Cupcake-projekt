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
                    <th>Ordre nr: ${order.order_id}</th>
                    <th>${order.created}</th>
                    <th></th>
                    <th>${order.orderTotal}</th>
                </tr>
                <tr>
                    <th>Top</th>
                    <th>Bund</th>
                    <th>Antal</th>
                    <th>Subtotal</th>
                </tr>
                ${order.cupcakeList.size()}
                <c:forEach var="line" items="${order.cupcakeList}">
                    <tr>
                        <td>${line.top.name}</td>
                        <td>${line.bottom.name}</td>
                        <td>${line.quantity}</td>
                        <td>${line.price}</td>
                    </tr>
                </c:forEach>
            </c:forEach>
            <td></td>
        </table>

    </jsp:body>
</t:genericpage>
