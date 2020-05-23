<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 17.05.2020
  Time: 00:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">


    <!-- Bootstrap core CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
</head>
<body>

<%@include file="backend-menu.jsp" %>
<section>
    <div class="container-fluid">
        <div class="row">
            <main role="main" class="col-12 ml-sm-auto px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">${order.customer.name} ${order.customer.surname}</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group mr-2">
                            <ul class="nav nav-pills" role="tablist">
                                <c:if test="${order.progress==0}">
                                    <li class="pl-5">
                                        <button class="btn form-control btn-outline-secondary" data-toggle="modal"
                                                data-target="#realizationModal${order.id}">Wyślij do realizacji
                                        </button>
                                    </li>
                                </c:if>
                                <c:if test="${order.progress==1}">
                                    <li class="pl-5">
                                        <button class="btn form-control btn-outline-secondary" data-toggle="modal"
                                                data-target="#myModal${order.id}">Oznacz jako zrobione
                                        </button>
                                    </li>
                                </c:if>
                                <c:if test="${order.progress==2}">
                                    <li class="pl-5">
                                        <button class="btn form-control btn-outline-secondary" data-toggle="modal"
                                                data-target="#Modal${order.id}">Oznacz jako zapłacone
                                        </button></li>

                                </c:if>
                                <c:if test="${order.progress<3 && order.payment<order.price}">

                                <li class="pl-5"><button class="btn form-control btn-outline-secondary" data-toggle="modal"
                                                data-target="#PayModal${order.id}">Dokonaj wpłaty
                                        </button></li>

                                </c:if>
                                <c:if test="${order.progress==0}">
                                    <li class="pl-5">
                                        <button class="btn form-control btn-outline-secondary" data-toggle="modal"
                                                data-target="#deleteModal${order.id}">Usuń zamówienie
                                        </button>
                                    </li>
                                </c:if>

                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Potwierdzenie -->
                <div class="modal fade" id="myModal${order.id}" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Weryfikacja zamówienia (${order.customer.surname})</h4>
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
                <!-- Potwierdzenie płatności-->
                <div class="modal fade" id="Modal${order.id}" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Weryfikacja zamówienia (${order.customer.surname})</h4>
                            </div>
                            <div class="modal-body">
                                Czy napewno chcesz oznaczyć to zamówienie jako zapłacone
                            </div>
                            <div class="modal-footer">
                                <a href="#" type="button" class="btn btn-default"
                                   data-dismiss="modal">wyjdź
                                </a>
                                <a href="/order/paid/${order.id}" type="button"
                                   class="btn btn-primary">Oznacz jako zapłacone</a>
                            </div>
                        </div> <!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                <!-- Wpłata-->
                <div class="modal fade" id="PayModal${order.id}" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Wpłata do zamówienia (${order.customer.surname})</h4>
                            </div>
                            <form method="get" action="/order/payment/${order.id}">
                                <div class="modal-body">
                                    Podaj kwotę wpłaty<input type="number" id="payment" name="payment" value="${order.payment}"/>
                                </div>
                                <div class="modal-footer">
                                    <a href="#" type="button" class="btn btn-default"
                                       data-dismiss="modal">wyjdź
                                    </a>
                                    <button type="submit"
                                            class="btn btn-primary">Dokonaj wpłaty
                                    </button>
                                </div>
                            </form>

                        </div> <!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                <!-- Potwierdzenie wyceny-->
                <div class="modal fade" id="realizationModal${order.id}" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Weryfikacja zamówienia (${order.customer.surname})</h4>
                            </div>
                            <div class="modal-body">
                                Czy napewno chcesz oznaczyć to zamówienie jako gotowe do realizacji ?
                            </div>
                            <div class="modal-footer">
                                <a href="#" type="button" class="btn btn-default"
                                   data-dismiss="modal">wyjdź
                                </a>
                                <a href="/order/realization/${order.id}" type="button"
                                   class="btn btn-primary">Prześlij do realizacji</a>
                            </div>
                        </div> <!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                <!--Usuwanie zamówienia-->
                <div class="modal fade" id="deleteModal${order.id}" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Usuwanie zamówienia (${order.customer.surname})</h4>
                            </div>
                            <div class="modal-body">
                                Czy napewno chcesz usunąć to zamówienie?
                            </div>
                            <div class="modal-footer">
                                <a href="#" type="button" class="btn btn-default"
                                   data-dismiss="modal">wyjdź
                                </a>
                                <a href="/order/delete/${order.id}" type="button"
                                   class="btn btn-primary">Usuń zamówienie</a>
                            </div>
                        </div> <!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->

                <div class="schedules-content-header">
                    <div class="form-group row mb-2">
                            <span class="col-sm-3 col-lg-2 label-size col-form-label">
                                    Cena zamówinia
                            </span>
                        <div class="col-sm-9 col-lg-10">
                            <p class="schedules-text">${order.price}</p>
                        </div>
                    </div>
                    <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size col-form-label">
                                    Wpłata
                                </span>
                        <div class="col-sm-9 col-lg-10">
                            <p class="schedules-text">${order.payment}</p>
                        </div>
                    </div>
                    <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size col-form-label">
                                    Do zapłaty
                            </span>
                        <div class="col-sm-9 col-lg-10">
                            <p class="schedules-text">
                                ${toPay}
                            </p>
                        </div>
                    </div>
                    <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size col-form-label">
                                    Wystawiający
                            </span>
                        <div class="col-sm-9 col-lg-10">
                            <p class="schedules-text">
                                ${order.companyBranch.city}
                            </p>
                        </div>
                    </div>

                </div>
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 mb-3 ">
                    <h1 class="h2">Lista produktów</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group mr-2">
                            <ul class="nav nav-pills" role="tablist">
                                <c:if test="${order.progress==0}">
                                    <li class="pr-5"><a type="button" class="btn form-control btn-outline-secondary "
                                                        href="/mosquitoNet/add/${order.id}">Dodaj nowy produkt</a></li>
                                </c:if>
                                <li><input class="form-control" id="myInput" type="text" placeholder="Search" aria-label="Search"></li>
                            </ul>

                        </div>

                    </div>
                </div>
                <div class="tab-content">
                    <div class="tab-pane active" id="all">
                        <div class="table-responsive">
                            <table class="table table-striped table-sm">
                                <thead>
                                <tr>
                                    <th>Nazwa</th>
                                    <th>Ilość</th>
                                    <th>Cena</th>
                                    <th>Dostępność</th>
                                </tr>
                                </thead>
                                <tbody id="myTable">
                                <c:forEach items="${order.mosquitoNets}" var="mosquito">
                                    <tr data-toggle="modal"
                                        data-target="#deleteMosquitoModal${order.id}">
                                        <td>Moskitiera ${mosquito.height}x${mosquito.length} ${mosquito.color}</td>
                                        <td>${mosquito.count}</td>
                                        <td>${mosquito.price}</td>
                                        <c:if test="${order.done==1}">
                                            <td>Dostępna</td>
                                        </c:if>
                                        <c:if test="${order.done==0}">
                                            <td>Nie dostępna</td>
                                        </c:if>
                                    </tr>
                                    <!--Akcje moskitiery-->
                                    <div class="modal fade" id="deleteMosquitoModal${order.id}" tabindex="-1" role="dialog"
                                         aria-labelledby="myModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Akcje</h4>
                                                </div>
                                                <div class="modal-body">
                                                    Usuwanie i edytowanie moskitiery.
                                                </div>
                                                <div class="modal-footer">
                                                    <a href="#" type="button" class="btn btn-default"
                                                       data-dismiss="modal">wyjdź
                                                    </a>
                                                    <a href="/mosquitoNet/update/${mosquito.id}" type="button"
                                                       class="btn btn-primary">Edytuj moskitierę</a>
                                                    <a href="/mosquitoNet/delete/${mosquito.id}" type="button"
                                                       class="btn btn-primary">Usuń moskitierę</a>
                                                </div>
                                            </div> <!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </main>
        </div>
    </div>
</section>
<%@include file="scripts.jsp" %>
<script src="http://localhost:8080/dashboard.js"></script>
</body>

</html>
