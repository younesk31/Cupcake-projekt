<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Om os
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>

        <div>
            <div class="card">
                <div class="card-header">
                    Olsker Cupcakes
                </div>
                <div class="card-body">
                    <h5 class="card-title">Welcome to Olsker Cupcakes</h5>
                    <p class="card-text">your number one source for all things Cupcakes. <br>
                        We're dedicated to providing you with the very best of Cupcakes, with an emphasis on
                        quality, taste and experience. <br>
                        Founded in 2021 by Olsker, Olsker Cupcakes has come a long way from its beginnings in
                        [starting location]. <br>
                        When Olsker first started out, his passion for eco-friendly cupcakes drove him to start
                        their own business. <br>
                        We hope you enjoy our products as much as we enjoy offering them to you. <br>
                        If you have any questions or comments, please don't hesitate to contact us. <br>
                        Sincerely,<br>
                        Olsker Cupcakes</p>
                </div>
            </div>
        </div>
    </jsp:body>
</t:genericpage>