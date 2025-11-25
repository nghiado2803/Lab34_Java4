package Servlet;


import DAO.FavoriteDAO;
import DAO.FavoriteDAOImpl;
import Entity.Favorite;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/favorite-list")
public class FavoriteListServlet extends HttpServlet {

    // Khởi tạo DAO
    private FavoriteDAO favoriteDAO = new FavoriteDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 1. Khai thác thực thể kết hợp: List<Favorite> favorites = FavoriteDAO.findAll()
            List<Favorite> favorites = favoriteDAO.findAll();

            // 2. Đặt danh sách vào request để chuyển sang JSP
            request.setAttribute("favorites", favorites);

            // 3. Chuyển hướng sang trang JSP để hiển thị
            request.getRequestDispatcher("/views/favorite-list.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Không thể tải danh sách video yêu thích: " + e.getMessage());
        }
    }
}