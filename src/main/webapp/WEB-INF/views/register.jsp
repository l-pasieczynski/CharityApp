<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/header.jsp" %>

<section class="login-page">
    <h2>Załóż konto</h2>
    <form:form method="post" modelAttribute="user">
        <div class="form-group">
            <form:input type="text" name="username" placeholder="Username" path="username"/>
        </div>
        <div class="form-group">
            <form:input type="email" name="email" placeholder="Email" path="email"/>
        </div>
        <c:if test="${not empty error}">
            <div style="color:red; font-size: 18px; font-weight: bold; margin: 30px 0px;">${error}</div>
        </c:if>
        <div class="form-group">
            <form:input id="password" type="password" name="password" placeholder="Hasło" path="password"
                        onkeyup='check();'/>
        </div>
        <div class="form-group">
            <form:input id="retypePassword" type="password" name="password2" placeholder="Powtórz hasło"
                        path="retypePassword" onkeyup='check();'/>
            <span id='message'></span>
        </div>
        <c:if test="${not empty errorPass}">
            <div style="color:red; font-size: 18px; font-weight: bold; margin: 30px 0px;">${errorPass}</div>
        </c:if>


        <div class="form-group form-group--buttons">
            <a href="/login" class="btn btn--without-border">Zaloguj się</a>
            <form:button class="btn" type="submit">Załóż konto</form:button>
        </div>
    </form:form>
</section>

<%@ include file="common/footer.jsp" %>

<script src="<c:url value="/resources/js/register.js"/>"></script>