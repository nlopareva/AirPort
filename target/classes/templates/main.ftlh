<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="container text-center">
    <h1 style="color: white; padding-top: 45px; ">ПРИКЛЮЧЕНИЯ НАЧИНАЮТСЯ ЗДЕСЬ... 😊✌️✈️</h1>
    </div>



    <div class="container-fluid d-flex h-100 justify-content-center align-items-center p-0 pt-5">

        <div class="row shadow p-3 mb-2 bg-white rounded " style="width: 900px">
            <form action="/search" method="get">
            <div class="row g-3 pb-2">

                <div class="form-inline  ml-4" >
                    <input type="text" class="form-control" placeholder="Откуда" style="width: 300px;" name="departure">
                </div>
                <img src="https://i.ibb.co/YPdMY3V/arrow.png" width="60px" height="30px" alt="arrow-right.png" border="0">
                <div class="form-inline mr-5">
                    <input type="text" class="form-control" placeholder="Куда" style="width: 300px;" name="destination">
                </div>

                <div class="form-inline mr-2">
                    <button type="submit" style="width: 150px" class="btn btn-primary">ПОИСК</button>
                </div>

            </div>
            </form>
            <form action="/search/all" method="get">
                <div>
                <button type="submit" style="background: none;border: none;color: blue;float:right;cursor: pointer; text-decoration: underline;ffont-size: 8px; font-family: inherit;" class="btn btn-primary">все перелеты</button>
                </div>
            </form>
        </div>
    </div>


</@c.page>