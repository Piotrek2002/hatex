<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 02.05.2020
  Time: 00:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hatex</title>
</head>
<body>
<form:form method="post" modelAttribute="order">

    <form:select path="customer" items="${customers}" itemLabel="surname" itemValue="id"/>
    <form:errors path="customer" cssClass="errorMessage"/>

    <input type="submit" value="Submit">

</form:form>
</body>
</html>
