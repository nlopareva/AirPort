<#import "parts/common.ftlh" as c>

<@c.page>




    <div class="container-fluid d-flex h-100 justify-content-center align-items-center p-0">

        <div class="row shadow p-3 mb-5 bg-white rounded">

            <div class="col  p-4">
                <h3 class="text-center mb-4">Вход</h3>
                <form action="/login" method="post">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input type="email" name="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Пароль</label>
                        <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit"  class="btn btn-primary w-100">Войти</button>
                </form>
                <form class="form-inline mt-4" action="/registration">
                    <button class="btn btn-outline-success w-100" type="submit">Зарегистироваться</button>
                </form>
            </div>
        </div>
    </div>


</@c.page>