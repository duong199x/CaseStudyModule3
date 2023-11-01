package controller;

import filter.SesionAuth;
import model.User;
import services.IService.IUserService;
import services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UserController", value = "/user")
public class UserController extends HttpServlet {
    private IUserService<User> userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "login";
        }
        switch (action) {
            case "login":
                getLogin(req, resp);
                break;
            case "details":
                break;
            case "logout":
                doLogout(req, resp);
                break;
            default:
                resp.sendRedirect("/notfound");
        }
    }

    private void getLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        if (SesionAuth.checkUser(req)) {

        } else {
            req.getRequestDispatcher("/login/login.jsp").forward(req, resp);
        }
    }

    private void doLogout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);
        session.invalidate();
        resp.sendRedirect("/user");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "login":
                doLogin(req, resp);
                break;
        }
    }

    private void doLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = checkLogin(email, password);
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("userAuth", user.getEmail());
            session.setAttribute("user_nickname", user.getNickname());
        } else {
            req.setAttribute("error", "Email or password do not match");
            req.getRequestDispatcher("/login/login.jsp").forward(req, resp);
        }
    }

    private User checkLogin(String email, String password) {
        User user = userService.findByEmail(email);
        if(user != null){
            if (user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }
}
