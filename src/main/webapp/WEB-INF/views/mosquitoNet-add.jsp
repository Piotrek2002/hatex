<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 28.04.2020
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <link rel="stylesheet" href="./css/style.css">
    <link href='<c:url value="/css/style.css"/>' rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>

<body>

<%@include file="backend-menu.jsp" %>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">


        <div class="m-4 p-3 width-medium text-color-darker">
            <div class="dashboard-content border-dashed p-3 m-4 view-height">
                <!-- fix action, method -->
                <!-- add name attribute for all inputs -->
                <form:form method="post" modelAttribute="mosquitoNet">
                    <div class="mt-4 ml-4 mr-4">
                        <div class="row border-bottom border-3">
                            <div class="col"><h3 class="color-header text-uppercase">Nowy produkt</h3></div>
                            <div class="col d-flex justify-content-end mb-2">
                                <button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Dodaj</button>
                            </div>
                        </div>

                        <table class="table borderless">
                            <tbody>
                            <tr class="d-flex">
                                <form:label path="color">
                                    <th scope="row" class="col-2">color</th>
                                </form:label>
                                <td class="col-3">
                                    <form:select path="color"  items="${colors}" class="w-100 p-1"/>
                                    <form:errors path="color" cssClass="errorMessage"/>
                                </td>
                            </tr>
                            <tr class="d-flex">
                                <form:label path="count">
                                    <th scope="row" class="col-2">Ilość</th>
                                </form:label>
                                <td class="col-3">
                                    <form:input type="number" path="count" class="w-100 p-1"/>
                                    <form:errors path="count" cssClass="errorMessage"/>
                                </td>
                            </tr>
                            <tr class="d-flex">
                                <form:label path="height">
                                    <th scope="row" class="col-2">wysokość</th>
                                </form:label>
                                <td class="col-3">
                                    <form:input path="height" class="w-100 p-1"/>
                                    <form:errors path="height" cssClass="errorMessage"/>
                                </td>
                            </tr>
                            <tr class="d-flex">
                                <form:label path="length">
                                    <th scope="row" class="col-2">szerokość</th>
                                </form:label>
                                <td class="col-3">
                                    <form:input path="length" class="w-100 p-1"/>
                                    <form:errors path="length" cssClass="errorMessage"/>
                                </td>
                            </tr>
                            <tr class="d-flex">
                                <form:label path="size">
                                    <th scope="row" class="col-2">Grubość</th>
                                </form:label>
                                <td class="col-3">
                                    <form:input path="size" class="w-100 p-1"/>
                                    <form:errors path="size" cssClass="errorMessage"/>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</section>

<%@include file="scripts.jsp" %>
</body>
</html>