<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>用户端-新建订单</title>
</head>
<body>
<%
  String dburl = "jdbc:mysql://localhost:3306/javasjmsdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
  String dbuser = "root";
  String dbpassword = "hakiysu@MYSQLDB233";
  try {
    Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
    Statement sql = con.createStatement();
    ResultSet rs = sql.executeQuery("SELECT * FROM goodstatus");
    out.print("<Table Border>");
    out.print("<tr>");
    out.print("<th width=100>" + "物品ID");
    out.print("<th width=100>" + "物品名称");
    out.print("<th width=100>" + "厂家");
    out.print("<th width=100>" + "价格");
    out.print("<th width=100>" + "剩余数量");
    out.print("<th width=100>" + "上次更新时间");
    out.print("</tr>");
    while (rs.next()) {
      out.print("<tr>");
      out.print("<td>" + rs.getString("goodID") + "</td>");
      out.print("<td>" + rs.getString("goodName") + "</td>");
      out.print("<td>" + rs.getString("goodFactory") + "</td>");
      out.print("<td>" + rs.getString("goodPrice") + "</td>");
      out.print("<td>" + rs.getString("goodAmount") + "</td>");
      out.print("<td>" + rs.getString("goodLastEditTime") + "</td>");
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
