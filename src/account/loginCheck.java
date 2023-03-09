package account;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "loginCheck", value = "/loginCheck")
public class loginCheck extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("GBK");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String dburl = "jdbc:mysql://localhost:3306/javasjmsdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String dbuser = "root";
        String dbpassword = "hakiysu@MYSQLDB233";
        //get username and password from loginFrame
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String sql = "select*from userdata " + "where username='" + username + "' and passwd ='" + password + "'";
        int accountLevel = 0;
        try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            //如果查询的ResultSet里有超过一条的记录，则登入成功
            if (rs.next()) {
                //0 not exist, 1 client, 2 factory, 3 admin
                accountLevel = rs.getInt("accountLevel");
            }
            System.out.println(accountLevel);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (accountLevel == 0) {
            out.print("<script language='javascript'>alert('登录失败！用户不存在或者密码错误。');window.location.href='/index.jsp';</script>");
        }
        else if (accountLevel == 1) {
            session.setAttribute("username", username);
            session.setAttribute("accountLevel", accountLevel);
            out.print("<script language='javascript'>alert('登录成功！即将跳转至用户端。');window.location.href='/client.jsp';</script>");
        }
        else if (accountLevel == 2) {
            session.setAttribute("username", username);
            session.setAttribute("accountLevel", accountLevel);
            out.print("<script language='javascript'>alert('登录成功！即将跳转至厂家端。');window.location.href='/server.jsp';</script>");
        }
        out.flush();
    }
}
