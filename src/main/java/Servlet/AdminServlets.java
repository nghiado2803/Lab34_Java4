package Servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet({
        "/admin/video",
        "/admin/user",
        "/admin/favorite",
        "/admin/share"
})
public class AdminServlets extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        String page = uri.substring(uri.lastIndexOf("/") + 1) + ".jsp";
        req.getRequestDispatcher("/views/admin/" + page).forward(req, resp);
    }
}