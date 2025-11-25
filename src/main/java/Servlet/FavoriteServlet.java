package Servlet;

import DAO.UserDAO;
import DAO.UserDAOImpl;
import Entity.User;
import Entity.Favorite;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/favorite")
public class FavoriteServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy user-id từ tham số request hoặc từ session
        String userId = request.getParameter("userId");
        if (userId == null) {
            userId = (String) request.getSession().getAttribute("userId"); // Nếu không có từ request thì lấy từ session
        }

        if (userId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID is required.");
            return;
        }

        // Tìm kiếm User theo ID
        User user = userDAO.findById(userId);

        if (user != null) {
            // Đưa đối tượng User vào request
            request.setAttribute("user", user);

            // Lấy danh sách các video yêu thích của người dùng
            List<Favorite> favorites = user.getFavorites();
            request.setAttribute("favorites", favorites);

            // Chuyển tiếp đến trang JSP
            request.getRequestDispatcher("/views/favorite.jsp").forward(request, response);
        } else {
            // Xử lý khi không tìm thấy người dùng
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy người dùng này.");
        }
    }
}
