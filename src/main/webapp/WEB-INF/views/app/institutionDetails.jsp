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
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Fundacja ${institution.name}</h1>
                </div>

                <div class="row">

                    <!-- Area Chart -->
                    <div class="col">
                        <div class="card shadow mb-4">

                            <table class="table borderless">
                                <tbody>
                                <tr class="d-flex">
                                    <th scope="row" class="col-2">Nazwa Fundacji</th>
                                    <td class="col-7">
                                        ${institution.name}
                                    </td>
                                </tr>
                                <tr class="d-flex">
                                    <th scope="row" class="col-2">Opis fundacji</th>
                                    <td class="col-7">${institution.description}</td>
                                </tr>
                                <tr class="d-flex">
                                    <th scope="row" class="col-2">Adres fundacji</th>
                                    <td class="col-7">
                                        Adres
                                    </td>
                                </tr>
                                <tr class="d-flex">
                                    <th scope="row" class="col-2">KRS Fundacji</th>
                                    <td class="col-7">
                                        KRS
                                    </td>
                                </tr>
                                </tbody>
                            </table>

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