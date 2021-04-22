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

        <form action="${pageContext.request.contextPath}/fc/clistfunctions">
            <table class="table table-striped table-dark table-hover ">
                <thead>
                <tr>
                    <th scope="col">user ID</th>
                    <th scope="col">Role</th>
                    <th scope="col">Name</th>
                    <th scope="col">Balance</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                        <%--                    <th scope="col">Number of Orders</th>--%>
                        <%--                    <th scope="col">Generated Revenue</th>--%>
                    <br>
                </tr>
                </thead>
                <c:forEach var="clist" items="${sessionScope.customerList}" varStatus="status">
                    <tr>
                        <td>${clist.id}</td>
                        <td>${clist.role}</td>
                        <td>${clist.email}</td>
                        <td>
                            <c:if test="${not clist.role.equals('employee')}">
                                <input class="text" type="number" min="0" value="${clist.balance}" name="balance">
                                <button class="btn btn-success editbtn" type="submit" name="edit" value="${status.index}">
                                    save changes
                                </button>
                            </c:if>
                        </td>
                        <td>
                            <button class="btn btn-danger editbtn" type="submit" name="delete" value="${clist.id}">
                                delete user
                            </button>
                        </td>
                        <td>
                            <c:if test="${not clist.role.equals('employee')}">
                                <button class="btn btn-outline-info editbtn" type="submit" name="olist" value="${clist.id}">
                                    see orders
                                </button>
                            </c:if>
                        </td>
                            <%--                         <td>${clist.customer.orders}</td> --%>
                            <%--                         <td>${clist.customer.revenue}</td>--%>

                        <br>
                    </tr>
                </c:forEach>
            </table>
        </form>


        <c:if test="${requestScope.error != null }">
            <p style="color:red">
                    ${requestScope.error}
            </p>
        </c:if>
        </div>
    </jsp:body>
</t:genericpage>
