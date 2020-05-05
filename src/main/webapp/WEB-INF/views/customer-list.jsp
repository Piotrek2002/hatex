<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 28.04.2020
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
</body>
</html>
<!DOCTYPE html>
<html lang="en">

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
        <div class="m-md-4 p-md-4 width-medium">
            <div class="dashboard-content border-dashed p-3 m-4 view-height">
                <div class="row border-bottom border-3 p-1 m-1">
                    <div class="col noPadding"><h3 class="color-header text-uppercase">Lista klientów</h3></div>
                    <div class="col noPadding d-flex justify-content-end mb-2"><a href="/customer/add"
                                                                                  class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Dodaj
                        klienta</a></div>
                </div>
                <table class="table border-bottom schedules-content">
                    <thead>
                    <tr class="d-flex text-color-darker">
                        <th scope="col" class="col-3">IMIE</th>
                        <th scope="col" class="col-3">NAZWISKO</th>
                        <th scope="col" class="col-3">NUMER TELEFONU</th>
                        <th scope="col" class="col-3 center">AKCJE</th>
                    </tr>
                    </thead>
                    <c:forEach var="customer" items="${customers}">
                        <tbody class="text-color-lighter">
                        <tr class="d-flex">
                            <th scope="row" class="col-3">${customer.name}</th>
                            <td class="col-3">
                                    ${customer.surname}
                            </td>

                            <td class="col-3">${customer.phoneNumber}</td>
                            <td class="col-3 d-flex align-items-center justify-content-center flex-wrap">
                                <button class="btn btn-danger rounded-0 text-light m-1" data-toggle="modal"
                                        data-target="#myModal${customer.id}">Usuń
                                </button>
                                <a href="/customer/details/${customer.id}" class="btn btn-info rounded-0 text-light m-1">Szczegóły</a>
                                <a href="/app-edit-recipe.html"
                                   class="btn btn-warning rounded-0 text-light m-1">Edytuj</a>
                            </td>
                        </tr>

                        <div class="modal fade" id="myModal${customer.id}" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">

                                        <h4 class="modal-title">Weryfikacja</h4>
                                    </div>
                                    <div class="modal-body">
                                        Czy napewno chcesz usunąć klienta o imieniu ${customer.name}.
                                    </div>
                                    <div class="modal-footer">
                                        <a href="/customer/list" type="button" class="btn btn-default"
                                           data-dismiss="modal">nie usuwaj
                                        </a>
                                        <a href="/customer/delete/${customer.id}" type="button"
                                           class="btn btn-primary">Usuń</a>
                                    </div>
                                </div> <!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</section>


<%@include file="scripts.jsp" %>
</body>
</html>
