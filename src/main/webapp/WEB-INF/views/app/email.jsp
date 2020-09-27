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
                    <h1 class="h3 mb-0 text-gray-800">Wyślij wiadomość do użytkownika</h1>
                </div>

                <div class="row">

                    <div class="col">
                        <div class="card shadow mb-4">
                            <!-- Card Body -->
                            <div class="card-body">

                                <form:form modelAttribute="email" id="contact-form" method="post">
                                    <div>
                                        <form:label path="userEmailAddress">Email użytkownika</form:label><br/>
                                        <form:input path="userEmailAddress" type="email" placeholder="Email adres"/><br>
                                    </div>
                                    <div>
                                        <form:label path="subject">Temat wiadomośći</form:label><br/>
                                        <form:input path="subject" type="text" placeholder="Temat"/><br>
                                    </div>
                                    <div>
                                        <form:label path="message">Treść wiadomości</form:label><br/>
                                        <form:textarea path="message" placeholder="Wiadomość" rows="5"/><br>
                                    </div>

                                    <button type="submit">SEND MESSAGE</button>
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

                    <%@ include file="common/footer.jsp" %>
                </div>
                <!-- End of Content Wrapper -->
            </div>
            <!-- End of Page Wrapper -->

            <%@include file="common/logout.jsp" %>

            <%@ include file="common/script.jsp" %>

</body>

</html>