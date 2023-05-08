<#import "parts/common.ftlh" as c>

<@c.page>


    <div class="container-fluid d-flex h-100 justify-content-center align-items-center p-0">

        <div class="row shadow p-3 mb-5 bg-white rounded">

            <div class="col  p-4">
                <h3 class="text-center mb-4">Регистрация</h3>
                <form action="/registration" class="needs-validation" novalidate method="post">
                    <div class="form-row">
                        <div class="col-md-4 mb-3">

                            <label for="validationDefault02">Фамилия</label>
                            <input type="text" class="form-control" pattern="^[а-яА-Я]+$" id="validationDefault02" placeholder="Фамилия"
                                   name="lastName" required>
                            <div class="invalid-feedback">
                                Введите настоящую фамилию.
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationDefault01">Имя</label>
                            <input type="text" pattern="^[а-яА-Я]+$" class="form-control" id="validationDefault01" placeholder="Имя"
                                   name="name" required>
                            <div class="invalid-feedback">
                                Введите настоящее имя.
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationDefault05">Отчество</label>
                            <input type="text" pattern="^[а-яА-Я]+$" class="form-control" id="validationDefault05" placeholder="Отчество"
                                   name="secondName" required>
                            <div class="invalid-feedback">
                                Введите настоящее отчество.
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="validationDefault03">Телефон</label>
                            <input type="text" pattern="^\+375\d{9}$" class="form-control" id="validationDefault03" name="phoneNumber"
                                   placeholder="+375.." required>
                            <div class="invalid-feedback">
                                +375XXXXXXXXX
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="validationDefault04">Пароль</label>
                            <input type="password" pattern="[a-zA-Z0-9]{8,}" minlength="8" class="form-control" name="password" id="validationDefault04"
                                   placeholder="Пароль" required>
                        </div>
                        <div class="col-md-5 mb-3">
                            <label for="validationDefaultUsername">Email</label>
                            <input type="email" class="form-control" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" id="validationDefaultUsername" placeholder="Email"
                                   name="email" required>
                            <div class="invalid-feedback">
                                username@domain.com
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button class="btn btn-primary btn-block" type="submit">Зарегистрироваться</button>
                </form>

            </div>
        </div>
    </div>

    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>

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