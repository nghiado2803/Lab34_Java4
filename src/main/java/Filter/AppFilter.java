package Filter;

import Entity.Logs;
import Entity.User;
import DAOImpl.LogsDAOImpl;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")  // Áp dụng cho tất cả các request
public class AppFilter implements Filter {

    private final LogsDAOImpl logsDAO = new LogsDAOImpl();

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpReq = (HttpServletRequest) request;

        // Lấy thông tin cần ghi log
        String url = httpReq.getRequestURI();
        String contextPath = httpReq.getContextPath();
        String path = url.substring(contextPath.length()); // ví dụ: /home, /login, /detail

        HttpSession session = httpReq.getSession(false);
        String username = null;

        if (session != null) {
            User user = (User) session.getAttribute("currentUser");
            if (user != null) {
                username = user.getId(); // Id là username trong DB
            }
        }

        // Ghi log vào CSDL
        Logs log = new Logs(path, username);
        logsDAO.insert(log);

        // Tiếp tục xử lý request
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) {}

    @Override
    public void destroy() {}
}