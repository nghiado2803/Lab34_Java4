package Servlet;

import DAO.UserDAO;
import DAOImpl.UserDAOImpl;
import Entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idOrEmail = req.getParameter("idOrEmail");
        String password = req.getParameter("password");

        // Validate rỗng
        if (idOrEmail == null || idOrEmail.trim().isEmpty() || password == null || password.isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
            return;
        }

        // Tìm user bằng Id trước → không thấy thì tìm bằng Email
        User user = userDAO.findByIdOrEmail(idOrEmail.trim());

        if (user == null || !user.getPassword().equals(password)) {
            req.setAttribute("error", "Sai tên đăng nhập/Email hoặc mật khẩu!");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
            return;
        }

        // ĐĂNG NHẬP THÀNH CÔNG
        HttpSession session = req.getSession();
        session.setAttribute("currentUser", user);
        session.setAttribute("userId", user.getId());

        // QUAN TRỌNG: QUAY LẠI TRANG NGƯỜI DÙNG ĐANG CỐ TRUY CẬP TRƯỚC KHI BỊ CHẶN
        String returnUrl = (String) session.getAttribute("returnUrl");
        if (returnUrl != null && !returnUrl.isEmpty() && !returnUrl.contains("/login")) {
            session.removeAttribute("returnUrl");  // xóa để không bị lặp
            resp.sendRedirect(returnUrl);
            return;
        }

        // Nếu không có trang cũ → về trang yêu thích hoặc trang chủ
        resp.sendRedirect(req.getContextPath() + "/video/lists");
    }
}