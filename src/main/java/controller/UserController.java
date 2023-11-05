package controller;

import filter.SessionAuth;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "details";
        }
        switch (action) {
            case "details":
                if (SessionAuth.checkAuthentication(request)){
                    getDetails(getUser(request),request, response);
                }else {
                 response.sendRedirect("/login");
                }
                break;
            default:
                response.sendRedirect("/notfound");
        }
    }

    private void getDetails(User user,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("email",user.getEmail());
        request.setAttribute("nickname",user.getNickname());
        request.setAttribute("phone",user.getPhone());
        request.setAttribute("address",user.getAddress());
        request.getRequestDispatcher("/user/details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (SessionAuth.isAdmin(request)){
            request.getRequestDispatcher("/error/access-denied.jsp").forward(request, response);
        }else if (SessionAuth.checkAuthentication(request)){
            String action=request.getParameter("action");
            if (action.equals("edit")){
                doUpdate(request, response);
            }else if(action.equals("changePassword")){
                doChangePassword(request, response);
            }else {
                response.sendRedirect("/notfound");
            }
        }else {
            response.sendRedirect("/login");
        }
    }


    private void doChangePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldPassword= request.getParameter("oldPassword");
        String newPassword= request.getParameter("newPassword");
        User user=getUser(request);
        if(user.getPassword().equals(oldPassword)){
            userService.changePassword(user.getId(),newPassword);
            request.setAttribute("message","Đổi mật khẩu thành công");
            getDetails(user,request, response);
        }else {
            request.setAttribute("error","Sai mật khẩu");
            getDetails(user,request, response);
        }
    }

    private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nickname = request.getParameter("nickname");
        String address = request.getParameter("address");
        User user= getUser(request);
        user.setNickname(nickname);
        user.setAddress(address);
        userService.edit(user);
        response.sendRedirect("/user");
    }

    private User getUser(HttpServletRequest request){
        HttpSession session = request.getSession();
        String email= (String) session.getAttribute("authentication");
        User user = userService.findByEmail(email);
        return user;
    }
}
