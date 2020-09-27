<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
                <h1 class="h3 mb-2 text-gray-800">Lista Fundacji</h1>
                <p class="mb-4">Poniżej lista potwierdoznych przez nas fundacji, do których można kierować dary</p>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Nazwa fundacji</th>
                                    <th>Opis fundacji</th>
                                    <th>Szczegóły</th>
                                    <sec:authorize access="hasAuthority('ADMIN')">
                                        <th>Akcje</th>
                                    </sec:authorize>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${institution}" var="institution">
                                    <tr>
                                        <td>${institution.name}</td>
                                        <td>${institution.description}</td>
                                        <td><a href="/app/user/institution/details/${institution.id}">
                                            <button>Szczegóły</button>
                                        </a></td>
                                        <sec:authorize access="hasAuthority('ADMIN')">
                                            <td>
                                                <button><a
                                                        href="/app/admin/institution/edit/${institution.id}">Edytuj</a>
                                                </button>
                                                <button><a
                                                        href="/app/admin/institution/delete/${institution.id}">Usuń</a>
                                                </button>
                                            </td>
                                        </sec:authorize>
                                    </tr>
                                </c:forEach>
                                <sec:authorize access="hasAnyAuthority('ADMIN')">
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <button><a href="<c:url value="/app/admin/institution/add"/>">Dodaj
                                                Fundacje</a></button>
                                        </td>
                                    </tr>
                                </sec:authorize>
                                </tbody>
                            </table>
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