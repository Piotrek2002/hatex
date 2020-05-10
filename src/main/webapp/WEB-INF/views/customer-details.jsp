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

<%@include file="backend-menu.jsp" %>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <div class="m-md-4 p-md-3 width-medium ">
            <div class="dashboard-content border-dashed p-sm-2 p-md-4 m-md-4 mt-sm-4 mb-sm-4">
                <div class="row border-bottom border-3 p-1 m-1">
                    <div class="col noPadding">
                        <h3 class="color-header text-uppercase">${customer.name} ${customer.surname}</h3>
                    </div>
                    <div class="col d-flex justify-content-end mb-2 noPadding">
                        <button onClick="history.back();" class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Poprzednia strona</button>
                    </div>
                </div>

                <div class="schedules-content">
                    <div class="schedules-content-header">
                        <div class="form-group row mb-2">
                            <span class="col-sm-3 col-lg-2 label-size col-form-label">
                                    Numer telefonu
                            </span>
                            <div class="col-sm-9 col-lg-10">
                                <p class="schedules-text">${customer.phoneNumber}</p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size col-form-label">
                                    Email
                                </span>
                            <div class="col-sm-9 col-lg-10">
                                <p class="schedules-text">${customer.email}</p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size col-form-label">
                                    Adres
                            </span>
                            <div class="col-sm-9 col-lg-10">
                                <p class="schedules-text">
                                    ${customer.address}
                                </p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size col-form-label">
                                   Dodatkowe informacje
                            </span>
                            <div class="col-sm-9 col-lg-10">
                                <p class="schedules-text">${customer.description}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row  p-1 m-1">
                    <div class="col noPadding">
                        <h3 class="color-header text-uppercase">Lista zamówień</h3>
                    </div>
                    <div class="col d-flex justify-content-end mb-2 noPadding">
                        <a href="/customer/order/add/${customer.id}" class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Nowe zamówienie</a>
                    </div>
                </div>

                <c:forEach items="${orders}" var="order">
                    <table class="table">
                        <tbody class="text-color-lighter">
                        <tr class="d-flex">
                            <c:if test="${ order.progress==1}">
                                <td class="col-4"><i class="fa fa-check text-success mr-2 pr-2"></i>Zamówienie
                                    zrealizowane
                                </td>
                            </c:if>
                            <c:if test="${ order.progress==0}">
                                <td class="col-4"><i class="fa fa-times text-danger mr-2 pr-2"></i>Zamówienie do
                                    realizacji
                                </td>
                            </c:if>
                            <c:if test="${order.progress==2}">
                                <td class="col-4"></i><i class="fas fa-dollar-sign text-warning mr-2 pr-2"></i>Zamówienie zapłacone</td>
                            </c:if>
                            <td class="col-5">${order.created}</td>
                            <td class="col-3">
                                <a href="/order/details/${order.id}"
                                   class="btn btn-info rounded-0 text-light m-1">Szczegóły</a>
                                <button class="btn btn-danger rounded-0 text-light m-1" data-toggle="modal"
                                        data-target="#myModal${order.id}">Usuń
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
                                    <h4 class="modal-title">Weryfikacja zamówienia</h4>
                                </div>
                                <div class="modal-body">
                                    Czy napewno chcesz oznaczyć zamówienie z dnia ${order.created}
                                </div>
                                <div class="modal-footer">
                                    <a href="/customer/details/${customer.id}" type="button" class="btn btn-default"
                                       data-dismiss="modal">Nie usuwaj
                                    </a>
                                    <a href="/order/delete/${order.id}" type="button"
                                       class="btn btn-primary">Usuń</a>
                                </div>
                            </div> <!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                </c:forEach>
            </div>
        </div>
    </div>
</section>


<%@include file="scripts.jsp" %>
</body>
</html>
