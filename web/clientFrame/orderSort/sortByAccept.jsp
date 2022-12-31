<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Hakiysu
  Date: 2022/12/31
  Time: 7:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>仓库货物管理系统-用户端-订单查询-已接单</title>
</head>
<body>
<table align="center" border="1" width="1280" height="720">
    <tr>
        <th height="50">
            <%@ include file="../topFunc.jsp" %>
        </th>
    </tr>
    <tr>
        <td align="center">
            <p>订单查询-已接单</p>
            <%
                String dburl = "jdbc:mysql://localhost:3306/javasjmsdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
                String dbuser = "root";
                String dbpassword = "hakiysu@MYSQLDB233";
                String content = "已接单";
                try {
                    Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
                    Statement sql = con.createStatement();
                    ResultSet rs = sql.executeQuery("SELECT * FROM orderstatus where orderMaker='" + session.getAttribute("username") + "'and orderStatus like '" + content + "%'");
                    out.print("<Table Border>");
                    out.print("<tr>");
                    out.print("<th width=100>" + "订单号");
                    out.print("<th width=100>" + "下单用户");
                    out.print("<th width=100>" + "承接商");
                    out.print("<th width=100>" + "订单内容");
                    out.print("<th width=100>" + "订单状态");
                    out.print("<th width=100>" + "订单配送方式");
                    out.print("<th width=100>" + "订单配送地址");
                    out.print("</tr>");
                    while (rs.next()) {
                        out.print("<tr>");
                        out.print("<td>" + rs.getString("orderID") + "</td>");
                        out.print("<td>" + rs.getString("orderMaker") + "</td>");
                        out.print("<td>" + rs.getString("orderReceiveFactory") + "</td>");
                        out.print("<td>" + rs.getString("orderContent") + "</td>");
                        out.print("<td>" + rs.getString("orderStatus") + "</td>");
                        out.print("<td>" + rs.getString("orderSendMethod") + "</td>");
                        out.print("<td>" + rs.getString("orderSendAddress") + "</td>");
                        out.print("</tr>");
                    }
                    out.print("</Table>");
                    con.close();
                } catch (SQLException e) {
                    out.print("Error" + e);
                }
            %></td>
    </tr>
    <tr>
        <td colspan="2" align="center" height="50"><a href="/client.jsp">返回用户端管理页面</a></td>
    </tr>
</table>
</body>
</html>
