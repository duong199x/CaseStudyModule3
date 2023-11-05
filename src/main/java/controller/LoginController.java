package controller;

import filter.SessionAuth;
import model.User;
import services.IService.IUserService;
import services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

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
                getLogin(request, response);
                break;
            case "register":
                request.getRequestDispatcher("user/register.jsp").forward(request, response);
                break;
            case "logout":
                doLogout(request, response);
                break;
            default:
                response.sendRedirect("/notfound");
        }

    }

    private static void getLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (SessionAuth.checkAuthentication(request)) {
            if (SessionAuth.isAdmin(request)) {
                response.sendRedirect("/admin/product?action=admin");
            } else {
                response.sendRedirect("/home");
            }
        } else {
            request.getRequestDispatcher("user/login.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        if (action.equals("login")) {
            doLogin(request, response);
        }
        if(action.equals("register")){
            doRegister(request, response);
        }
    }

    private void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
                response.sendRedirect("/home");
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
    private void doRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String nickname= request.getParameter("nickname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        if(checkEmail(email)){
            request.setAttribute("error", "Email đã được sử dụng");
            request.getRequestDispatcher("user/register.jsp").forward(request, response);
        }
        if (checkPhone(phone)){
            request.setAttribute("error", "Số điện thoại đã được sử dụng");
            request.getRequestDispatcher("user/register.jsp").forward(request, response);
        }
        userService.add(new User(email, password,nickname,phone,address));
        request.setAttribute("message", "Đăng ký thành công");
        request.getRequestDispatcher("user/login.jsp").forward(request, response);
    }
    private boolean checkEmail(String email){
        return userService.findByEmail(email) != null;
    }
    private boolean checkPhone(String phone){
        List<User> users = userService.findAll();
        for ( User user : users ) {
           if (user.getPhone().equals(phone)){
               return true;
           }
        }
        return false;
    }
}