package controller;

import model.Product;
import services.IService.IProductService;
import services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/productmanager")
public class ProductController extends HttpServlet {
    private IProductService productIService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "productmanager":
                showProductManager(request, response);
                break;

        }
    }

    private void showProductManager(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productIService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/managerProduct.jsp");
        request.setAttribute("productList", productList);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}