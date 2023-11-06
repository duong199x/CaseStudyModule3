package controller;

import model.Order;
import services.IService.IOrderService;
import services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminController", value = "/admin")
public class AdminController extends HttpServlet {
    private IOrderService<Order> orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "orders":
                showOrder(request, response);
                break;
            case "details":
                showOrderDetails(request, response);
                break;
        }
    }

    private void showOrderDetails(HttpServletRequest request, HttpServletResponse response) {
//        int orderId = Integer.parseInt(request.getParameter("orderId"));
//        Order order = orderService.fi;
    }

    private void showOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orders = orderService.getAll();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/admin/cartManager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}