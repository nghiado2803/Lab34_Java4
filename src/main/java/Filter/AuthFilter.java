package Filter;

import Entity.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebFilter({
        "/admin/*",
        "/account/change-password",
        "/account/edit-profile",
        "/video/like/*",
        "/video/share/*"
})
public class AuthFilter implements Filter {

    private static final String SECURITY_URI = "/login";  // trang đăng nhập của bạn

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);  // không tạo mới

        // Nếu chưa có session HOẶC chưa đăng nhập
        if (session == null || session.getAttribute("currentUser") == null) {

            // Lưu lại URL đang cố truy cập (có kèm query string nếu có)
            String query = req.getQueryString();
            String returnUrl = req.getRequestURI() + (query != null ? "?" + query : "");

            // Tạo session mới chỉ để lưu returnUrl
            HttpSession newSession = req.getSession(true);
            newSession.setAttribute("returnUrl", returnUrl);

            // Đuổi về trang login
            resp.sendRedirect(req.getContextPath() + SECURITY_URI);
            return;
        }

        // Đã đăng nhập → kiểm tra quyền admin
        User user = (User) session.getAttribute("currentUser");
        String uri = req.getRequestURI();

        if (uri.startsWith(req.getContextPath() + "/admin/") && !user.isAdmin()) {
            resp.sendRedirect(req.getContextPath() + "/video/list");
            return;
        }

        // Cho đi tiếp nếu mọi thứ OK
        chain.doFilter(request, response);
    }
}