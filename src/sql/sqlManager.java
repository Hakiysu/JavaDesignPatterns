package sql;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "sqlManager", value = "/sqlManager")
public class sqlManager extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //search name by id
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dburl = "jdbc:mysql://localhost:3306/javasjmsdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
            String dbuser = "root";
            String dbpassword = "hakiysu@MYSQLDB233";
            Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
            Statement sql = con.createStatement();


            String searchID = request.getParameter("goodID");
            ResultSet rs = sql.executeQuery("select * from goodstatus where goodID = '" + request.getParameter("goodID") + "'");
            String goodName = "";
            while (rs.next()) {
                goodName = rs.getString("goodName");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
