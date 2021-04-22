<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        <jsp:invoke fragment="header"/>
    </title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
    <meta name="theme-color" content="#7952b3">
</head>
<body>

<%--<a href="<%=request.getContextPath()%>"><img src="${pageContext.request.contextPath}/images/logo.png" class="img-fluid floating center-blok mb-4" style="vertical-align: middle;width: 100% \9;" alt="Responsive image"></a>--%>


<!-- nav bar -->
<div class="page-header">

    <div class="card-body mb-0">
        <a href="<%=request.getContextPath()%>"><img class="card-img-top" src="${pageContext.request.contextPath}/images/logo.png" alt="Card image cap"></a>
    </div>
</div>

<div class="card-body " style="margin-top: -2em">
    <header class="d-flex flex-column flex-md-row align-items-center px-md-4 mb-3 bg-white border-bottom shadow-sm">

        <!-- Logo image -->
        <div class="h4 me-md-auto fw-normal">
            <a class="navbar-brand mb-0 h1 text-dark" href="<%=request.getContextPath()%>">Hjem</a>

            <c:if test="${sessionScope.role == 'employee' }">
            <a class="navbar-brand mb-0 h1 text-dark" href="${pageContext.request.contextPath}/fc/employeepage">Admin side</a>
            </c:if>

            <c:if test="${sessionScope.role == 'customer' }">
            <a class="navbar-brand mb-0 h1 text-dark" href="${pageContext.request.contextPath}/fc/orderpage">Bestil</a>
            <a class="navbar-brand mb-0 h1 text-dark" href="${pageContext.request.contextPath}/fc/customerpage">Min side</a>
            </c:if>


            <a class="navbar-brand mb-0 h1 text-dark" href="${pageContext.request.contextPath}/fc/aboutus">Om os</a>
            <c:if test="${sessionScope.role == 'customer' }">
                <a class="navbar-brand mb-0 h1 text-dark" href="${pageContext.request.contextPath}/fc/showmyorders">Mine ordre</a>
                </c:if>
        </div>

        <nav class="my-2 me-md-6">

            <c:if test="${sessionScope.user != null }">
                ${sessionScope.user.email}
            </c:if>

            <c:set var="thisPage" value="${pageContext.request.servletPath}"/>
            <c:set var="isNotLoginPage" value="${!fn:endsWith(thisPage,'loginpage.jsp')}"/>
            <c:set var="isNotRegisterPage" value="${!fn:endsWith(thisPage,'registerpage.jsp')}"/>

            <c:if test="${isNotLoginPage && isNotRegisterPage}">
                <c:if test="${sessionScope.user != null }">
                    <a type="button" class="btn btn-sm  btn btn-outline-danger" href="${pageContext.request.contextPath}/fc/logoutcommand">Log ud</a>
                </c:if>
                <c:if test="${sessionScope.user == null }">
                    <a type="button" class="btn btn-sm  btn btn-outline-dark" href="${pageContext.request.contextPath}/fc/loginpage">Log ind</a>
                    <a type="button" class="btn btn-sm  btn btn-outline-success" href="${pageContext.request.contextPath}/fc/registerpage">Register</a>
                </c:if>
            </c:if>
            <c:if test="${sessionScope.role == 'customer' }">
                <a class="p-2 text-dark" href="${pageContext.request.contextPath}/fc/showcart"><img src="https://icons.getbootstrap.com/assets/icons/basket.svg" width="30" height="30" class="d-inline-block align-top" alt=""></a>
                <c:if test="${sessionScope.balance != null }">
                    Saldo: ${sessionScope.balance}
                </c:if>
            </c:if>

        </nav>
    </header>
</div>


<div class="card-body bg-white" style="margin-top: -2em">
<jsp:doBody/>
</div>

<!-- Footer -->
<div class="card-body">

    <hr >
    Copyright &copy Olsker Cupcakes - 2021
    <br/>
    <jsp:invoke fragment="footer"/>
</div>

</body>
</html>