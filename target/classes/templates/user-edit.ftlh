<#import "parts/common.ftlh" as c>

<@c.page>

<h1 style="color: white">AIRPORT </h1><hr>
<h4 style="color: white">РЕДАКТИРОВАНИЕ ПОЛЬЗОВАТЕЛЯ ${user.name}</h4>
<hr>
<b style="color: white">EMAIL:${user.email}</b><br>
<b style="color: white">НОМЕР ТЕЛЕФОНА:${user.phoneNumber}</b><br>
<hr>
<form action="/admin/user/edit" method="post">
    <#list roles as role >
        <div>
            <label style="color: white"><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked","")}>${role}</label>
        </div>
    </#list>
    <input type="hidden" name="userId" value="${user.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Сохранить">
</form>
</@c.page>