package controller;

import model.Category;
import model.Product;
import services.CategoryServices;
import services.IService.ICategoryService;
import services.IService.IProductService;
import services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/admin/product")
public class ProductController extends HttpServlet {
    private final IProductService<Product> productIService = new ProductService();
    private final ICategoryService<Category> categoryService = new CategoryServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "admin":
                showProductManager(request, response);
                break;
            case "create":
                showCreateProduct(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "edit":
                showFormEdit(request, response);

        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", id);
        Product product = productIService.findProductById(id);
        request.setAttribute("editProduct", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/update.jsp");
        List<Category> categoryList = categoryService.findAll();
        request.setAttribute("categoryList", categoryList);
        dispatcher.forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productIService.delete(id);
        response.sendRedirect("/admin/product?action=admin");
    }

    private void showCreateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/create.jsp");
        List<Category> categoryList = categoryService.findAll();
        request.setAttribute("categoryList", categoryList);
        dispatcher.forward(request, response);
    }

    private void showProductManager(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productIService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/managerProduct.jsp");
        request.setAttribute("productList", productList);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Category category = new Category(categoryId);
        Product product = new Product(name, price, description, status, category);
        productIService.add(product);
        response.sendRedirect("/admin/product?action=admin");
    }

    public void editProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        System.out.println(request.getParameter("status"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Category category = categoryService.findProductById(categoryId);
        category.getName();
        Product product = new Product(name, price, description,status,category);
        productIService.edit(product, id);
        response.sendRedirect("/admin/product?action=admin");
    }
}