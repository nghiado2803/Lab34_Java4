package Servlet;

import DAO.UserDAO;
import DAO.UserDAOImpl;
import Entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idOrEmail = request.getParameter("idOrEmail");
        String password = request.getParameter("password");
        String error = null;

        User user = userDAO.findByIdOrEmail(idOrEmail);

        if (user == null || !user.getPassword().equals(password)) {
            error = "Sai tài khoản hoặc mật khẩu!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        } else {
            // Đăng nhập thành công -> lưu userId vào session
            request.getSession().setAttribute("userId", user.getId());
            response.sendRedirect(request.getContextPath() + "/favorite");
        }
    }
}