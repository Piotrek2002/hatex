<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 02.05.2020
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="order" items="${orders}">
    <p>${order.customer.name} ${order.customer.surname}</p>
    <p>${order.created}</p>
    <p>${order.updated}</p>
    <c:if test="${ order.progress==0}">
        <p>Zamówienie w realizacji</p>
    </c:if>

    <p><a href="/order/details/${order.id}">Szczegóły</a> </p>
</c:forEach>
</body>
</html>
