<#import "parts/common.ftlh" as c>

<@c.page>




    <div class="card text-center ">
        <div class="card-header ">
            <ul class="nav nav-tabs card-header-tabs">
                <li class="nav-item">
                    <a class="nav-link active" role="tab" data-toggle="tab" href="#s">Перёлеты</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" role="tab" data-toggle="tab" href="#u">Пользователи</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " role="tab" data-toggle="tab" href="#a">Администрация</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " role="tab" data-toggle="tab" href="#st">Статистика</a>
                </li>
            </ul>
        </div>
        <div class="tab-content ">
            <div role="tabpanel1" class="tab-pane mt-4 mb-4 " id="u">
                <div class="container ">
                    <div class="row justify-content-center">
                        <table border="1">
                            <tr>
                                <th>Email</th>
                                <th>Номер телефона</th>
                                <th>Активность</th>
                                <th>Роли</th>
                                <th>Бан</th>
                                <th>Редактирование</th>
                                <th>Подробная информация</th>
                            </tr>
                            <#list users as user>
                                <#if !user.isAdmin()>
                                    <tr>
                                        <th>${user.email}</th>
                                        <th>${user.phoneNumber}</th>
                                        <th><#if user.active>true<#else>false</#if></th>
                                        <th><#list user.roles as role>${role}</#list></th>
                                        <th>
                                            <form action="/admin/user/ban/${user.id}" method="post">
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <#if user.active>
                                                    <input type="submit" value="Бан">
                                                <#else >
                                                    <input type="submit" value="Разблокировать">
                                                </#if>
                                            </form>
                                        </th>
                                        <th>
                                            <a href="/admin/user/edit/${user.id}">Редактировние</a>
                                        </th>
                                        <th><a href="/admin/user/${user.id}">Подробная информация</a></th>
                                    </tr>
                                </#if>

                            </#list>
                        </table>
                    </div>
                </div>
            </div>
            <div role="tabpanel1" class="tab-pane active mt-4 mb-4" id="s">
                <div class="container ">
                    <div class="row justify-content-center">
                        <#if flights?size!=0>
                            <table border="1">
                                <tr>
                                    <th>ТИП</th>
                                    <th>САМОЛЕТ</th>
                                    <th>ОТКУДА</th>
                                    <th>КУДА</th>
                                    <th>ВЫЛЕТ</th>
                                    <th>ПРИЛЕТ</th>
                                    <th>МЕСТ</th>
                                    <th>ЦЕНА</th>

                                </tr>
                                <#list flights as flignt>
                                    <tr>
                                        <th>${flignt.description}</th>
                                        <th>${flignt.airplane}</th>
                                        <th>${flignt.cityFrom}</th>
                                        <th>${flignt.cityDest}</th>
                                        <th>${flignt.getFormattedDeparture()}</th>
                                        <th>${flignt.getFormattedArrival()}</th>
                                        <th>${flignt.amount}</th>
                                        <th>${flignt.price}$</th>
                                        <th>
                                            <form action="/admin/flight/delete/${flignt.id}" method="post">
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="submit" value="Отменить перелет">
                                            </form>
                                        </th>
                                        <th>
                                            <form action="/admin/flight/info/${flignt.id}" method="get">
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="submit" value="ИНФОРМАЦИЯ">
                                            </form>
                                        </th>
                                    </tr>
                                </#list>
                            </table>
                        <#else>
                            <h4>ПОЛЕТОВ НЕТ</h4>
                        </#if>
                    </div>
                    <hr>
                    <hr>
                    <h3> Добавить перелет</h3>

                    <form action="/flight/create" class="needs-validation" novalidate method="post">
                        <div class="form-row ">
                            <div class="col  mb-3">
                                <label for="validationDefault01">Самолет</label>
                                <input type="text" class="form-control" id="validationDefault01"
                                       placeholder="Airbus"
                                       name="airplane" required>
                                <div class="invalid-feedback">
                                    Введите название самолета.
                                </div>
                            </div>


                            <div class="col  mb-3">
                                <label for="inputState">Класс</label>
                                <select name="description" id="inputState" class="form-control" required>
                                    <option selected disabled value="">Выберите...</option>
                                    <option value="1">Бизнес</option>
                                    <option value="2">Комфорт</option>
                                    <option value="3">Эконом</option>
                                    <option value="4">Первый класс</option>
                                </select>
                                <div class="invalid-feedback">
                                    Выберите тип полета.
                                </div>
                            </div>
                            <div class="col col-lg-2 mb-3">
                                <label for="validationDefaultUsername">Стоимость</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend2">$</span>
                                    </div>
                                    <input type="number"  min="0" max="100000" class="form-control" id="validationDefault03"
                                           placeholder="100" name="price" aria-describedby="inputGroupPrepend2"
                                           required>
                                    <div class="invalid-feedback">
                                        Укажите верную цену.
                                    </div>
                                </div>
                            </div>
                            <div class="col col-lg-2 mb-3">
                                <label for="validationDefaultUsername">Кол-во мест</label>
                                <input type="number" min="35" max="55" class="form-control" id="validationDefault03"
                                       placeholder="45" name="amount" aria-describedby="inputGroupPrepend2"
                                       required>
                                <div class="invalid-feedback">
                                    Укажите кол-во 35-55.
                                </div>
                            </div>


                        </div>
                        <div class="form-row justify-content-center">


                            <div class="col  mb-3">
                                <label for="validationDefault01">Откуда</label>
                                <input type="text" pattern="^[а-яА-Я]+$" class="form-control" id="validationDefault01"
                                       placeholder="Минск"
                                       name="cityFrom" required>
                                <div class="invalid-feedback">
                                    Введите настоящий город.
                                </div>
                            </div>
                            <div class="col  mb-3">
                                <label for="validationDefault01">Куда</label>
                                <input type="text"  pattern="^[а-яА-Я]+$" class="form-control" id="validationDefault01"
                                       placeholder="Москва"
                                       name="cityDest" required>
                                <div class="invalid-feedback">
                                    Введите настоящий город.
                                </div>
                            </div>
                            <div class="col  mb-3">
                                <label for="validationDefault01">Вылет</label>
                                <input type="datetime-local" class="form-control" id="validationDefault01"
                                       placeholder="Вылет"
                                       name="departure" required>
                                <div class="invalid-feedback">
                                    Выберите дату.
                                </div>
                            </div>
                            <div class="col  mb-3">
                                <label for="validationDefault01">Прибытие</label>
                                <input type="datetime-local" class="form-control" id="validationDefault01"
                                       placeholder="Прибытие"
                                       name="arrival" required>
                                <div class="invalid-feedback">
                                    Выберите дату.
                                </div>
                            </div>


                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button class="btn btn-primary btn-block" type="submit">Добавить перелет</button>
                    </form>


                </div>
            </div>
            <div role="tabpanel1" class="tab-pane mt-4 mb-4" id="a">
                <div class="container ">
                    <div class="row justify-content-center">
                        <table border="1">
                            <tr>
                                <th>Email</th>
                                <th>Номер телефона</th>
                                <th>Активность</th>
                                <th>Роли</th>
                                <th>Бан</th>
                                <th>Редактирование</th>
                                <th>Подробная информация</th>
                            </tr>
                            <#list users as user>
                                <#if user.isAdmin()>
                                    <tr>
                                        <th>${user.email}</th>
                                        <th>${user.phoneNumber}</th>
                                        <th><#if user.active>true<#else>false</#if></th>
                                        <th><#list user.roles as role>${role}</#list></th>
                                        <th>

                                            <form action="/admin/user/ban/${user.id}" method="post">
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <#if user.active>
                                                    <input type="submit" value="Бан">
                                                <#else >
                                                    <input type="submit" value="Разблокировать">
                                                </#if>

                                            </form>


                                        </th>
                                        <th>

                                            <a href="/admin/user/edit/${user.id}">Редактировние</a>

                                        </th>
                                        <th><a href="/admin/user/${user.id}">Подробная информация</a></th>
                                    </tr>
                                </#if>
                            </#list>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel1" class="tab-pane mt-4 mb-4" id="st">
                <div class="container ">
                    <div class="row justify-content-center">
                        <script type="text/javascript">
                            google.charts.load('current', {'packages': ['corechart']});
                            google.charts.setOnLoadCallback(drawChart);

                            function drawChart() {

                                var data = google.visualization.arrayToDataTable([
                                    ['Type', 'amount'],
                                    ['Business', ${statistics[6]}],
                                    ['Комфорт', ${statistics[7]}],
                                    ['Эконом', ${statistics[8]}],
                                    ['Первый класс', ${statistics[9]}]

                                ]);

                                var options = {
                                    title: 'Популярность средств',
                                    chartArea: {left: 0, top: 0, width: 500, height: 500},
                                    height: 400,
                                    width: 600

                                };

                                var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                                chart.draw(data, options);
                            }
                        </script>
                        <table border="1" style="margin-right: 165px">
                            <tr>
                                <th>ПРИЗНАК</th>
                                <th>ЗНАЧЕНИЕ</th>

                            </tr>
                            <tr>
                                <th>Всего рейсов</th>
                                <th>${statistics[0]}</th>
                            </tr>
                            <tr>
                                <th>Выполнено рейсов</th>
                                <th>${statistics[1]}</th>
                            </tr>
                            <tr>
                                <th>Всего билетов</th>
                                <th>${statistics[2]}</th>
                            </tr>
                            <tr>
                                <th>Всего забранированно</th>
                                <th>${statistics[3]}</th>
                            </tr>
                            <tr>
                                <th>Всего активных броней</th>
                                <th>${statistics[4]}</th>
                            </tr>
                            <tr>
                                <th>Общая прибыль</th>
                                <th>${statistics[5]}</th>
                            </tr>

                        </table>


                        <div id="piechart"></div>
                        <br>


                    </div>
                </div>
            </div>
        </div>
    </div>



    <script>
        const forms = document.querySelectorAll('.needs-validation');

        // Loop over them and prevent submission
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })</script>


</@c.page>