package Servlet;

import Entity.User;
import DAOImpl.UserDAOImpl;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/account/edit-profile")
public class EditProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/account/edit-profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("currentUser");

        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");

        user.setFullname(fullname);
        user.setEmail(email);
        new UserDAOImpl().update(user);

        session.setAttribute("currentUser", user);
        req.setAttribute("message", "Cập nhật hồ sơ thành công!");

        req.getRequestDispatcher("/views/account/edit-profile.jsp").forward(req, resp);
    }
}