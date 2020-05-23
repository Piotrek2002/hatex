<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 12.05.2020
  Time: 01:45
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

<nav class="navbar navbar-dark bg-dark navbar-expand-lg">
    <a class="navbar-brand mr-5 text-white">Hatex</a>
</nav>
<section>
    <div class="container-fluid">
        <div class="row">
            <main role="main" class="col-12 ml-sm-auto px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 mb-3 ">
                    <h1 class="h2">Lista siatek</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group mr-2">
                            <ul class="nav nav-pills" role="tablist">
                                <li class="pr-5">
                                    <a type="button" class="btn form-control btn-outline-secondary "
                                                    href="/production/done/${order.id}">Oznacz jako zrobione</a></li>
                                <li class="pr-5">
                                    <input type="button" class="btn form-control btn-outline-secondary" value="Wstecz" onClick="history.back();" />
                                </li>
                                </ul>

                        </div>

                    </div>
                </div>
                <c:forEach items="${mosquitoNets}" var="mosquitoNet">
                    <div class="schedules-content border-top">
                        <div class="schedules-content-header mt-2">
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
                                <div class="col-sm-3 col-lg-4">
                                    <p class="schedules-text">${mosquitoNet.height}</p>
                                </div>
                                <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                    Wysokość do cięcia
                                </span>
                                <div class="col-sm-3 col-lg-4">
                                    <p class="schedules-text">${mosquitoNet.height-50}</p>
                                </div>
                            </div>
                            <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                    Szerokoć
                            </span>
                                <div class="col-sm-3 col-lg-4">
                                    <p class="schedules-text">
                                            ${mosquitoNet.length}
                                    </p>
                                </div>
                                <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                    Szerokoć do cięcia
                            </span>
                                <div class="col-sm-3 col-lg-4">
                                    <p class="schedules-text">
                                            ${mosquitoNet.length-50}
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
                        </div>
                    </div>
                </c:forEach>

            </main>
        </div>
    </div>
</section>
<%@include file="scripts.jsp" %>
<script src="http://localhost:8080/dashboard.js"></script>
</body>

</html>