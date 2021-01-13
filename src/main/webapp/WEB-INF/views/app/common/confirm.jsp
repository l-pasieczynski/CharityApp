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
                    <h1 class="h3 mb-0 text-gray-800">POTWIERDŹ</h1>
                </div>

                <form:form method="POST" modelAttribute="delete">
                    <div class="row border-bottom border-3">
                        <div class="col"><h3 class="color-header text-uppercase">Czy na pewno chcesz usunąć?</h3></div>
                    </div>

                    <table class="table borderless">
                        <tbody>
                        <tr class="d-flex">
                            <td>
                                <div class="col d-flex justify-content-end mb-2">
                                    <input value="OK" type="submit" name="decision" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4"></div>
                            </td>
                            <td>
                                <div class="col d-flex justify-content-end mb-2">
                                    <input value="Anuluj" type="submit" name="decision" id="decision" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4"></div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form:form>

                <c:if test="${not empty error}"><div style="color:red; font-size: 18px; font-weight: bold; margin: 30px 0px;">${error}</div></c:if>

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