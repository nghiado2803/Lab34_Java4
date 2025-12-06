package Servlet;

import DAO.UserDAO;
import DAOImpl.UserDAOImpl;
import Entity.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private final UserDAO dao = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirm = req.getParameter("confirm");

        if (!password.equals(confirm)) {
            req.setAttribute("error", "Xác nhận mật khẩu không khớp!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        if (dao.findById(id) != null) {
            req.setAttribute("error", "ID đã tồn tại!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        if (dao.findByEmail(email) != null) {
            req.setAttribute("error", "Email đã được sử dụng!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        User user = new User(id, password, fullname, email, false);
        dao.insert(user);

        req.setAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập.");
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }
}