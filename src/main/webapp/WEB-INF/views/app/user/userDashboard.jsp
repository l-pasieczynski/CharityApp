<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>

<!-- Earnings (Monthly) Card Example -->
<div class="col col mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">ODDANYCH
                        WORKÓW
                    </div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">${userBags}</div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Earnings (Monthly) Card Example -->
<div class="col col mb-4">
    <div class="card border-left-success shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                        PRZEKAZANYCH DARÓW
                    </div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">${userDonations}</div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!-- Content Row -->

<div class="row">

    <!-- Area Chart -->
    <div class="col">
        <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Ostatnie przekazane dary</h6>
            </div>
            <!-- Card Body -->
            <div class="card-body">

                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Nazwa fundacji</th>
                            <th>Opis fundacji</th>
                            <th>Kategoria przekazanego daru fundacji</th>
                            <th>Ilość przekzanych worków</th>
                            <th>Status</th>
                            <th>Data przekazania</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${userLastDonation.institution.name}</td>
                            <td>${userLastDonation.institution.description}</td>
                            <td>
                                <c:forEach items="${userLastDonation.category}" var="category">
                                    ${category.name}<br />
                                </c:forEach>
                            </td>
                            <td>${userLastDonation.quantity}</td>
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
                            <td>${userLastDonation.pickUpDate}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>
