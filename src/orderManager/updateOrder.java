package orderManager;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

@WebServlet(name = "updateOrder", value = "/updateOrder")
public class updateOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("GBK");
        PrintWriter out = response.getWriter();
        String dburl = "jdbc:mysql://localhost:3306/javasjmsdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String dbuser = "root";
        String dbpassword = "hakiysu@MYSQLDB233";
        //get the order information from the request
        String orderID = request.getParameter("orderID");
        String orderStatus = request.getParameter("orderStatus");
        String trackingNumber = request.getParameter("trackingNumber");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
            Statement sql = con.createStatement();
            String updateSql = null;
            if (orderStatus.equals("已接单")) {
                updateSql = "update orderstatus set orderStatus = '" + orderStatus + "' where orderID = '" + orderID + "'";
            }
            else if (orderStatus.equals("已发货")) {
                updateSql = "update orderstatus set orderStatus = '" + orderStatus + ":" + trackingNumber + "' where orderID = '" + orderID + "'";
            }
            sql.executeUpdate(updateSql);
            out.print("<script language='javascript'>alert('订单操作已提交！');window.location.href='/serverFrame/orderManager.jsp';</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
