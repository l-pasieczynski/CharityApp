<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="pl">

<%@ include file="../common/header.jsp" %>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">


    <sec:authorize access="hasAuthority('USER')">
        <%@ include file="userMenu.jsp" %>
    </sec:authorize>
    <sec:authorize access="hasAuthority('ADMIN')">
        <%@ include file="../admin/adminMenu.jsp" %>
    </sec:authorize>


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <%@ include file="../common/profileMenu.jsp" %>

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Twoja zbiórka darów</h1>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Zbiórka darów <sec:authentication
                                property="principal.username"/></h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Ilość przekazanych worków</th>
                                    <th>Kategoria przekazanych darów</th>
                                    <th>Fundacja</th>
                                    <th>Data przekazania</th>
                                    <th>Status</th>
                                    <th>Akcje</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>Ilość przekazanych worków</th>
                                    <th>Kategoria przekazanych darów</th>
                                    <th>Fundacja</th>
                                    <th>Data przekazania</th>
                                    <th>Status</th>
                                    <th>Akcje</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${donation}" var="donation">
                                    <tr>
                                        <td>${donation.quantity}</td>
                                        <td>
                                            <c:forEach items="${donation.category}" var="category">
                                                ${category.name}<br/>
                                            </c:forEach>
                                        </td>
                                        <td>
                                                ${donation.institution.name}
                                        </td>
                                        <td>${donation.pickUpDate}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${donation.status == true}">
                                                    Odebrano
                                                </c:when>
                                                <c:otherwise>
                                                    Oczekuje na odbiór
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><a href="/app/user/donation/details/${donation.id}">
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
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <%@ include file="../common/footer.jsp" %>

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->


<%@include file="../common/logout.jsp" %>

<%@ include file="../common/script.jsp" %>

</body>

</html>