<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 18.05.2020
  Time: 23:48
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
                <form:form method="post" modelAttribute="mosquitoNet">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3">
                        <h1 class="h2">Aktualizuja moskitieru</h1>
                        <div class="btn-toolbar">
                            <div class="btn-group mr-2">
                                <ul class="nav nav-pills" role="tablist">
                                    <li>
                                        <button type="submit" class="btn form-control btn-outline-secondary">Aktualizuj moskitiere
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <table class="table table-sm">
                        <tbody>
                        <tr class="d-flex">
                            <form:label path="color">
                                <th scope="row" class="col-2">Kolor</th>
                            </form:label>
                            <td class="col-10">
                                <form:select path="color" items="${colors}" class="w-100 p-1"/>
                                <form:errors path="color" cssClass="errorMessage"/>
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <form:label path="count">
                                <th scope="row" class="col-2">Ilość</th>
                            </form:label>
                            <td class="col-10">
                                <form:input type="number" path="count" class="w-100 p-1"/>
                                <form:errors path="count" cssClass="errorMessage"/>
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <form:label path="height">
                                <th scope="row" class="col-2">Wysokość</th>
                            </form:label>
                            <td class="col-10">
                                <form:input path="height" class="w-100 p-1"/>
                                <form:errors path="height" cssClass="errorMessage"/>
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <form:label path="length">
                                <th scope="row" class="col-2">Szerokość</th>
                            </form:label>
                            <td class="col-10">
                                <form:input path="length" class="w-100 p-1"/>
                                <form:errors path="length" cssClass="errorMessage"/>
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <form:label path="size">
                                <th scope="row" class="col-2">Grubość</th>
                            </form:label>
                            <td class="col-10">
                                <form:input path="size" class="w-100 p-1"/>
                                <form:errors path="size" cssClass="errorMessage"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </form:form>

            </main>
        </div>
    </div>
</section>
<%@include file="scripts.jsp" %>
<script src="http://localhost:8080/dashboard.js"></script>
</body>
</html>