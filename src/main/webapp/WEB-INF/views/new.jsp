<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 06.05.2020
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="p-sm-2 m-md-4 p-md-4 border-dashed">
    <h2 class="dashboard-content-title">
        <span>Zamówienia do realizacji:</span>
    </h2>

    <c:forEach items="${ordersToComplete}" var="order">
        <table class="table">
            <tbody class="text-color-lighter">
            <tr class="d-flex">
                <td class="col-4">${order.customer.name} ${order.customer.surname}</td>
                <td class="col-5">${order.created}</td>
                <td class="col-3">
                    <a href="/order/details/${order.id}"
                       class="btn btn-info rounded-0 text-light m-1">Szczegóły</a>
                    <button class="btn btn-success rounded-0 text-light m-1" data-toggle="modal"
                            data-target="#myModal${order.id}">Zrobione
                    </button>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="modal fade" id="myModal${order.id}" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" >Weryfikacja zamówienia (${order.customer.surname})</h4>
                    </div>
                    <div class="modal-body">
                        Czy napewno chcesz oznaczyć to zamówienie jako zrobione
                    </div>
                    <div class="modal-footer">
                        <a href="/customer/list" type="button" class="btn btn-default"
                           data-dismiss="modal">wyjdź
                        </a>
                        <a href="/order/completed/${order.id}" type="button"
                           class="btn btn-primary">Oznacz jako zrobione</a>
                    </div>
                </div> <!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </c:forEach>
</div>
</body>
</html>
