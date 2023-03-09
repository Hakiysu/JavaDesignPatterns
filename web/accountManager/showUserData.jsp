<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    String dburl = "jdbc:mysql://localhost:3306/javasjmsdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    String dbuser = "root";
    String dbpassword = "hakiysu@MYSQLDB233";
    try {
        Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
        Statement sql = con.createStatement();
        ResultSet rs = sql.executeQuery("SELECT * FROM userdata where username = '" + session.getAttribute("username") + "'");
        out.print("<Table Border>");
        out.print("<tr>");
        out.print("<th width=100>" + "用户名");
        out.print("<th width=100>" + "密码");
        out.print("<th width=100>" + "用户类型");
        out.print("<th width=100>" + "电话号码/固话");
        out.print("<th width=100>" + "电子邮箱");
        out.print("<th width=100>" + "地址");
        out.print("</tr>");
        while (rs.next()) {
            out.print("<tr>");
            out.print("<td>" + rs.getString("username") + "</td>");
            out.print("<td>" + rs.getString("passwd") + "</td>");
            out.print("<td>" + rs.getString("accountLevel") + "</td>");
            out.print("<td>" + rs.getString("telephone") + "</td>");
            out.print("<td>" + rs.getString("email") + "</td>");
            out.print("<td>" + rs.getString("address") + "</td>");
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
