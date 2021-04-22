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
        <p>Her er kundes ordrer!</p>
        <c:forEach var="order" items="${requestScope.userOrderListings}">
            <c:if test="${order != null && not empty order}">
                <table class="table table-dark table-hover">
                    <th>Ordrer nr: <c:out value="#${order.order_id}"/></th>
                    <th>Oprettet: <c:out value="${order.created}"/></th>
                    <th>Navn: ${order.email} </th>
                    <th>${order.isdelivered}</th>
                    <form action="${pageContext.request.contextPath}/fc/deleteOrder" method="post">
                        <th>
                            <button onclick="" class="btn btn-danger editbtn" type="submit" name="deleteOrder"
                                    value="${order.order_id}">delete order
                            </button>
                            <input type="hidden" name="user_id" value="${order.user_id}">
                    </form>
                    <form action="${pageContext.request.contextPath}/fc/deliverOrder" method="post">
                        <button onclick="" class="btn btn-danger editbtn" type="submit" name="deliverOrder"
                                value="${order.order_id}">udlever ordre
                        </button>
                        <input type="hidden" name="user_id" value="${order.user_id}">
                    </form>
                    </th>

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
                        <th>Subtotal: <c:out value="${order.orderTotal}"/></th>
                    </tr>
                </table>
            </c:if>
        </c:forEach>


    </jsp:body>
</t:genericpage>
