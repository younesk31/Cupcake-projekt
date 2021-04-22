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

        //Todo: Hive liste af users ud fra DB

        <form action="${pageContext.request.contextPath}/fc/showcustomerorders" method="post">
            <select class="form-select" name="user_id" id="user_id" aria-label="Default select example">
                <option selected>Vælg en kunde:</option>
                 <c:forEach var="user" items="${sessionScope.customerList}">
                        <option value="${user.id}">${user.email}</option>
                    </c:forEach>
            </select>
                <button id="userOrders" type="submit" class="btn btn-primary btn-sm">Vis denne kundes ordre</button>
        </form>

        <br>

        <c:if test="${requestScope.order != null && not empty requestScope.order}">
        <table class="table table-dark table-hover">
            <c:forEach var="orders" items="${requestScope.orderListings}">

            <tr>
                <th>Ordre nr: <c:out value="${requestScope.orderListings.get(requestScope.order-1).order_id}"/></th>
                <th>Oprettet: <c:out value="${requestScope.orderListings.get(requestScope.order-1).created}"/></th>
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
            <c:forEach var="repeta" items="${requestScope.orderListings.get(requestScope.order-1).cupcakeList}">
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
                <th>Subtotal: <c:out value="${requestScope.orderListings.get(requestScope.order-1).orderTotal}"/></th>
            </tr>
        </table>
        </c:forEach>
        </c:if>


    </jsp:body>
</t:genericpage>
