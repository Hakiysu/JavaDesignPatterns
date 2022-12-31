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
    <title>仓库货物管理系统-厂家端-仓库管理</title>
</head>
<body>
<table align="center" border="1" width="1280" height="720">
    <tr>
        <th>厂家个人仓库</th>
        <th>仓库管理</th>
    </tr>
    <tr>
        <td rowspan="4" width="1280">
            <%
                String dburl = "jdbc:mysql://localhost:3306/javasjmsdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
                String dbuser = "root";
                String dbpassword = "hakiysu@MYSQLDB233";
                try {
                    Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
                    Statement sql = con.createStatement();
                    ResultSet rs = sql.executeQuery("SELECT * FROM goodstatus where goodFactory='" + session.getAttribute("username") + "'");
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
        </td>
    </tr>
    <tr>
        <td width="640">
            <form action="/makeNewRepo" method="post">
                <h2>新建仓库</h2>
                <table>
                    <tr>
                        <td width="100">物品名称</td>
                        <td><input type="text" name="goodName" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100">物品数量</td>
                        <td><input type="text" name="goodAmount" value=""/></td>
                    </tr>
                    <tr>
                        <td width="100">物品价格</td>
                        <td><input type="text" name="goodPrice" value=""/></td>
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
        <td width="640">
            <%---make new order---%>
            <form action="/updateRepo" method="post">
                <h2>更新仓库</h2>
                <table>
                    <tr>
                        <td width="100">仓库ID</td>
                        <td><input type="text" name="goodID" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100">变更数量为</td>
                        <td><input type="text" name="goodAmount" value=""/></td>
                    </tr>
                    <tr>
                        <td width="100">变更价格为</td>
                        <td><input type="text" name="goodPrice" value=""/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="提交"></td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td width="640">
            <%---make new order---%>
            <form action="/deleteRepo" method="post">
                <h2>删除仓库</h2>
                <table>
                    <tr>
                        <td width="100">仓库ID</td>
                        <td><input type="text" name="goodID" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="提交"></td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    </tr>
    <tr>
        <td colspan="2" align="center"><a href="/server.jsp">返回服务端管理页面</a></td>
    </tr>
</table>
</body>
</html>
