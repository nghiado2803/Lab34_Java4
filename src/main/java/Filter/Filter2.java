package Filter;

import jakarta.servlet.*;
import java.io.IOException;

public class Filter2 implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        // In ra giá trị do Filter1 đặt
        String msg = (String) request.getAttribute("hello");
        System.out.println("[Filter2] System.out.print] " + msg);

        // Chuyển tiếp (nếu có filter khác hoặc servlet)
        chain.doFilter(request, response);
    }

    @Override public void init(FilterConfig filterConfig) {}
    @Override public void destroy() {}
}