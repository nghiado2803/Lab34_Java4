package Servlet;

import DAOImpl.VideoDAOImpl;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/video/detail")
public class VideoDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null) {
            req.setAttribute("video", new VideoDAOImpl().findById(id));
        }
        req.getRequestDispatcher("/views/video-detail.jsp").forward(req, resp);
    }
}