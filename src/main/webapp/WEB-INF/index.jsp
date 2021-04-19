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
                    <form id="form" method="post" action="${pageContext.request.contextPath}/fc/updateBasket">
                        <div class="row">
                            <div class="col-sm-3">
                                <select class="form-select" name="bottom" id="bottom" aria-label="Default select example">
                                    <option selected>Vælg bund:</option>
                                    <c:forEach var="bottom" items="${applicationScope.bottomList}">
                                        <option value="${bottom.bottomId}">${bottom.name} - ${bottom.price},- </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-3">
                                <select class="form-select" name="topping" id="topping" aria-label="Default select example">
                                    <option selected>Vælg topping:</option>
                                    <c:forEach var="topping" items="${applicationScope.topList}">
                                        <option value="${topping.topId}">${topping.name} - ${topping.price},-</option>
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
                        <button id="submit" type="submit" class="btn btn-primary btn-sm">Læg i kurv</button>
                    </form>
                </div>
            </div>
        </div>

    </jsp:body>
</t:genericpage>