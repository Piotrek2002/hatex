<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header>
    <nav class="navbar navbar-dark bg-color navbar-expand-lg">
        <a class="navbar-brand mr-5" href="/desktop">Hatex</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainmenu">

            <ul class="navbar-nav mr-auto">

                <li class="nav-item active">
                    <a class="nav-link" href="/desktop"> Pulpit </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="/customer/list"> Klienci </a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id="submenu" aria-haspopup="true"> Zamowienia </a>

                    <div class="dropdown-menu" aria-labelledby="submenu">
                        <a class="dropdown-item" href="/order/list">Wszystkie</a>
                        <a class="dropdown-item" href="/order/listToComplete">Do zrealizowania</a>
                        <a class="dropdown-item" href="/order/listToPay">Do zaplaty</a>
                    </div>
                </li>
                <sec:authorize access="hasRole('ADMIN')">
                <li class="nav-item">
                    <a class="nav-link disabled" href="#"> Edytuj dane </a>
                </li>
                </sec:authorize>



                <li class="nav-item">
                    <a class="nav-link" href="#"> Komunikator </a>
                </li>

            </ul>

        </div>
    </nav>
</header>