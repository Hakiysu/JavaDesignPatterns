package repoManager;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Date;

@WebServlet(name = "deleteRepo", value = "/deleteRepo")
public class deleteRepo extends HttpServlet {
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
        String goodID = request.getParameter("goodID");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
            Statement sql = con.createStatement();
            sql.executeUpdate("delete from goodstatus where goodID = '" + goodID + "'");
            out.print("<script language='javascript'>alert('仓库操作已提交！');window.location.href='/serverFrame/repoManager.jsp';</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
