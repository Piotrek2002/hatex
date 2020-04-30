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

<section class="dashboard-section" >
    <div class="row dashboard-nowrap">



        <div class="m-4 p-4 width-medium">
            <div class="dashboard-header m-4">
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
                        <span class="font-weight-bold">Liczba klientów: ${ recipeCount }</span>
                    </div>
                    <div class="alert-item alert-info">
                        <i class="fas icon-circle fa-info-circle"></i>
                        <span class="font-weight-bold">Liczba zamówień zrealizowanych: ${ planCount }</span>
                    </div>
                    <div class="alert-item alert-info">
                        <i class="far icon-circle fa-calendar-alt"></i>
                        <span class="font-weight-bold">Liczba zamówień do realizacji: ${ planCount }</span>
                    </div>

                </div>
            </div>
            <div class="m-4 p-4 border-dashed">
                <h2 class="dashboard-content-title">
                    <span>Zamówienia do realizacji:</span> ${lastUserPlanName}
                </h2>
                <c:set var="weekday" value="0"/>
                <c:forEach items="${ lastUserPlan }" var="plan">
                    <c:if test="${weekday != plan[0]}">
                        <table class="table">
                            <thead>
                            <tr class="d-flex">
                                <th class="col-3">${plan[0]}</th>
                                <th class="col-3"></th>
                                <th class="col-3"></th>
                                <th class="col-3"></th>
                            </tr>
                            </thead>
                            <tbody class="text-color-lighter">
                            <c:forEach items="${ lastUserPlan }" var="subplan">
                                <c:if test="${plan[0] == subplan[0]}">
                                    <tr class="d-flex">
                                        <td class="col-2">${subplan[1]}</td>
                                        <td class="col-8">${subplan[2]}</td>
                                        <td class="col-2">
                                            <a href="/app/recipe/details?id=${subplan[4]}" class="btn btn-info rounded-0 text-light m-1">Szczegóły</a>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:set var="weekday" value="${plan[0]}"/>
                </c:forEach>
            </div>
        </div>
    </div>
</section>

<%@include file="footer.jsp" %>
<%@include file="scripts.jsp" %>
</body>
</html>