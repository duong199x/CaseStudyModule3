package controller;

import filter.SessionAuth;
import model.User;
import services.IService.IUserService;
import services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminLoginController", value = "/login")
public class LoginController extends HttpServlet {
    IUserService<User> userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "login";
        }
        switch (action) {
            case "login":
                if (SessionAuth.checkAuthentication(request)) {
                    if (SessionAuth.isAdmin(request)) {
                        response.sendRedirect("/admin/product?action=admin");
                    } else {
                        response.sendRedirect("/product/home.jsp");
                    }
                } else {
                    request.getRequestDispatcher("user/login.jsp").forward(request, response);
                }
                break;
            case "register":

                break;
            case "logout":
                doLogout(request, response);
                break;
            default:
                response.sendRedirect("/notfound");
        }

    }

    private void doLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        if (session != null) {
            if (session.getAttribute("authentication") != null) {
                session.removeAttribute("authentication");
                session.removeAttribute("nickname");
                session.removeAttribute("role");
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
            session.setAttribute("authentication", user.getEmail());
            session.setAttribute("nickname", user.getNickname());

            if (user.getRole() == 1) {
                session.setAttribute("role", "admin");
                response.sendRedirect("/admin/product?action=admin");
            } else {
                session.setAttribute("role", "user");
                response.sendRedirect("/product/home.jsp");
            }
        } else {
            request.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác!");
            request.getRequestDispatcher("/user/login.jsp").forward(request, response);
        }
    }

    private User checkLogin(String email, String password) {
        User user = userService.findByEmail(email);
        if (user != null) {
            if (user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }
}