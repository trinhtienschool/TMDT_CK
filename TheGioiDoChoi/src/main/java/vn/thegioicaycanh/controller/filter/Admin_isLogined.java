package vn.thegioicaycanh.controller.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Admin_isLogined implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(request, response);
        HttpServletRequest request1= (HttpServletRequest) request;
        HttpSession session = request1.getSession(false);
        System.out.println("sap chuyen den trang loadin");
        if(session.getAttribute("loginedAdmin")!=null){
            System.out.println(" co vao: sap chuyen den trang loadin");
            System.out.println("URL: "+request1.getRequestURL());
            System.out.println("query: "+request1.getQueryString());
            chain.doFilter(request, response);
        }else{
            session.invalidate();
            HttpServletResponse response1 = (HttpServletResponse) response;
            response1.sendRedirect("../home");
        }
    }
}
