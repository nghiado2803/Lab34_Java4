package Filter;

import jakarta.servlet.*;
import java.io.IOException;

public class Filter1 implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        // Viết mã yêu cầu đề bài
        request.setAttribute("hello", "Tôi là filter 1");

        System.out.println("[Filter1] req.setAttribute(\"hello\", \"Tôi là filter 1\");");

        // Chuyển tiếp sang filter tiếp theo
        chain.doFilter(request, response);
    }

    @Override public void init(FilterConfig filterConfig) {}
    @Override public void destroy() {}
}