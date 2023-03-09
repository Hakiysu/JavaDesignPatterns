<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>仓库货物管理系统-账户数据修改</title>
</head>
<body>
<table align="center" border="1" width="1280" height="720">
    <tr>
        <th>账户信息</th>
        <th>账户修改</th>
    </tr>
    <tr>
        <td width="1280">
            <%@ include file="/accountManager/showUserData.jsp" %>
        </td>
        <td width="1280">
            <p>提示：用户类型中1为客户，2为厂家。</p>
            <form action="/updateUserData" method="post">
                <table>
                    <tr>
                        <td width="100">新的密码</td>
                        <td><input type="text" name="passwd" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100">新的电话号码</td>
                        <td><input type="text" name="telephone" value=""/></td>
                    </tr>
                    <tr>
                        <td width="100">新的电子邮箱</td>
                        <td><input type="text" name="email" value=""/></td>
                    </tr>
                    <tr>
                        <td width="100">新的地址</td>
                        <td><input type="text" name="address" value=""/></td>
                    </tr>
                    <input type="hidden" name="accountLevel" value="2"/>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="提交"></td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center"><a href="/server.jsp">返回厂家端管理页面</a></td>
    </tr>
</table>
</body>
</html>
