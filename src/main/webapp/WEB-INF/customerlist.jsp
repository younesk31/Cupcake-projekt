<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         List of all customers
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>

        <div>
            <table class="table table-striped table-dark table-hover ">
                <thead>
                <tr>
                    <th scope="col">user ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Balance</th>
<%--                    <th scope="col">Number of Orders</th>--%>
<%--                    <th scope="col">Generated Revenue</th>--%>
                </tr>
                </thead>
                <c:forEach var="clist" items="${sessionScope.customerList}">
                    <tr>
                        <td>${clist.id}</td>
                        <td>${clist.email}</td>
                        <td>${clist.balance}</td>
<%--                         <td>${clist.customer.orders}</td> --%>
<%--                         <td>${clist.customer.revenue}</td>--%>
                    <br></tr>
                </c:forEach>
            </table>

        </div>


            <c:if test="${requestScope.error != null }">
                <p style="color:red">
                        ${requestScope.error}
                </p>
            </c:if>
        </div>
    </jsp:body>
</t:genericpage>
