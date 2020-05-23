<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 17.05.2020
  Time: 02:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">

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
                <form:form method="post" modelAttribute="customer">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3">
                        <h1 class="h2">Aktualizacja klienta</h1>
                        <div class="btn-toolbar">
                            <div class="btn-group mr-2">
                                <ul class="nav nav-pills" role="tablist">
                                    <li>
                                        <button type="submit" class="btn form-control btn-outline-secondary">Aktualizuj
                                            klienta
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <table class="table table-sm">
                        <tbody>
                        <tr class="d-flex">
                            <form:label path="name">
                                <th scope="row" class="col-2">Imię</th>
                            </form:label>
                            <td class="col-7">
                                <form:input path="name" class="w-100 p-1"/>
                                <form:errors path="name" cssClass="errorMessage"/>
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <form:label path="surname">
                                <th scope="row" class="col-2">Nazwisko</th>
                            </form:label>
                            <td class="col-7">
                                <form:input path="surname" class="w-100 p-1"/>
                                <form:errors path="surname" cssClass="errorMessage"/>
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <form:label path="email">
                                <th scope="row" class="col-2">Email</th>
                            </form:label>
                            <td class="col-7">
                                <form:input path="email" class="w-100 p-1"/>
                                <form:errors path="email" cssClass="errorMessage"/>
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <form:label path="phoneNumber">
                                <th scope="row" class="col-2">Numer telofonu</th>
                            </form:label>
                            <td class="col-3">
                                <form:input path="phoneNumber" class="w-100 p-1"/>
                                <form:errors path="phoneNumber" cssClass="errorMessage"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <div class="row d-flex">

                        <div class="col-5 border-bottom border-3">
                            <form:label path="address"><h3 class="text-uppercase">Adres klienta</h3></form:label>
                        </div>

                        <div class="col-2"></div>
                        <div class="col-5 border-bottom border-3">
                            <form:label path="description"><h3 class="text-uppercase">Dodatkowe
                                informacje</h3></form:label>
                        </div>
                    </div>
                    <div class="row d-flex">
                        <div class="col-5 p-4">
                            <form:textarea path="address" rows="10" class="w-100 p-1"/>
                            <form:errors path="address" cssClass="errorMessage"/>
                        </div>
                        <div class="col-2"></div>

                        <div class="col-5 p-4">
                            <form:textarea path="description" rows="10" class="w-100 p-1"/>
                            <form:errors path="description" cssClass="errorMessage"/>
                        </div>
                    </div>

                </form:form>

            </main>
        </div>
    </div>
</section>
<%@include file="scripts.jsp" %>
<script src="http://localhost:8080/dashboard.js"></script>
</body>

</html>