<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户端-检查订单</title>
</head>
<body>
<%
    String dburl = "jdbc:mysql://localhost:3306/javasjmsdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    String dbuser = "root";
    String dbpassword = "hakiysu@MYSQLDB233";
    try {
        Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
        Statement sql = con.createStatement();
        ResultSet rs = sql.executeQuery("SELECT * FROM orderstatus where orderReceiveFactory='" + session.getAttribute("username") + "'");
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
%>
</body>
</html>
