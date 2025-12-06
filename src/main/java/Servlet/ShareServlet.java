package Servlet;

import DAOImpl.VideoDAOImpl;
import DAOImpl.ShareDAOImpl;
import Entity.User;
import Entity.Video;
import Entity.Share;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Date;

@WebServlet("/video/share")
public class ShareServlet extends HttpServlet {

    private final VideoDAOImpl videoDAO = new VideoDAOImpl();
    private final ShareDAOImpl shareDAO = new ShareDAOImpl();

    // Hiển thị form chia sẻ
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String videoId = req.getParameter("id");
        if (videoId == null || videoId.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/video/list");
            return;
        }

        Video video = videoDAO.findById(videoId);
        if (video == null) {
            resp.sendRedirect(req.getContextPath() + "/video/list");
            return;
        }

        req.setAttribute("video", video);
        req.getRequestDispatcher("/views/share-video.jsp").forward(req, resp);
    }

    // Xử lý khi người dùng bấm "Gửi"
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        // Kiểm tra đăng nhập
        if (currentUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String videoId = req.getParameter("videoId");
        String emails = req.getParameter("emails");

        if (videoId == null || emails == null || emails.trim().isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập email nhận!");
        } else {
            Video video = videoDAO.findById(videoId);
            if (video != null) {
                Share share = new Share();
                share.setUser(currentUser);      // Dùng object User
                share.setVideo(video);           // Dùng object Video
                share.setEmails(emails.trim());
                share.setShareDate(new Date());

                shareDAO.insert(share);
                req.setAttribute("message", "Chia sẻ video thành công!");
            } else {
                req.setAttribute("error", "Video không tồn tại!");
            }
        }

        // Load lại video để hiển thị
        req.setAttribute("video", videoDAO.findById(videoId));
        req.getRequestDispatcher("/views/share-video.jsp").forward(req, resp);
    }
}