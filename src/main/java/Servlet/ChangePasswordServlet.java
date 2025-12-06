package Servlet;

import Entity.User;
import DAOImpl.UserDAOImpl;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/account/change-password")
public class ChangePasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/account/change-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("currentUser");

        String current = req.getParameter("current");
        String newpass = req.getParameter("newpass");
        String confirm = req.getParameter("confirm");

        if (!user.getPassword().equals(current)) {
            req.setAttribute("error", "Mật khẩu hiện tại không đúng!");
        } else if (!newpass.equals(confirm)) {
            req.setAttribute("error", "Xác nhận mật khẩu mới không khớp!");
        } else {
            user.setPassword(newpass);
            new UserDAOImpl().update(user);
            req.setAttribute("message", "Đổi mật khẩu thành công!");
        }
        req.getRequestDispatcher("/views/account/change-password.jsp").forward(req, resp);
    }
}