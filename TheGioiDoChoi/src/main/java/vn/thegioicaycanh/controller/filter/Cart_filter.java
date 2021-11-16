package vn.thegioicaycanh.controller.filter;

import org.apache.http.HttpRequest;
import vn.thegioicaycanh.model.user.Cart;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "Cart_filter")
public class Cart_filter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request1 = (HttpServletRequest) request;
        HttpSession session = request1.getSession(false);
        System.out.println("Co dang vao cart_filter");
        if (session == null) {
            System.out.println("co vo cart_filter session==null");
             session =request1.getSession();
            session.setAttribute("cart", new Cart());
        }
//        try {
            chain.doFilter(request, response);
//        } catch (NullPointerException e) {
//            request.getRequestDispatcher("home").forward(request, response);
//        }
    }
}
