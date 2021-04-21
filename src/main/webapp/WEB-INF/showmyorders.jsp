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

        <form action="${pageContext.request.contextPath}/fc/showmyorderid" method="post">
            <select class="form-select" name="orderid" id="orderid" aria-label="Default select example">
                <option selected>Vælg dit ordre nummer:</option>
                 <c:forEach var="order" items="${requestScope.userOrderListings}">
                        <option value="${order.order_id}">${order.order_id}</option>
                    </c:forEach>
            </select>
                <button id="order" type="submit" class="btn btn-primary btn-sm">Vis denne ordre</button>
        </form>

        <br>

        <c:if test="${requestScope.order != null && not empty requestScope.order && requestScope.order != null}">
        <table class="table table-dark table-hover">
            <tr>
                <th>Ordre nr: <c:out value="${requestScope.userOrderListings.get(requestScope.order-1).order_id}"/></th>
                <th>Oprettet: <c:out value="${requestScope.userOrderListings.get(requestScope.order-1).created}"/></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <tr>
                <th>Topping</th>
                <th>Bund</th>
                <th>Antal</th>
                <th>priser</th>
                <th></th>
            </tr>
            <c:forEach var="repeta" items="${requestScope.userOrderListings.get(requestScope.order-1).cupcakeList}">
                <tr>
                    <td>${repeta.top.name}</td>
                    <td>${repeta.bottom.name}</td>
                    <td>${repeta.quantity}</td>
                    <td>${repeta.price}</td>
                    <td></td>
                </tr>
            </c:forEach>
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th>Subtotal: <c:out value="${requestScope.userOrderListings.get(requestScope.order-1).orderTotal}"/></th>
            </tr>
        </table>
        </c:if>

    </jsp:body>
</t:genericpage>
