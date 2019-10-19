package ru.itis.web_project.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "KitchenAccessFilter")
public class KitchenAccessFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession(false);
        Integer accessId = (Integer) session.getAttribute("accessId");

        if (accessId == 4 || accessId == 1) {
            chain.doFilter(req, resp);
        } else {
            request.getRequestDispatcher("/jsp/404.jsp").forward(request, response);
            return;
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
