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

        <div>
            <div class="card">
                <div class="card-body">
                    <h6 class="font-weight-bold display-2">Velkommen ombord</h6>
                    <p class="lead font-weight-bold">Øens bedste cupcakes. Vælg og bestil her:</p>
                    <form id="form1" method="post" action="${pageContext.request.contextPath}/fc/????">
                        <div class="row">
                            <div class="col-sm-3">
                                <select class="form-select" name="bottom" id="bottom" aria-label="Default select example">
                                    <option selected>Vælg bund:</option>
                                    <option value="chokolade">chokolade TEST</option>
                                    <c:forEach var="bottom" items="${applicationScope.bottomList}">
                                        <option value="${bottom.id}">${bottom.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-3">
                                <select class="form-select" name="topping" id="topping" aria-label="Default select example">
                                    <option selected>Vælg topping:</option>
                                    <option value="chokolade">chokolade TEST</option>
                                    <c:forEach var="topping" items="${applicationScope.toppingList}">
                                        <option value="${topping.id}">${topping.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-3">
                                <select class="form-select" name="quantity" id="quantity" aria-label="Default select example">
                                    <option selected>Vælg antal:</option>
                                    <c:forEach begin="1" end="10" varStatus="quantity">
                                        <option value="${quantity.index}">${quantity.index}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <button id="submit" type="submit" class="btn btn-primary btn-sm float-md-right">Læg i kurv</button>
                    </form>
                </div>
            </div>
        </div>

    </jsp:body>
</t:genericpage>