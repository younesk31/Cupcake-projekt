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
        <table class="table table-striped table-dark table-hover ">
            <thead>
            <tr>
                <th scope="col">Bund</th>
                <th scope="col">Topping</th>
                <th scope="col">Antal</th>
                <th scope="col">Pris</th>
            </tr>
            </thead>
            <c:forEach var="cart" items="${sessionScope.cupcakeList}">
                <tr>
                    <td>${cart.bottom.name}</td>
                    <td>${cart.top.name}</td>
                    <td>${cart.quantity}</td>
                    <td>${cart.price}</td>
                </tr>
            </c:forEach>
        </table>

        <a class="p-2 text-dark" href="${pageContext.request.contextPath}/fc/insertorder"> <button class="btn btn-outline-success">Tryk for at tilføje</button></a>


    </jsp:body>

</t:genericpage>

