package controller;

import model.Order;
import model.OrderDetail;
import services.IService.IOrderDetailService;
import services.IService.IOrderService;
import services.OrderDetailsService;
import services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminController", value = "/admin")
public class AdminController extends HttpServlet {
    private IOrderService<Order> orderService = new OrderService();
    private IOrderDetailService<OrderDetail> orderDetailService = new OrderDetailsService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "orders";
        }
        switch (action) {
            case "orders":
                showOrder(request, response);
                break;
            case "details":
                showOrderDetails(request, response);
                break;
            default:
                response.sendRedirect("/notfound");
        }
    }

    private void showOrderDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("id"));
        Order order = orderService.findById(orderId);
        if (order == null) {
            response.sendRedirect("/notfound");
        }else {
            List<OrderDetail> list = orderDetailService.findByOderId(orderId);
            request.setAttribute("order", order);
            request.setAttribute("orderdetails", list);
            request.getRequestDispatcher("/admin/orderdetail.jsp").forward(request, response);
        }
    }

    private void showOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orders = orderService.getAll();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/admin/cartManager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String action = request.getParameter("action");
         switch (action) {
             case "changeStatus":
                 changeStatus(request,response);
                 break;
             default:
                 response.sendRedirect("/notfound");
         }
    }

    private void changeStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int status = Integer.parseInt(request.getParameter("status"));
        int id = Integer.parseInt(request.getParameter("id"));
        orderService.changeStatus(id, status);
        response.sendRedirect(request.getHeader("referer"));
    }
}