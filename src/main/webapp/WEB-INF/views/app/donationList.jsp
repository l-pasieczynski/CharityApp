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
                <h1 class="h3 mb-2 text-gray-800">Lista darów</h1>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Użytkownik</th>
                                    <th>Fundacja</th>
                                    <th>Kategoria darów</th>
                                    <th>Ilość przekazanych darów</th>
                                    <th>Data przekzania darów</th>
                                    <th>Szczegóły</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${donation}" var="donation">
                                    <tr>
                                        <td>${donation.user.username}</td>
                                        <td>${donation.institution.name}</td>
                                        <td>
                                            <c:forEach items="${donation.category}" var="category">
                                                ${category.name}<br />
                                            </c:forEach>
                                        </td>
                                        <td>${donation.quantity}</td>
                                        <td>${donation.pickUpDate}</td>
                                        <td><a href="/app/admin/donation/details/${donation.id}">
                                            <button>Szczegóły</button>
                                        </a></td>
                                    </tr>
                                </c:forEach>
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