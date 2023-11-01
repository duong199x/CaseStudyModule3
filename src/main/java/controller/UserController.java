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
            action = "details";
        }
        switch (action) {
            case "login":
                req.getRequestDispatcher("/login/login.jsp").forward(req, resp);
                break;
            case "logout":
                break;
            default:
                resp.sendRedirect("/notfound");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "login":
                if(SesionAuth.checkUser(req)){

                }else if(SesionAuth.chekAdmin(req)){

                }else {
                    doLogin(req, resp);
                }
                break;
        }
    }

    private void doLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = userService.findByEmail(email);
        if (user != null) {
            checkLogin(req, user, password);
        }else {
            req.setAttribute("error", "Email or password do not match");
            req.getRequestDispatcher("/login/login.jsp").forward(req,resp);
        }
    }

    private static void checkLogin(HttpServletRequest req, User user, String password) {
        if(user.getPassword().equals(password)){
            HttpSession session = req.getSession();
            if(user.getRole()==1){
                session.setAttribute("adminAuth", user.getNickname());
            }else {
                session.setAttribute("userAuth", user.getNickname());
            }
        }
    }
}
