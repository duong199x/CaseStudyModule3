package controller;

import filter.SesionAuth;
import model.User;
import services.IService.IUserService;
import services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminLoginController", value = "/login")
public class AdminLoginController extends HttpServlet {
    IUserService<User> userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "login";
        }
        switch (action) {
            case "login":
                if (SesionAuth.chekAdmin(request)) {
                    response.sendRedirect("/admin/product?action=admin");
                } else {
                    request.getRequestDispatcher("admin/login.jsp").forward(request, response);
                }
                break;
            case "logout":
                doLogout(request,response);
                break;
            default:
                response.sendRedirect("/notfound");
        }

    }
    private void doLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        if (session != null) {
            if (session.getAttribute("adminAuth") !=null){
                session.removeAttribute("adminAuth");
            }
        }
        response.sendRedirect("/login");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = checkLogin(email, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("adminAuth", user.getEmail());
            session.setAttribute("adminName", user.getNickname());
            response.sendRedirect("/admin/product?action=admin");
        } else {
            request.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác!");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }

    private User checkLogin(String email, String password) {
        User user = userService.findByEmail(email);
        if (user != null) {
            if (user.getPassword().equals(password) && user.getRole() == 1) {
                return user;
            }
        }
        return null;
    }
}