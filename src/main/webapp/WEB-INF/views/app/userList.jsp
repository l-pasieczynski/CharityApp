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
                <h1 class="h3 mb-2 text-gray-800">Lista Użytkowników</h1>
                <p class="mb-4">Lista wszystkich zarejestrowanych użytkowników</p>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Nazwa użytkownika</th>
                                    <th>ID użytkownika</th>
                                    <th>Email</th>
                                    <th>Aktywny</th>
                                    <th>Rola</th>
                                    <th>Akcje</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>Nazwa użytkownika</th>
                                    <th>ID użytkownika</th>
                                    <th>Email</th>
                                    <th>Aktywny</th>
                                    <th>Rola</th>
                                    <th>Akcje</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${allUsers}" var="user">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.username}</td>
                                        <td>${user.email}</td>
                                        <td>${user.active}</td>
                                        <td>
                                            <c:forEach items="${user.roles}" var="role">
                                                ${role.name}<br />
                                            </c:forEach>
                                        </td>
                                            <td>
                                                <form:form  method="post" modelAttribute="allUsers" action="../user/deactivate/${user.id}">
                                                    <button><a
                                                            href="/app/admin/user/edit/${user.id}">Edytuj</a>
                                                    </button>
                                                    <button type="submit">Dezaktywuj</button>
                                                    <button><a
                                                            href="/app/admin/user/delete/${user.id}">Usuń</a>
                                                    </button>
                                                </form:form>
                                            </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <c:if test="${not empty error}"><div style="color:red; font-size: 18px; font-weight: bold; margin: 30px 0px;">${error}</div></c:if>

                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="common/footer.jsp" %>
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->


    <%@include file="common/logout.jsp" %>


    <%@ include file="common/script.jsp" %>

</body>

</html>