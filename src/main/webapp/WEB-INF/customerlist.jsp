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
            <form action="${pageContext.request.contextPath}/fc/clistfunctions">
            <table class="table table-striped table-dark table-hover ">
                <thead>
                <tr>
                    <th scope="col">user ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Balance</th>
                    <th></th>
                </tr>
                </thead>
                <c:forEach var="clist" items="${sessionScope.customerList}" varStatus="status">
                    <tr>
                        <td>${clist.id}</td>
                        <td>${clist.email}</td>
                        <td colspan="1">
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <input class="text" type="number" min="0" value="${clist.balance}" name="balance">
                                <button class="btn btn-success" type="submit" name="edit" value="${status.index}">save changes</button>
                            </div>

                        <td colspan="3">
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <button class="btn btn-danger" type="submit" name="delete" value="${clist.id}">delete user </button>
                                <button class="btn btn-info" type="submit" name="olist" value="${clist.id}">see orders</button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>

    </jsp:body>
</t:genericpage>
