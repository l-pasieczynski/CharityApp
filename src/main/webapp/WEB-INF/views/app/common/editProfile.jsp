<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">

<%@ include file="header.jsp" %>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <sec:authorize access="hasAuthority('USER')">
        <%@ include file="../user/userMenu.jsp" %>
    </sec:authorize>
    <sec:authorize access="hasAuthority('ADMIN')">
        <%@ include file="../admin/adminMenu.jsp" %>
    </sec:authorize>


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <%@ include file="profileMenu.jsp" %>


            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Edytuj dane</h1>
                </div>

                <div class="row">

                    <div class="col">
                        <div class="card shadow mb-4">
                            <!-- Card Body -->
                            <div class="card-body">

                                <form:form method="post" modelAttribute="user">
                                    <div class="form-group">
                                        <form:label path="username">Nazwa użytkownika</form:label><br />
                                        <form:input type="text" name="username" path="username"/>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="email">Email adres</form:label><br />
                                        <form:input type="email" name="email" path="email"/>
                                        <form:input path="password" type="hidden"/>
                                        <form:input path="id" type="hidden"/>
                                    </div>


                                    <c:if test="${not empty error}">
                                        <div style="color:red; font-size: 18px; font-weight: bold; margin: 30px 0px;">${error}</div>
                                    </c:if>

                                    <div class="form-group form-group--buttons">
                                        <form:button class="btn" type="submit">Zapisz</form:button>
                                    </div>
                                </form:form>


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

                    <%@ include file="footer.jsp" %>
                </div>
                <!-- End of Content Wrapper -->
            </div>
            <!-- End of Page Wrapper -->

            <%@include file="logout.jsp" %>

            <%@ include file="script.jsp" %>

</body>

</html>