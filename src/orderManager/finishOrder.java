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
import java.sql.Statement;

@WebServlet(name = "finishOrder", value = "/finishOrder")
public class finishOrder extends HttpServlet {
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
        String orderID = request.getParameter("orderID");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
            Statement sql = con.createStatement();
            String updateSql = null;
            String orderStatus="已签收";
            updateSql = "update orderstatus set orderStatus = '" + orderStatus +  "' where orderID = '" + orderID + "'";
            sql.executeUpdate(updateSql);
            out.print("<script language='javascript'>alert('订单操作已提交！');window.location.href='/serverFrame/orderManager.jsp';</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
