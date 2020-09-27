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
                <h1 class="h3 mb-2 text-gray-800">Lista Administratorów</h1>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Nazwa użytkownika</th>
                                    <th>Email</th>
                                    <th>Aktywny</th>
                                    <th>Akcje</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${allAdmins}" var="admin">
                                    <tr>
                                        <td>${admin.username}</td>
                                        <td>${admin.email}</td>
                                        <td>${admin.active}</td>
                                        <td>
                                            <form:form modelAttribute="allAdmins" method="post" action="../admin/deactivate/${admin.id}">
                                                <button><a
                                                        href="/app/admin/edit/${admin.id}">Edytuj</a>
                                                </button>
                                                <button type="submit">Dezaktywuj</button>
                                                <button><a
                                                        href="/app/admin/delete/${admin.id}">Usuń</a>
                                                </button>
                                            </form:form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <form:form modelAttribute="allUsers" method="post">
                                            <select name="userId">
                                                <c:forEach items="${allUsers}" var="user">
                                                    <option id="userId" name="userId" value="${user.username}">${user.username}</option>
                                                </c:forEach>
                                            </select>
                                    </td>
                                    <td>
                                        <form:button><a href="<c:url value="/app/admin/create"/>">Dodaj Administratora</a></form:button>
                                        </form:form>

                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <button><a href="<c:url value="/app/admin/add"/>">Stwórz Administratora</a>
                                        </button>
                                    </td>
                                </tr>
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