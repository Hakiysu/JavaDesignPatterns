<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>仓库货物管理系统-登录前页面</title>
</head>
<body>
<h1 align="center">仓库货物管理系统</h1>
<form action="/loginCheck" method="post">
    <table align="center" border="1" width="20%">
        <tr>
            <th>用户名</th>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <th>密码</th>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="登录"></td>
        </tr>
    </table>
</form>
<p align="center">
    注册新用户：<a href="accountManager/register.html">注册</a>
</p>
</body>
</html>
