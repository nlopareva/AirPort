<#import "parts/common.ftlh" as c>

<@c.page>




    <div class="row">

        <div class="col-sm-8 align-self-start" >
            <div class="container-fluid d-flex h-100  align-items-center p-0 pb-5">
                <div class="card  shadow rounded" style="width: 600px">
                    <div class="card-header pb-0">
                        <h3>${flight.cityFrom} <img src="https://im.wampi.ru/2023/04/19/arrow-right.png" width="60px" height="60px" alt="arrow-right.png" border="0"> ${flight.cityDest}</h3>
                    </div>
                    <div class="card-body ">
                        <b>Тип полета:</b>
                        <#if flight.description=="1">Бизнес</#if>
                        <#if flight.description=="2">Комфорт</#if>
                        <#if flight.description=="3">Эконом</#if>
                        <#if flight.description=="4">Первый класс</#if>
                        <br>
                        <b>Самолет:</b> ${flight.airplane}<br>
                        <b>Вылет:</b> ${flight.departure}<br>
                        <b>Прибытие:</b> ${flight.arrival}<br>
                    </div>
                    <div class="card-footer">
                        <b>${flight.price}$</b>
                    </div>
                </div>
            </div>



            <div class="col-sm-9  ml-4 mt-3" >
                <div class="container-fluid d-flex h-100  align-items-center p-0 ">
                    <div class="card  text-white bg-secondary rounded " >
                        <div class="card-body ">
                            <b>ВНИМАНИЮ ПАССАЖИРОВ!</b><br>
                            Здесь вы можете забронировать билет на самолет.<br>
                            <b>Оплата билета и багажа производится в кассе аэропорта.</b><br>
                            Для дополнительной информации <a href="https://t.me/yonaastyaa" style="color: lightskyblue">свяжитесь с нами</a>
                        </div>
                        <div class="card-footer">
                            <b>ПРИЯТНОГО ПОЛЕТА</b>
                        </div>
                    </div>
                </div>
            </div>

<#--            <img src="https://static.kulturologia.ru/files/u18046/fake-flight-1.jpg" width="460px" style="padding-left: 110px" height="350px" alt="arrow-right.png" border="0">-->



        </div>

        <div class="col-sm-4">
            <h4 style="color: white; text-align: center; ">Выберите место: </h4>
            <div class="container-fluid d-flex h-100 justify-content-center align-items-center p-0 pb-5">
                <div class="row shadow p-3 mb-2 bg-white rounded">

                    <table>
                        <tr>
                            <th>
                                <div style="width: 50px"></div>
                            </th>
                            <th>
                                <div style="width: 50px"></div>
                            </th>
                            <th>
                                <div style="width: 50px"></div>
                            </th>
                            <th>
                                <div style="width: 50px"></div>
                            </th>
                            <th>
                                <div style="width: 50px"></div>
                            </th>
                        </tr>
                        <#assign count = 0>
                        <#assign place = 1>
                        <#list flight.ticketList as tick>
                        <#if count==5>
                        </tr>
                        <#assign count = 0>
                        <tr>
                            </#if>
                            <#if count==2>
                                <td></td>
                                <#assign count = count+1>
                            </#if>

                            <#if tick.user?has_content>
                            <#--                            https://im.wampi.ru/2023/04/19/car-seat-3.png-->
<#--                                https://im.wampi.ru/2023/04/19/car-seat-3.png-->
                                <td>
                                    <div style="position: relative;">
                                    <img src="https://im.wampi.ru/2023/04/19/car-seat-3.png" width="50" height="50"
                                         alt="${tick.id}">
                                        <#if place < 10 >
                                            <span style="position: absolute; top: 18px; right: 17px; font-size: 11px; color: gray;  padding: 5px;">${place}</span>

                                        <#else >
                                            <span style="position: absolute; top: 18px; right: 14px; font-size: 11px; color: gray;  padding: 5px;">${place}</span>

                                        </#if>

                                         <#assign place = place+1>
                                    </div>
                                </td>
                            <#else>
                                <td>
                                    <div style="position: relative;">
<#--                                        href="/flight/bought/ticket/${tick.id}"-->
                                    <a  data-toggle="modal" data-target="#boughtModal${place}"><img
                                                src="https://ie.wampi.ru/2023/04/19/car-seat-2.png" width="50"
                                                height="50"
                                                alt="Место 1">

                                        <#if place < 10 >
                                            <span style="position: absolute; top: 18px; right: 17px; font-size: 11px; color: black; padding: 5px;">${place}</span>

                                        <#else >
                                            <span style="position: absolute; top: 18px; right: 14px; font-size: 11px; color: black; padding: 5px;">${place}</span>

                                        </#if>
                                    </a>

                                        <!-- Modal-->
                                    <div class="modal fade" id="boughtModal${place}" tabindex="-1" aria-labelledby="boughtModal${place}label" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="boughtModal${place}label">ПОДТВЕРДИТЬ</h5>
                                                    <button class="btn-close" data-dismiss="modal" aria-label="close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <b>Самолет:</b> ${flight.airplane}<br>
                                                    <b>Вылет:</b> ${flight.departure}<br>
                                                    <b>Прибытие:</b> ${flight.arrival}<br>
                                                    <b>Цена:</b> ${flight.price}<br>
                                                    <b>МЕСТО:</b> ${tick.place}<br>

                                                </div>
                                                <div class="modal-footer">
                                                    <form action="/flight/${flight.id}/bought/ticket/${tick.id}" method="get">
                                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                    <button class="btn btn-outline-success " type="submit">ЗАБРОНИРОВАТЬ</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        <!-- Modal-->

                                    <#assign place = place+1>
                                    </div>
                                </td>
                            </#if>


                            <#assign count = count+1>

                            </#list>
                            <!-- Добавьте больше строк, если необходимо -->
                    </table>
                </div>
            </div>
        </div>
    </div>









</@c.page>