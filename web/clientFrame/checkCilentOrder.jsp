<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户端-检查订单</title>
</head>
<body>
<table align="center" border="1" width="1280" height="720">
    <tr>
        <th height="50"><%@ include file="topFunc.jsp" %></th>
    </tr>
    <tr>
        <td align="center" >
            <%@ include file="allOrder.jsp" %>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center" height="50"><a href="/client.jsp">返回用户端管理页面</a></td>
    </tr>
</table>
</body>
</html>
