<#include "security.ftlh">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand mb-0 h1" href="/">YoAirLines</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">


            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/admin">Панель администратора</a>
                </li>
            </#if>


        </ul>
        <#if isUser>
            <div class="nav-item dropdown me-2">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${name}
                </a>
                <div class="dropdown-menu me-2" aria-labelledby="navbarDropdown">
                    <form class="form-inline my-2 my-lg-0" action="/user">
                        <button class="btn btn-outline-primary btn-block" type="submit">Профиль</button>
                    </form>
<#--                    <a class="dropdown-item" href="/user">Профиль</a>-->
                    <div class="dropdown-divider"></div>
                    <form action="/logout" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button type="submit" class="btn btn-outline-danger  btn-block">Выход</button>
                          </form>

                </div>
            </div>
            <#else >
                <form class="form-inline my-2 my-lg-0" action="/login">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">ВОЙТИ</button>
                </form>
        </#if>

    </div>
</nav>
