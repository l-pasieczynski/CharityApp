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
                    <h1 class="h3 mb-0 text-gray-800">Dar dokonany przez ${donation.user.username}, ${donation.created}</h1>
                </div>

                <div class="row">

                    <table class="table borderless">
                        <tbody>
                        <tr class="d-flex">
                            <th scope="row" class="col-2">Użytkownik</th>
                            <td class="col-7">
                                <c:choose>
                                    <c:when test="${donation.user == null}">
                                        Użytkownik niezarejestrowany
                                    </c:when>
                                    <c:otherwise>
                                        id: ${donation.user.id}<br />
                                        nazwa: ${donation.user.username}<br />
                                        email: ${donation.user.email}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <th scope="row" class="col-2">Nazwa Fundacji</th>
                            <td class="col-7">
                                ${donation.institution.name}
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <th scope="row" class="col-2">Kategorie darów</th>
                            <td class="col-7">
                                <c:forEach items="${donation.category}" var="category">
                                    ${category.name}<br />
                                </c:forEach>
                            </td>

                        </tr>
                        <tr class="d-flex">
                            <th scope="row" class="col-2">Ilość przekazanych worków</th>
                            <td class="col-7">
                                ${donation.quantity}
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <th scope="row" class="col-2">Data utworzenia</th>
                            <td class="col-7">
                                ${donation.created}
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <th scope="row" class="col-2">Data i godzina odbioru darów</th>
                            <td class="col-7">
                                ${donation.pickUpDate}<br />
                                ${donation.pickUpTime}<br />
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <th scope="row" class="col-2">Adres odbioru</th>
                            <td class="col-7">
                                ${donation.street}<br />
                                ${donation.city}<br />
                                ${donation.zipCode}<br />
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <th scope="row" class="col-2">Kontakt</th>
                            <td class="col-7">
                                ${donation.phoneNumber}
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <th scope="row" class="col-2">Status</th>
                            <td class="col-7">
                                <c:choose>
                                    <c:when test="${donation.status == true}">
                                        Odebrano<br />
                                        ${donation.statusChangedDate}
                                    </c:when>
                                    <c:otherwise>
                                        Oczekuje na odbiór
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        </tbody>
                    </table>

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