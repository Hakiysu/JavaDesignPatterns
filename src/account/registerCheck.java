package account;

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
import java.util.Objects;

@WebServlet(name = "registerCheck", value = "/registerCheck")
public class registerCheck extends HttpServlet {
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
        //get username and password from loginFrame
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String accountLevel = request.getParameter("accountLevel");
        String telephone = request.getParameter("telephone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        if (!Objects.equals(password, password2)) {
            out.print("<script language='javascript'>alert('两次密码不一致！即将跳转回注册页面。');window.location.href='/accountManager/register.html';</script>");
        }
        else {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
                Statement stmt = conn.createStatement();
                String sql = "select * from userdata where username='" + username + "'";
                ResultSet rs = stmt.executeQuery(sql);
                if (rs.next()) {
                    out.print("<script language='javascript'>alert('用户名已存在！即将跳转回注册页面。');window.location.href='/accountManager/register.html';</script>");
                }
                else {
                    sql = "insert into userdata(username,passwd,accountLevel,telephone,email,address) values('" + username + "','" + password + "','" + accountLevel + "','" + telephone + "','" + email + "','" + address + "')";
                    stmt.executeUpdate(sql);
                    out.print("<script language='javascript'>alert('注册成功！即将跳转至主页进行登录。');window.location.href='/index.jsp';</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        out.flush();
    }
}
