<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Cart
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <form action="${pageContext.request.contextPath}/fc/updatequantity" method="post">
            <table class="table table-striped table-dark table-hover ">
                <thead>
                <tr>
                    <th scope="col">Bund</th>
                    <th scope="col">Topping</th>
                    <th scope="col">Antal</th>
                    <th scope="col">Pris</th>
                    <th></th>
                </tr>
                </thead>
                <c:forEach var="cart" items="${sessionScope.cupcakeList}" varStatus="status">
                    <tr>
                        <td>${cart.bottom.name}</td>
                        <td>${cart.top.name}</td>
                        <td>
                            <input type="number" class="" id="ex1" name="quantity" min="0" step="1"
                                   value="${cart.quantity}">
                        </td>
                        <td>${cart.price}</td>
                        <!-- OrderLine doesn't exist and doesn't have an ID, so we're using the loop index to identify the item selected -->
                        <td>
                            <button type="submit" class="btn btn-danger" name="remove" value="${status.index}">Fjern</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <c:if test="${requestScope.error != null}">
                <p style="color: red">${requestScope.error}</p>
            </c:if>

            <input type="submit" class="btn btn-outline-primary" name="updateQuantity" value="Opdater kurv">
        </form>
        <a class="p-2 text-dark" href="${pageContext.request.contextPath}/fc/insertorder">
            <button class="btn btn-outline-success">Tryk her for at betale</button>
        </a>
        <c:if test="${sessionScope.total != null }">
            Total: ${sessionScope.total}
        </c:if>

    </jsp:body>

</t:genericpage>

