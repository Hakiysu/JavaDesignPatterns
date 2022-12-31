package repoManager;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Date;

@WebServlet(name = "updateRepo", value = "/updateRepo")
public class updateRepo extends HttpServlet {
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
        String goodID = request.getParameter("goodID");
        String goodAmount = request.getParameter("goodAmount");
        String goodPrice = request.getParameter("goodPrice");
        String goodLastEditTime = String.valueOf(new Date());
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
            Statement sql = con.createStatement();
            String updateSql = "update goodstatus set goodAmount = '" + goodAmount + "', goodPrice = '" + goodPrice + "', goodLastEditTime = '" + goodLastEditTime + "' where goodID = '" + goodID + "'";
            sql.executeUpdate(updateSql);
            out.print("<script language='javascript'>alert('仓库操作已提交！');window.location.href='/serverFrame/repoManager.jsp';</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
