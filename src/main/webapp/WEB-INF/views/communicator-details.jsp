<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 20.05.2020
  Time: 00:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css"
          rel="stylesheet"/>

    <!-- Bootstrap core CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- Custom styles for this template -->
    <link href="/chat.css" rel="stylesheet">
</head>
<body>
<%@include file="backend-menu.jsp" %>
<section>
    <div class="container-fluid">
        <div class="row">
            <main role="main" class="col-12 ml-sm-auto px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 mb-3 ">
                    <h1 class="h2">${user.username}</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group mr-2">
                            <ul class="nav nav-pills" role="tablist">
                                <li><input class="form-control" id="myInput" type="text" placeholder="Search"
                                           aria-label="Search"></li>
                            </ul>

                        </div>

                    </div>
                </div>
                <div class="schedules-content border-top">
                    <c:forEach items="${message}" var="message">

                        <div class="schedules-content-header mt-2">
                            <div class="form-group row mb-2">
                                <c:if test="${message.sender.id==user.id}">
                                    <div class="col-5">
                                        <p class="schedules-text" >${message.message}</p>
                                    </div>

                                    <div class="col-7">
                                        <p class="schedules-text"></p>
                                    </div>
                                </c:if>
                                <c:if test="${message.sender.id!=user.id}">


                                    <div class="col-7">
                                        <p class="schedules-text"></p>
                                    </div>

                                    <div class="col-5">
                                        <p class="schedules-text">${message.message}</p>
                                    </div>
                                </c:if>
                            </div>
                        </div>

                    </c:forEach>
                </div>
            </main>
        </div>
    </div>
</section>


<%@include file="scripts.jsp" %>
<script src="http://localhost:8080/dashboard.js"></script>
</body>

</html>
