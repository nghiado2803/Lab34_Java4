package Servlet;

import DAO.VideoDAO;
import DAO.VideoDAOImpl;
import Entity.Video;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/search-video")
public class VideoSearchServlet extends HttpServlet {

    private VideoDAO videoDAO = new VideoDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Video> list = null;
        if (keyword != null && !keyword.trim().isEmpty()) {
            list = videoDAO.searchByTitle(keyword);
        }
        request.setAttribute("videos", list);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("/views/searchVideo.jsp").forward(request, response);
    }
}