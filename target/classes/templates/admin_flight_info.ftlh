<#import "parts/common.ftlh" as c>

<@c.page>




    <div class="row">

        <div class="col-sm-8 align-self-start">
            <div class="container-fluid d-flex h-100  align-items-center p-0 pb-5">
                <div class="card  shadow rounded" style="width: 600px">
                    <div class="card-header pb-0">
                        <h3>${flight.cityFrom} <img src="https://im.wampi.ru/2023/04/19/arrow-right.png" width="60px"
                                                    height="60px" alt="arrow-right.png" border="0"> ${flight.cityDest}
                        </h3>
                    </div>
                    <div class="card-body ">
                        <b>Тип полета:</b> <#if flight.description=="1">
                        Бизнес
                    <#else >
                        Комфорт
                        </#if><br>
                        <b>Самолет:</b> ${flight.airplane}<br>
                        <b>Вылет:</b> ${flight.departure}<br>
                        <b>Прибытие:</b> ${flight.arrival}<br>
                    </div>
                    <div class="card-footer">
                        <b>${flight.price}$</b>
                    </div>
                </div>
            </div>

            <#--            <img src="https://static.kulturologia.ru/files/u18046/fake-flight-1.jpg" width="460px" style="padding-left: 110px" height="350px" alt="arrow-right.png" border="0">-->

        </div>
        <div class="col-sm-4 mb-4">
            <table border="1" style="color: white">
                <tr>

                    <th>МЕСТО</th>
                    <th>ПАССАЖИР</th>

                </tr>

                <#list tickets as ticket>
                    <tr>
                        <th>${ticket.place}</th>
                        <#if ticket.user?has_content>
                            <th>
                                <form action="/admin/flight/${ticket.flight.id}/ticket/delete/${ticket.id}" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="submit" value="Отменить перелет">
                                </form>
                            </th>
                            <#else >
                            <th> CВОБОДНО</th>

                        </#if>

                    </tr>

                </#list>
        </div>
    </div>










</@c.page>