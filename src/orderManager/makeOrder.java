package orderManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

@WebServlet(name = "makeOrder", value = "/makeOrder")
public class makeOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("GBK");
        PrintWriter out = response.getWriter();
        String dburl = "jdbc:mysql://localhost:3306/javasjmsdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String dbuser = "root";
        String dbpassword = "hakiysu@MYSQLDB233";
        //get the order information from the request
        String orderNum = request.getParameter("orderNum");
        String orderSendMethodChoice = request.getParameter("orderSendMethod");
        String username = request.getParameter("username");
        //send the order information to the database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
            Statement sql = con.createStatement();
            String searchID = request.getParameter("orderID");//searchID is repo id
            String userInfSql = "select * from userdata where username = '" + username + "'";
            ResultSet rs2 = sql.executeQuery(userInfSql);
            String userAddress = "";
            while (rs2.next()) {
                userAddress = rs2.getString("address");
            }
            String orderSendMethod = null;
            if (orderSendMethodChoice.equals("1")) {
                orderSendMethod = "自提";
                userAddress="";
            }
            else if (orderSendMethodChoice.equals("2")) {
                orderSendMethod = "配送";
            }
            String goodName = null, goodFactory = null;
            int goodAmount = 0;
            int orderIntNum = Integer.parseInt(orderNum);
            ResultSet rs = sql.executeQuery("select * from goodstatus where goodID = '" + searchID + "'");
            while (rs.next()) {
                goodName = rs.getString("goodName");
                goodFactory = rs.getString("goodFactory");
                goodAmount = Integer.parseInt(rs.getString("goodAmount"));
            }
            String updateRepo = "update goodstatus set goodAmount =" + (goodAmount - orderIntNum) + " where goodID = '" + searchID + "'";
            sql.executeUpdate(updateRepo);
            String time = String.valueOf(System.currentTimeMillis());
            Random random = new Random();
            int randN = random.nextInt(100000);
            String oid = time + String.format("%06d",randN);
            String orderSQL = "insert into orderstatus( orderID, orderMaker, orderReceiveFactory, orderContent, orderStatus,orderSendMethod,orderSendAddress) values('" + oid + "','" + username + "','" + goodFactory + "','" + goodName + "x" + orderNum + "','已下单','" + orderSendMethod + "','" + userAddress + "')";
            sql.executeUpdate(orderSQL);
            out.print("<script language='javascript'>alert('订单已提交！跳转到新建订单页面继续下单。');window.location.href='/clientFrame/makeNewOrder.jsp';</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
