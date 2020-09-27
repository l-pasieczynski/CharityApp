<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">

<%@ include file="common/header.jsp" %>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <sec:authorize access="hasAuthority('USER')">
        <%@ include file="user/userMenu.jsp" %>
    </sec:authorize>
    <sec:authorize access="hasAuthority('ADMIN')">
        <%@ include file="admin/adminMenu.jsp" %>
    </sec:authorize>


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <%@ include file="common/profileMenu.jsp" %>


            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Dodaj Administratora</h1>
                </div>

                <div class="row">

                    <!-- Area Chart -->
                    <div class="col">
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive">

                                    <form:form method="post" modelAttribute="admin">
                                        <div class="form-group">
                                            <form:input type="text" name="username" placeholder="Username"
                                                        path="username"/>
                                        </div>
                                        <div class="form-group">
                                            <form:input type="email" name="email" placeholder="Email" path="email"/>
                                        </div>
                                        <c:if test="${not empty error}">
                                            <div style="color:red; font-size: 18px; font-weight: bold; margin: 30px 0px;">${error}</div>
                                        </c:if>
                                        <div class="form-group">
                                            <form:input id="password" type="password" name="password"
                                                        placeholder="Hasło"
                                                        path="password"
                                                        onkeyup='check();'/>
                                        </div>
                                        <div class="form-group">
                                            <form:input id="retypePassword" type="password" name="password2"
                                                        placeholder="Powtórz hasło"
                                                        path="retypePassword" onkeyup='check();'/>
                                            <span id='message'></span>
                                        </div>
                                        <c:if test="${not empty errorPass}">
                                            <div style="color:red; font-size: 18px; font-weight: bold; margin: 30px 0px;">${errorPass}</div>
                                        </c:if>


                                        <div class="form-group form-group--buttons">
                                            <form:button class="btn" type="submit">Stwórz Administratora</form:button>
                                        </div>
                                    </form:form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Content Row -->
                <div class="row">

                    <!-- Content Column -->
                    <div class="col-lg-6 mb-4">


                    </div>
                    <!-- End of Main Content -->

                    <%@ include file="common/footer.jsp" %>
                </div>
                <!-- End of Content Wrapper -->
            </div>
            <!-- End of Page Wrapper -->

            <%@include file="common/logout.jsp" %>

            <%@ include file="common/script.jsp" %>

</body>

</html>