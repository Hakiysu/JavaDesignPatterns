package account;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "exit", value = "/exit")
public class exit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取session对象
        HttpSession session = request.getSession();
        //销毁session
        session.invalidate();
        //重定向到登入界面
        response.sendRedirect("index.jsp");
    }
}
