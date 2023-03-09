package account;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

@WebServlet(name = "updateUserData", value = "/updateUserData")
public class updateUserData extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("GBK");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String dburl = "jdbc:mysql://localhost:3306/javasjmsdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String dbuser = "root";
        String dbpassword = "hakiysu@MYSQLDB233";
        //get data from user
        String username = (String) session.getAttribute("username");
        String password = request.getParameter("passwd");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String address = request.getParameter("address");
        String accountLevel = request.getParameter("accountLevel");
        String[] editData = {password, email, telephone, address};
        String sql = "update userdata set ";
        if (!editData[0].equals("")) {
            sql += "passwd = '" + editData[0] + "', ";
        }
        if (!editData[1].equals("")) {
            sql += "email = '" + editData[1] + "', ";
        }
        if (!editData[2].equals("")) {
            sql += "telephone = '" + editData[2] + "', ";
        }
        if (!editData[3].equals("")) {
            sql += "address = '" + editData[3] + "', ";
        }
        sql = sql.substring(0, sql.length() - 2);
        sql += " where username = '" + username + "'";
        System.out.println(sql);
        try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword); Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
            if (accountLevel.equals("1")) {
                out.print("<script language='javascript'>alert('修改成功！');window.location.href='/client.jsp';</script>");
            }
            if (accountLevel.equals("2")) {
                out.print("<script language='javascript'>alert('修改成功！');window.location.href='/server.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        out.flush();
    }
}
