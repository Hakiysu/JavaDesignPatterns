<%@ page import="java.sql.*" %>
<%@ page import="java.io.StringReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>仓库货物管理系统-用户端-新建订单</title>
</head>
<body>
<table align="center" border="1"  width="1280" height="720">
    <tr>
        <th>厂家仓库</th>
        <th>新建订单详情</th>
    </tr>
    <tr>
        <td  width="1280">
            <%@ include file="/clientFrame/checkFactoryRepo.jsp" %>
        </td>
        <td width="1280">
            <%---make new order---%>
            <p>警告：订单提交后无法撤销，请谨慎操作！</p>
            <form action="/makeOrder" method="post">
                <table>
                    <tr>
                        <td width="100">物品ID</td>
                        <td><input type="text" name="orderID" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100">购买数量</td>
                        <td><input type="text" name="orderNum" value=""/></td>
                    </tr>
                    <tr>
                        <td width="100">配送方式</td>
                        <td>
                            <input type="radio" name="orderSendMethod" value="1">自提<br>
                            <input type="radio" name="orderSendMethod" value="2">配送
                        </td>
                    </tr>
                    <input type="hidden" name="username" value="<%=session.getAttribute("username")%>"/>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="下单"></td>
                    </tr>
                    
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center"><a href="/client.jsp">返回用户端管理页面</a></td>
    </tr>
</table>

</body>
</html>
