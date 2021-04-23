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
        <c:if test="${requestScope.error != null }">
            <p style="color:red">
                    ${requestScope.error}
            </p>
        </c:if>
        <table class="table table-striped table-dark table-hover ">
            <thead>
            <tr>
                <th scope="col">user ID</th>
                <th scope="col">Role</th>
                <th scope="col">Name</th>
                <th scope="col">Balance</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="clist" items="${sessionScope.customerList}" varStatus="status">
                <tr>
                    <td>${clist.id}</td>
                    <td>${clist.role}</td>
                    <td>${clist.email}</td>
                    <td colspan="1">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <c:if test="${not clist.role.equals('employee')}">
                                <form action="${pageContext.request.contextPath}/fc/clistfunctions" method="post">
                                    <input class="text" type="number" min="0" value="${clist.balance}"
                                           name="balance">
                                    <button class="btn btn-success" type="submit" name="edit"
                                            value="${clist.id}">
                                        save changes
                                    </button>
                                </form>
                            </c:if>
                        </div>

                    <td colspan="3">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <c:if test="${sessionScope.user_id != clist.id}">
                                <form action="${pageContext.request.contextPath}/fc/clistfunctions" method="post">
                                    <button class="btn btn-danger" type="submit" name="delete" value="${clist.id}">
                                        delete
                                        user
                                    </button>
                                </form>
                            </c:if>
                            <c:if test="${not clist.role.equals('employee')}">
                                <form action="${pageContext.request.contextPath}/fc/clistfunctions" method="post">
                                    <button class="btn btn-info" type="submit" name="olist" value="${clist.id}">see
                                        orders
                                    </button>
                                </form>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </jsp:body>
</t:genericpage>
