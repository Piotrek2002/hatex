<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pl">


<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Hatex</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Charmonman:400,700|Open+Sans:400,600,700&amp;subset=latin-ext"
          rel="stylesheet">

    <link href='<c:url value="/css/style.css"/>' rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>

<body>

<%@include file="backend-menu.jsp"%>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <div class="m-md-4 p-md-4 width-medium">
            <div class="dashboard-header m-md-4 mt-sm-4 mb-sm-4">
                <div class="dashboard-menu">
                    <div class="menu-item border-dashed">
                        <a href="/order/add">
                            <i class="far fa-plus-square icon-plus-square"></i>
                            <span class="title">Nowe Zamówienie </span>
                        </a>
                    </div>
                    <div class="menu-item border-dashed">
                        <a href="/customer/add">
                            <i class="far fa-plus-square icon-plus-square"></i>
                            <span class="title">Dodaj klienta</span>
                        </a>
                    </div>
                </div>

                <div class="dashboard-alerts">
                    <div class="alert-item alert-info">
                        <i class="fas icon-circle fa-info-circle"></i>
                        <span class="font-weight-bold">Liczba klientów: ${ countCustomer }</span>
                    </div>
                    <div class="alert-item alert-info">
                        <i class="fas icon-circle fa-info-circle"></i>
                        <span class="font-weight-bold">Liczba zamówień do zapłaty: ${ countCompletedOrders }</span>
                    </div>
                    <div class="alert-item alert-info">
                        <i class="far icon-circle fa-calendar-alt"></i>
                        <span class="font-weight-bold">Liczba zamówień do realizacji: ${ countOrdersToComplete }</span>
                    </div>

                </div>
            </div>
            <div class="card text-center p-sm-2 m-md-4 p-md-4 border-dashed">
                <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active dark-text" id="toComplete-tab" data-toggle="tab" href="#toComplete" role="tab" aria-controls="home" aria-selected="true">Do realizacji</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link dark-text" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Do zapłaty</a>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active " id="toComplete" role="tabpanel" aria-labelledby="toComplete-tab">
                                <h2 class="dashboard-content-title">
                                    <span>Zamówienia do zapłaty:</span>
                                </h2>

                                <c:forEach items="${ordersToComplete}" var="order">
                                    <table class="table">
                                        <tbody class="text-color-lighter">
                                        <tr class="d-flex">
                                            <td class="col-4">${order.customer.name} ${order.customer.surname}</td>
                                            <td class="col-5">${order.created}</td>
                                            <td class="col-3">
                                                <a href="/order/details/${order.id}"
                                                   class="btn btn-info rounded-0 text-light m-1">Szczegóły</a>
                                                <button class="btn btn-success rounded-0 text-light m-1" data-toggle="modal"
                                                        data-target="#myModal${order.id}">Zrobione
                                                </button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="modal fade" id="myModal${order.id}" tabindex="-1" role="dialog"
                                         aria-labelledby="myModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" >Weryfikacja zamówienia (${order.customer.surname})</h4>
                                                </div>
                                                <div class="modal-body">
                                                    Czy napewno chcesz oznaczyć to zamówienie jako zrobione
                                                </div>
                                                <div class="modal-footer">
                                                    <a href="#" type="button" class="btn btn-default"
                                                       data-dismiss="modal">wyjdź
                                                    </a>
                                                    <a href="/order/completed/${order.id}" type="button"
                                                       class="btn btn-primary">Oznacz jako zrobione</a>
                                                </div>
                                            </div> <!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
                                </c:forEach>

                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <h2 class="dashboard-content-title">
                                <span>Zamówienia do realizacji:</span>
                            </h2>

                            <c:forEach items="${ordersToPay}" var="order">
                                <table class="table">
                                    <tbody class="text-color-lighter">
                                    <tr class="d-flex">
                                        <td class="col-4">${order.customer.name} ${order.customer.surname}</td>
                                        <td class="col-5">${order.created}</td>
                                        <td class="col-3">
                                            <a href="/order/details/${order.id}"
                                               class="btn btn-info rounded-0 text-light m-1">Szczegóły</a>
                                            <button class="btn btn-success rounded-0 text-light m-1" data-toggle="modal"
                                                    data-target="#myModal${order.id}">Zapłacone
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="modal fade" id="myModal${order.id}" tabindex="-1" role="dialog"
                                     aria-labelledby="myModalLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" >Weryfikacja zamówienia (${order.customer.surname})</h4>
                                            </div>
                                            <div class="modal-body">
                                                Czy napewno chcesz oznaczyć to zamówienie jako zapłacone
                                            </div>
                                            <div class="modal-footer">
                                                <a href="/customer/list" type="button" class="btn btn-default"
                                                   data-dismiss="modal">wyjdź
                                                </a>
                                                <a href="/order/paid/${order.id}" type="button"
                                                   class="btn btn-primary">Oznacz jako zrobione</a>
                                            </div>
                                        </div> <!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->
                            </c:forEach>
                        </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="footer.jsp" %>
<%@include file="scripts.jsp" %>
</body>
</html>