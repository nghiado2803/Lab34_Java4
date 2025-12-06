package Listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

/**
 * ĐẾM LƯỢT KHÁCH TRUY CẬP – CHỈ ĐẾM 1 LẦN / NGƯỜI
 */
@WebListener
public class VisitorCounterListener implements ServletContextListener, HttpSessionListener {

    private ServletContext context;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        context = sce.getServletContext();
        // Khởi tạo biến đếm ở application scope
        context.setAttribute("visitors", 0);
        System.out.println("Khởi tạo bộ đếm khách truy cập = 0");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Dọn dẹp (không bắt buộc nhưng có để đầy đủ)
        context.removeAttribute("visitors");
        System.out.println("Ứng dụng dừng – xóa bộ đếm khách");
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        ServletContext application = session.getServletContext();

        // Lấy giá trị hiện tại (đồng bộ để tránh race condition khi nhiều người cùng vào)
        Integer count = (Integer) application.getAttribute("visitors");

        synchronized (application) {
            count = (count == null) ? 1 : count + 1;
            application.setAttribute("visitors", count);
        }

        System.out.println("Có khách mới! Tổng khách truy cập: " + count);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
    }
}