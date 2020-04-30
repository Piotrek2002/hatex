<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 28.04.2020
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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



        <div class="m-4 p-3 width-medium">
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
                        <th scope="col" class="col-2">IMIE</th>
                        <th scope="col" class="col-2">NAZWISKO</th>
                        <th scope="col" class="col-4">ADRES</th>
                        <th scope="col" class="col-2">NUMER TELEFONU</th>
                        <th scope="col" class="col-2 center">AKCJE</th>
                    </tr>
                    </thead>
                    <c:forEach var="customer" items="${customers}">
                        <tbody class="text-color-lighter">
                        <tr class="d-flex">
                            <th scope="row" class="col-2">${customer.name}</th>
                            <td class="col-2">
                                    ${customer.surname}
                            </td>
                            <td class="col-4">${customer.address}
                            </td>
                            <td class="col-2">${customer.phoneNumber}</td>
                            <td class="col-2 d-flex align-items-center justify-content-center flex-wrap">
                                <a href="#" class="btn btn-danger rounded-0 text-light m-1">Usuń</a>
                                <a href="/app-recipe-details.html" class="btn btn-info rounded-0 text-light m-1">Szczegóły</a>
                                <a href="/app-edit-recipe.html"
                                   class="btn btn-warning rounded-0 text-light m-1">Edytuj</a>
                            </td>
                        </tr>
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
