<%--
  Created by IntelliJ IDEA.
  User: Hakiysu
  Date: 2022/12/31
  Time: 0:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>仓库货物管理系统-用户端</title>
</head>
<body>
<table align="center" width="1280" height="720" border="1">
    <tr>
        <td height="50" colspan="2">
            <h1 align="center">仓库货物管理系统-用户端</h1>
            您好，<%=session.getAttribute("username")%>，欢迎您使用仓库货物管理系统！<br>
            <button onclick="myFunction()">退出</button>
            <script>
                function myFunction(){
                    var r=confirm("您确定要退出吗?");
                    if (r==true){
                        //重定向到登入界面
                        window.location.href="/exit";
                    }
                    else{
                    }
                    document.getElementById("demo").innerHTML=x;
                }
            </script>
        </td>
    </tr>
    <tr>
        <td align="center" width="100" height="300">
            <a href="clientFrame/makeNewOrder.jsp">新建订单</a><br>
            <a href="clientFrame/checkCilentOrder.jsp">查询订单</a><br>
            <a href="clientFrame/receiveGood.jsp">订单签收</a><br>
            <a href="clientFrame/editClientUserData.jsp">账户数据修改</a><br>
        </td>
        <td align="center" width="800">
            <%@ include file="clientFrame/allOrder.jsp" %>
        </td>
    </tr>
    <tr>
        <td align="center" height="50" colspan="2">
            现在是：<%=new java.util.Date()%>
        </td>
    </tr>
</table>
</body>
</html>
