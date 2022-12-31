<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Hakiysu
  Date: 2022/12/31
  Time: 4:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>仓库货物管理系统-厂家端-订单管理</title>
</head>
<body>
<table align="center" border="1" width="1280" height="720">
    <tr>
        <th>现有订单</th>
        <th>订单管理</th>
    </tr>
    <tr>
        <td rowspan="3" width="1280">
            <%@ include file="checkServerOrder.jsp" %>
        </td>
    <tr>
        <td width="640">
            <form action="/updateOrder" method="post">
                <h2>订单更新</h2>
                <table>
                    <tr>
                        <td width="100">订单号</td>
                        <td><input type="text" name="orderID" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100">订单状态</td>
                        <td>
                            <input type="radio" name="orderStatus" value="已接单">已接单<br>
                            <input type="radio" name="orderStatus" value="已发货">已发货<br>
                        </td>
                    </tr>
                    <tr>
                        <td width="100">物流单号</td>
                        <td><input type="text" name="trackingNumber" value=""/></td>
                    </tr>
                    <input type="hidden" name="username" value="<%=session.getAttribute("username")%>"/>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="提交"></td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
    </tr>
    </tr>
    <tr>
        <td colspan="2" align="center"><a href="/server.jsp">返回服务端管理页面</a></td>
    </tr>
</table>
</body>
</html>
