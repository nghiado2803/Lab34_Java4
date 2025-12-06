package Filter;

import Entity.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter({
        "/admin/*",
        "/account/change-password",
        "/account/edit-profile",
        "/video/like/*",
        "/video/share/*"
})
public class AuthFilter implements Filter {

    private static final String SECURITY_URI = "/login"; // ← bạn dùng /login thì để là /login

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        // Lấy session, KHÔNG tạo mới nếu chưa có
        HttpSession session = req.getSession(false);

        // NẾU CHƯA CÓ SESSION HOẶC USER CHƯA ĐĂNG NHẬP → ĐUỔI VỀ LOGIN
        if (session == null || session.getAttribute("currentUser") == null) {
            // Lưu lại URL hiện tại để quay lại sau khi login thành công
            String query = req.getQueryString();
            String returnUrl = req.getRequestURI() + (query != null ? "?" + query : "");
            req.getSession(true).setAttribute("returnUrl", returnUrl);

            resp.sendRedirect(req.getContextPath() + SECURITY_URI);
            return;
        }

        User user = (User) session.getAttribute("currentUser");

        // Kiểm tra quyền vào trang /admin/*
        String uri = req.getRequestURI();
        if (uri.startsWith(req.getContextPath() + "/admin/") && !user.isAdmin()) {
            resp.sendRedirect(req.getContextPath() + "/video/list");
            return;
        }

        // Cho đi tiếp
        chain.doFilter(request, response);
    }
}