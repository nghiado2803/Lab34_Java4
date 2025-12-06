package Servlet;

import DAOImpl.VideoDAOImpl;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/video/list")
public class VideoListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("videos", new VideoDAOImpl().findAll());
        req.getRequestDispatcher("/views/video-list.jsp").forward(req, resp);
    }
}