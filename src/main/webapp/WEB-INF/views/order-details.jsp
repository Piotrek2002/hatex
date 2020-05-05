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
                        <h3 class="color-header text-uppercase">${order.customer.name} ${order.customer.surname}</h3>
                    </div>
                    <c:if test="${order.progress==0}">
                        <div class="col d-flex justify-content-end mb-2 noPadding">
                            <button class="btn btn-success rounded-0 text-light m-1"><a
                                    href="/mosquitoNet/add/${order.id}" class="text-light">Dodaj nowy produkt</a>
                            </button>
                        </div>
                        <div class="col d-flex justify-content-end mb-2 noPadding">
                            <button class="btn btn-success rounded-0 text-light m-1" data-toggle="modal"
                                    data-target="#myModal${order.id}">Oznacz jako zrobione
                            </button>
                        </div>
                    </c:if>

                    <div class="col d-flex justify-content-end mb-2 noPadding">
                        <button onClick="history.back();"
                                class="btn btn-success rounded-0 text-light m-1">Poprzednia strona
                        </button>
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
                                    <a href="/customer/list" type="button" class="btn btn-default"
                                       data-dismiss="modal">wyjdź
                                    </a>
                                    <a href="/order/completed/${order.id}" type="button"
                                       class="btn btn-primary">Oznacz jako zrobione</a>
                                </div>
                            </div> <!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>
                <c:forEach items="${mosquitoNets}" var="mosquitoNet">
                    <div class="schedules-content border-bottom">
                        <div class="schedules-content-header">
                            <div class="form-group row mb-2">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                    Ilość
                            </span>
                                <div class="col-sm-9 col-lg-10">
                                    <p class="schedules-text">${mosquitoNet.count}</p>
                                </div>
                            </div>
                            <div class="form-group row mb-2">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                    Kolor
                            </span>
                                <div class="col-sm-9 col-lg-10">
                                    <p class="schedules-text">${mosquitoNet.color}</p>
                                </div>
                            </div>
                            <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                    Wysokość
                                </span>
                                <div class="col-sm-9 col-lg-10">
                                    <p class="schedules-text">${mosquitoNet.height}</p>
                                </div>
                            </div>
                            <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                    Szerokoć
                            </span>
                                <div class="col-sm-9 col-lg-10">
                                    <p class="schedules-text">
                                            ${mosquitoNet.length}
                                    </p>
                                </div>
                            </div>
                            <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                   Grubość
                            </span>
                                <div class="col-sm-9 col-lg-10">
                                    <p class="schedules-text">${mosquitoNet.size}</p>
                                </div>
                            </div>
                            <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                   Cena
                            </span>
                                <div class="col-sm-9 col-lg-10">
                                    <p class="schedules-text">${mosquitoNet.price} zł</p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <button class="btn btn-danger rounded-0 text-light ml-3" data-toggle="modal"
                                        data-target="#myModal${mosquitoNet.id}">Usuń
                                </button>
                                <div class="modal fade" id="myModal${mosquitoNet.id}" tabindex="-1" role="dialog"
                                     aria-labelledby="myModalLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">

                                                <h4 class="modal-title">Weryfikacja</h4>
                                            </div>
                                            <div class="modal-body">
                                                Czy napewno chcesz usunąć ten produkt?
                                            </div>
                                            <div class="modal-footer">
                                                <a href="/order/details/${order.id}" type="button" class="btn btn-default"
                                                   data-dismiss="modal">nie usuwaj
                                                </a>
                                                <a href="/mosquitoNet/delete/${mosquitoNet.id}/${order.id}" type="button"
                                                   class="btn btn-primary">Usuń</a>
                                            </div>
                                        </div> <!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->
                            </div>


                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>


<%@include file="scripts.jsp" %>
</body>
</html>
