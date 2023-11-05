package controller;

import filter.SessionAuth;
import model.*;
import services.*;
import services.IService.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "UserController", value = "/user")
public class UserController extends HttpServlet {
    private IUserService<User> userService;
    private ICartService<Cart> cartService = new CartService();
    private IProductService<Product> productService = new ProductService();
    private ISizeService<Size> sizeService = new SizeService();
    private IOrderService<Order> orderService = new OrderService();
    private IOrderDetailService<OrderDetail> orderDetailService = new OrderDetailsService();

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
        if (!SessionAuth.checkAuthentication(request)) {
            response.sendRedirect("/login");
        } else {
            switch (action) {
                case "details":
                    getDetails(getUser(request), request, response);
                    break;
                case "cart":
                    showCart(request, response);
                    break;
                case "add":
                    addToCart(request, response);
                    break;
                    case "order":
                        doOrder(request, response);
                        break;
                default:
                    response.sendRedirect("/notfound");
            }
        }
    }

    private void doOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = getUser(request);
        List<Cart> listCart = cartService.findCartByUserId(user.getId());
        double total = 0;
        for (Cart cart : listCart) {
            total += cart.getProduct().getPrice();
        }
        Date time = new Date(System.currentTimeMillis());
        Order order = new Order(time,total,user);
        int orderId = orderService.add(order);
        for (Cart cart : listCart) {
            orderDetailService.add(orderId,cart.getProduct().getId(),cart.getSize().getId());
        }
        cartService.deleteByUserId(user.getId());
        response.sendRedirect("/home");
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int sizeId = Integer.parseInt(request.getParameter("sizeId"));
        User user = getUser(request);
        cartService.add(productId, sizeId, user.getId());
        response.sendRedirect(request.getHeader("referer"));
    }

    private void showCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = getUser(request);
        List<Cart> listCart = cartService.findCartByUserId(user.getId());
        double total = 0;
        for (Cart cart : listCart) {
            total += cart.getProduct().getPrice();
        }
        request.setAttribute("carts", listCart);
        request.setAttribute("nickname", user.getNickname());
        request.setAttribute("total", total);
        request.getRequestDispatcher("/user/cart.jsp").forward(request, response);
    }

    private void getDetails(User user, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("email", user.getEmail());
        request.setAttribute("nickname", user.getNickname());
        request.setAttribute("phone", user.getPhone());
        request.setAttribute("address", user.getAddress());
        request.getRequestDispatcher("/user/details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (SessionAuth.isAdmin(request)) {
            request.getRequestDispatcher("/error/access-denied.jsp").forward(request, response);
        } else if (SessionAuth.checkAuthentication(request)) {
            String action = request.getParameter("action");
            switch (action) {
                case "edit":
                    doUpdate(request, response);
                    break;
                case "changePassword":
                    doChangePassword(request, response);
                    break;
                case "remove":
                    removeCart(request, response);
                    break;
                default:
                    response.sendRedirect("/notfound");
            }
        } else {
            response.sendRedirect("/login");
        }
    }

    private void removeCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        cartService.delete(id);
        response.sendRedirect("/user?action=cart");
    }

    private void doChangePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        User user = getUser(request);
        if (user.getPassword().equals(oldPassword)) {
            userService.changePassword(user.getId(), newPassword);
            request.setAttribute("message", "Đổi mật khẩu thành công");
            getDetails(user, request, response);
        } else {
            request.setAttribute("error", "Sai mật khẩu");
            getDetails(user, request, response);
        }
    }

    private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nickname = request.getParameter("nickname");
        String address = request.getParameter("address");
        User user = getUser(request);
        user.setNickname(nickname);
        user.setAddress(address);
        userService.edit(user);
        response.sendRedirect("/user");
    }

    private User getUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("authentication");
        User user = userService.findByEmail(email);
        return user;
    }
}
