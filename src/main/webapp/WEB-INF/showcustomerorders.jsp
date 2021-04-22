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
        <h5>Her er ${requestScope.userOrderListings.get(requestScope.orderListings).email} ordrer!</h5>
        <c:forEach var="order" items="${requestScope.userOrderListings}">
            <c:if test="${order != null && not empty order}">
                <table class="table table-dark table-hover">
                    <th>Ordrer nr: #${order.order_id}</th>
                    <th>Status:
                        <c:if test="${order.isdelivered}">
                            udleveret
                        </c:if>
                        <c:if test="${!order.isdelivered}">
                            under behandling
                        </c:if>
                    </th>
                    <th>Oprettet: ${order.created}</th>

                    <th colspan="2">
                    <form action="${pageContext.request.contextPath}/fc/deleteOrder" method="post">
                        <button onclick="" class="btn btn-danger editbtn" type="submit" name="deleteOrder" value="${order.order_id}">Fjern order</button>
                        <input type="hidden" name="user_id" value="${order.user_id}">
                    </form>
                    </th>
                    <th colspan="2">
                    <form action="${pageContext.request.contextPath}/fc/deliverOrder" method="post">
                        <button onclick="" class="btn btn-danger editbtn" type="submit" name="deliverOrder" value="${order.order_id}">Udlever ordre</button>
                        <input type="hidden" name="user_id" value="${order.user_id}">
                    </form>
                    </th>

                    <tr>
                        <th>Topping</th>
                        <th>Bund</th>
                        <th>Antal</th>
                        <th>priser</th>
                        <th colspan="2" style="color: #3dff2f">Subtotal: ${order.orderTotal}</th>
                    </tr>
                    <c:forEach var="repeat" items="${order.cupcakeList}">
                        <tr>
                            <td>${repeat.top.name}</td>
                            <td>${repeat.bottom.name}</td>
                            <td>${repeat.quantity}</td>
                            <td>${repeat.price}</td>
                            <td></td>
                            <td></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </c:forEach>


    </jsp:body>
</t:genericpage>
