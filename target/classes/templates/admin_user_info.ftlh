<#import "parts/common.ftlh" as c>

<@c.page>

    <h1 style="color: white">AIRPORT </h1><hr>
    <h4 style="color: white">ПОЛЬЗОВАТЕЛЬ ${user.name}</h4>
    <hr>
    <b style="color: white">EMAIL:${user.email}</b><br>
    <b style="color: white">НОМЕР ТЕЛЕФОНА:${user.phoneNumber}</b><br>
    <hr>
    <h4 style="color: white"> БИЛЕТЫ</h4>
    <#list user.ticketList as flight>
        <div>
            <p style="color: white">${flight.flight.description} ${flight.flight.cityFrom}-> ${flight.flight.cityDest} ${flight.flight.airplane} ${flight.flight.departure} ${flight.flight.arrival} ${flight.flight.price}$
            </p>
        </div>
    <#else >
        <h3 style="color: white">ПОЛЕТОВ НЕТ</h3>
    </#list>


    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</@c.page>