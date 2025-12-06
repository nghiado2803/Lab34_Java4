package Servlet;

import Entity.User;
import Entity.Video;
import Entity.Favorite;
import DAOImpl.FavoriteDAOImpl;
import DAOImpl.VideoDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Date;

@WebServlet("/video/like")
public class LikeServlet extends HttpServlet {

    private final FavoriteDAOImpl favoriteDAO = new FavoriteDAOImpl();
    private final VideoDAOImpl videoDAO = new VideoDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        String videoId = req.getParameter("id"); // videoId từ URL

        if (currentUser == null) {
            // Chưa đăng nhập → đuổi về login (AuthFilter sẽ lo, nhưng vẫn xử lý an toàn)
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        if (videoId == null || videoId.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/video/list");
            return;
        }

        // Lấy đối tượng Video từ DB
        Video video = videoDAO.findById(videoId);
        if (video == null) {
            resp.sendRedirect(req.getContextPath() + "/video/list");
            return;
        }

        // Kiểm tra xem user đã like video này chưa (tránh like trùng)
        Favorite existing = favoriteDAO.findSingleByNamedQuery(
                "Favorite.findByUserAndVideo",
                "userId", currentUser.getId(),
                "videoId", videoId
        );

        if (existing == null) {
            // Tạo mới Favorite
            Favorite favorite = new Favorite();
            favorite.setUser(currentUser);     // Dùng object User
            favorite.setVideo(video);          // Dùng object Video
            favorite.setLikeDate(new Date());

            favoriteDAO.insert(favorite);
        }
        // Nếu đã like rồi thì không làm gì (hoặc có thể thông báo "Đã thích trước đó")

        // Quay lại trang chi tiết video
        resp.sendRedirect(req.getContextPath() + "/video/detail?id=" + videoId);
    }
}