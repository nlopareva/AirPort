<#import "parts/common.ftlh" as c>

<@c.page>

    <h3 style="color: white">Аккаунт</h3>
    <hr>

    <p style="color: white"><b>ФАМИЛИЯ:</b>${user.lastName}</p><br>
    <p style="color: white"><b>ИМЯ:</b>${user.name}</p><br>
    <p style="color: white"><b>ОТЧЕСТВО:</b>${user.secondName}</p><br>
    <p style="color: white"><b>EMAIL:</b>${user.email}</p><br>
    <p style="color: white"><b>НОМЕР ТЕЛЕФОНА:</b>${user.phoneNumber}</p><br>
    <hr>



    <div class="card text-center mb-3">
        <div class="card-header ">
            <ul class="nav nav-tabs card-header-tabs">
                <li class="nav-item">
                    <a class="nav-link active" role="tab" data-toggle="tab" href="#n">Запланированные</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" role="tab" data-toggle="tab" href="#p">История</a>
                </li>
            </ul>
        </div>
        <div class="tab-content ">
            <div role="tabpanel1 " class="tab-pane active mt-4 mb-4 " id="n">
                <div class="container ">
                    <div class="row justify-content-center">
                        <#if nextFlights?size!=0>
                            <table border="1">
                                <tr>
                                    <th>ТИП</th>
                                    <th>САМОЛЕТ</th>
                                    <th>ОТКУДА</th>
                                    <th>КУДА</th>
                                    <th>ВЫЛЕТ</th>
                                    <th>ПРИЛЕТ</th>
                                    <th>МЕСТО</th>
                                    <th>ЦЕНА</th>

                                </tr>

                                <#list nextFlights as ticket>
                                    <tr>
                                        <th>
                                            <#if ticket.flight.description=="1">Бизнес</#if>
                                            <#if ticket.flight.description=="2">Комфорт</#if>
                                            <#if ticket.flight.description=="3">Эконом</#if>
                                            <#if ticket.flight.description=="4">Первый класс</#if></th>
                                        <th>${ticket.flight.airplane}</th>
                                        <th>${ticket.flight.cityFrom}</th>
                                        <th>${ticket.flight.cityDest}</th>
                                        <th>${ticket.flight.departure}</th>
                                        <th>${ticket.flight.arrival}</th>
                                        <th>${ticket.place}</th>
                                        <th>${ticket.flight.price}$</th>
                                        <th>
                                            <form action="/user/ticket/delete/${ticket.id}" method="post">
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="submit" value="Отменить перелет">
                                            </form>
                                        </th>
                                    </tr>

                                </#list>

                            </table>
                        <#else >
                            <h3>ВЫ НИКУДА НЕ ЗАПИСАНЫ</h3>
                        </#if>
                    </div>
                </div>
            </div>
            <div role="tabpanel1" class="tab-pane  mt-4 mb-4" id="p">
                <div class="container ">
                    <div class="row justify-content-center">
                        <#if previousFlights?size!=0>
                            <table border="1">
                                <tr>
                                    <th>ТИП</th>
                                    <th>САМОЛЕТ</th>
                                    <th>ОТКУДА</th>
                                    <th>КУДА</th>
                                    <th>ВЫЛЕТ</th>
                                    <th>ПРИЛЕТ</th>
                                    <th>МЕСТО</th>
                                    <th>ЦЕНА</th>

                                </tr>

                                <#list previousFlights as flight>
                                    <tr>
                                        <th>${flight.flight.description}</th>
                                        <th>${flight.flight.airplane}</th>
                                        <th>${flight.flight.cityFrom}</th>
                                        <th>${flight.flight.cityDest}</th>
                                        <th>${flight.flight.departure}</th>
                                        <th>${flight.flight.arrival}</th>
                                        <th>${flight.place}</th>
                                        <th>${flight.flight.price}$</th>
                                        <th>
                                            <form action="/admin/flight/delete/${flight.id}" method="post">
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="submit" value="Отменить перелет">
                                            </form>
                                        </th>
                                    </tr>

                                </#list>

                            </table>
                        <#else >
                            <h3>ИСТОРИЯ ПУСТА</h3>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>



</@c.page>