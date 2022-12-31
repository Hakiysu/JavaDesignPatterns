<%--
  Created by IntelliJ IDEA.
  User: Hakiysu
  Date: 2022/12/31
  Time: 8:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table align="center" border="1" width="1280" height="720">
  <tr>
    <th>已发货订单</th>
    <th>订单管理</th>
  </tr>
  <tr>
    <td rowspan="3" width="1280">
      <%@ include file="allSendingOrder.jsp" %>
    </td>
  <tr>
    <td width="640">
      <form action="/finishOrder" method="post">
        <h2>订单更新</h2>
        <table>
          <tr>
            <td width="100">订单号</td>
            <td><input type="text" name="orderID" value=""/>
            </td>
          </tr>
          <input type="hidden" name="username" value="<%=session.getAttribute("username")%>"/>
          <tr>
            <td colspan="2" align="center"><input type="submit" value="确认签收"></td>
          </tr>
        </table>
      </form>
    </td>
  </tr>
  <tr>
  </tr>
  </tr>
  <tr>
    <td colspan="2" align="center"><a href="/client.jsp">返回用户端管理页面</a></td>
  </tr>
</table>
</body>
</html>
