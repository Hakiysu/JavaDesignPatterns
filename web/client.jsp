<%--
  Created by IntelliJ IDEA.
  User: Hakiysu
  Date: 2022/12/31
  Time: 0:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>仓库货物管理系统-用户端</title>
</head>
<body>
<table align="center" width="1280" height="720" border="1">
    <tr>
        <td height="50" colspan="2">
            <h1 align="center">仓库货物管理系统-用户端</h1>
            您好，<%=session.getAttribute("username")%>，欢迎您使用仓库货物管理系统！
        </td>
    </tr>
    <tr>
        <td align="center" width="100" height="300">
            <a href="clientFrame/makeNewOrder.jsp">新建订单</a><br>
            <a href="clientFrame/checkOrder.jsp">查询订单</a><br>
        </td>
        <td align="center" width="800">
            <%@ include file="clientFrame/checkOrder.jsp" %>
        </td>
    </tr>
    <tr>
        <td height="50" colspan="2">
            Down
        </td>
    </tr>
</table>
</body>
</html>
