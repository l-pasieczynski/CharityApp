<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/header.jsp" %>


<section class="login-page">
    <h2>Zaloguj się</h2>

    <c:if test="${not empty errorMessage}"><div style="color:red; font-size: 18px; font-weight: bold; margin: 30px 0px;">${errorMessage}</div></c:if>

    <form name="login" action="/login" method="post">
        <div class="form-group">
            <input type="text" name="username" placeholder="Username"/>
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Hasło"/>
            <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>

        <div class="form-group form-group--buttons">
            <a href="/register" class="btn btn--without-border">Załóż konto</a>
            <button class="btn" type="submit">Zaloguj się</button>

        </div>
    </form>
</section>

<%@ include file="common/footer.jsp" %>