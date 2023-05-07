<#import "parts/common.ftlh" as c>

<@c.page>

    <form action="/search" method="get">
    <div class="container-fluid d-flex h-100 justify-content-center align-items-center p-0">

        <div class="row shadow p-3 mb-2 bg-white rounded " style="width: 900px">

            <div class="row g-3 pb-2">
                <div class="form-inline  ml-4" >
                    <input type="text" class="form-control" placeholder="Откуда" style="width: 300px;" value="${dep}" name="departure">
                </div>
                <img src="https://im.wampi.ru/2023/04/19/arrow-right.png" width="60px" height="60px" alt="arrow-right.png" border="0">
                <div class="form-inline mr-5">
                    <input type="text" class="form-control" placeholder="Куда" style="width: 300px;" value="${dest}" name="destination">
                </div>

                <div class="form-inline mr-2">
                    <button type="submit" style="width: 150px" class="btn btn-primary">ПОИСК</button>
                </div>

            </div>
        </div>
    </div>
    </form>


<#if founded==false>
    <div class="container text-center mb-5">

        <h3 style="color: white;padding-top: 55px; ">К сожалению, мы не можем найти подходящий перелет для вас 🥺🫣😬️</h3>
        <h7 style="color: white;  ">Поищите другие города, или познакомьтесь со всеми доступными перелетами ниже.</h7>
    </div>

</#if>
    <div class="container-fluid d-flex h-100  align-items-center justify-content-center p-0 ">
        <div class="card  text-white bg-secondary shadow rounded mb-0" style="width: 900px">
            <div class="row mt-2 mb-2">

                <div class="col ml-4 mb-0">
                    <b>ПЕРЕЛЕТ</b>
                </div>
                <div class="col mb-0">
                    <b> ОТПРАВЛЕНИЕ</b>
                </div>
                <div class="col mb-0">
                    <b> ПРИБЫТИЕ</b>
                </div>
                <div class="col mb-0">
                    <b>БИЛЕТЫ</b>
                </div>

            </div>
        </div>
    </div>

    <#list flights as flight>
        <div class="container-fluid d-flex h-100  align-items-center justify-content-center p-0 ">
            <div class="card  shadow rounded" style="width: 900px">
                <div class="card-header pb-0  pt-0 mb-0"><h5 class="card-title m-0"> ${flight.cityFrom} <img
                                src="https://im.wampi.ru/2023/04/19/arrow-right.png"
                                width="60px" height="60px" alt="arrow-right.png"
                                border="0"> ${flight.cityDest}</h5>
                </div>
                <div class="card-body pb-0 pt-2 ">
                    <div class="row">

                        <div class="col">
                            <b><#if flight.description=="1"><p>Бизнес</p></#if>
                                <#if flight.description=="2"><p>Комфорт</p></#if>
                                <#if flight.description=="3"><p>Эконом</p></#if>
                                <#if flight.description=="4"><p>Первый класс</p></#if>

                            </b>
                            <p> ${flight.airplane}</p>

                        </div>
                        <div class="col">
                            <p> ${flight.departure}</p>
                        </div>
                        <div class="col">
                            <p> ${flight.arrival}</p>
                        </div>
                        <div class="col">
                            <p>Осталось:${flight.amount}шт</p>
                            <p>Стоимость:${flight.price}$</p>

                        </div>

                    </div>

                    <div class="d-flex align-items-end flex-column">
                        <div class="p-2">
                            <form action="/flight/${flight.id}" method="get">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="submit" class="btn btn-outline-primary">Выбрать билет</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </#list>
    <div class="container text-center mb-3">
    </div>


</@c.page>