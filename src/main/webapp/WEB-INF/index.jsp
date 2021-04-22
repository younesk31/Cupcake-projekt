<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Home
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>

        <h6 class="font-weight-bold display-2">Velkommen ombord</h6>
        <div class="row">
            <div class="col-6">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="col">
                            <h3>Udvalg af bunde</h3>
                            <c:forEach var="bunde" items="${applicationScope.bottomList}">
                                ${bunde.bottomId} - ${bunde.name} - ${bunde.price},-<br>
                            </c:forEach>
                            <h3>Udvalg af toppings</h3>
                            <c:forEach var="topping" items="${applicationScope.topList}">
                                ${topping.topId} - ${topping.name} - ${topping.price},-<br>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card mb-4">
                    <div class="card-body">
                        <form name="login" action="${pageContext.request.contextPath}/fc/logincommand" method="POST">
                            <label class="col-form-label" for="email">Email</label>
                            <input class="form-control" id="email" type="text" name="email" placeholder="someone@nowhere.com">
                            <label class="col-form-label" for="password">Password</label>
                            <input class="form-control" id="password" type="password" name="password" placeholder="password"><br>
                            <c:if test="${not empty param.msg}"><p style="font-size: large">${param.msg}</p></c:if>
                            <button class="btn btn-primary" type="submit" value="Login">Log ind</button>
                            <c:if test="${requestScope.error != null }"><p style="color:red">${requestScope.error}</p></c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>
</t:genericpage>