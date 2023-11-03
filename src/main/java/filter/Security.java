package filter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/admin/*")
public class Security extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (SessionAuth.checkAuthentication(request)) {
            if(SessionAuth.isAdmin(request)) {
                chain.doFilter(request, response);
            }else {
                request.getRequestDispatcher("/error/access-denied.jsp").forward(request,response);
            }
        } else {
            response.sendRedirect("/login");
        }
    }
}
