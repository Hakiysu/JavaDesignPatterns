<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<HTML>
<BODY>
<% //获取提交的姓名：
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    if (name == null) {
        name = "";
    }
    Connection con = null;
    Statement sql = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
    }
    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?&useSSL=false&serverTimezone=UTC", "root", "hakiysu@MYSQLDB233");
        sql = con.createStatement();
        System.out.println(name);
        String condition = "SELECT * FROM userdata WHERE xm = " + "'" + name + "'";
        System.out.println(condition);
        rs = sql.executeQuery(condition);
        while (rs.next()) {
            out.print("<TR>");
            out.print("<TD >" + rs.getString(1) + "</TD>");
            out.print("<TD >" + rs.getString(2) + "</TD>");
            out.print("<TD >" + rs.getInt("czxt") + "</TD>");
            out.print("<TD >" + rs.getInt("wjyl") + "</TD>");
            out.print("<TD >" + rs.getInt("sjjg") + "</TD>");
            out.print("</TR>");
        }
        con.close();
    } catch (SQLException e) {
    }
%>
</BODY>
</HTML>