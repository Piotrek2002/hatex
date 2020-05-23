<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header>
    <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
        <a class="navbar-brand mr-5" href="/desktop">Hatex</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainmenu">

            <ul class="navbar-nav mr-auto">

                <li class="nav-item">
                    <a class="nav-link" href="/desktop"> Pulpit </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="/customer/list"> Klienci </a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id="submenu1" aria-haspopup="true"> Zamowienia </a>

                    <div class="dropdown-menu" aria-labelledby="submenu1">
                        <a class="dropdown-item" href="/order/list">Wszystkie</a>
                        <a class="dropdown-item" href="/order/listToComplete">Do zrealizowania</a>
                        <a class="dropdown-item" href="/order/listToPay">Do zaplaty</a>
                        <a class="dropdown-item" href="/order/listValuations">Wyceny</a>
                    </div>
                </li>
                <sec:authorize access="hasRole('ADMIN')">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id="submenu2" aria-haspopup="true"> Profil admina </a>

                    <div class="dropdown-menu" aria-labelledby="submenu2">
                        <a class="dropdown-item" href="#">Statystyki</a>
                        <a class="dropdown-item" href="/user/list">Pracownicy</a>
                    </div>
                </li>
                </sec:authorize>



                <li class="nav-item">
                    <a class="nav-link" href="/communicator"> Komunikator </a>
                </li>

            </ul>

        </div>
    </nav>
</header>