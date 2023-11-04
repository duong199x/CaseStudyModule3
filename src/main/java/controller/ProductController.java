package controller;

import model.Category;
import model.Image;
import model.Product;
import model.Size;
import services.CategoryServices;
import services.IService.ICategoryService;
import services.IService.IImageService;
import services.IService.IProductService;
import services.IService.ISizeService;
import services.ImageService;
import services.ProductService;
import services.SizeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/admin/product")
public class ProductController extends HttpServlet {
    private final IProductService<Product> productIService = new ProductService();
    private final ICategoryService<Category> categoryService = new CategoryServices();
    private final ISizeService<Size> sizeISizeService = new SizeService();
    private final IImageService<Image> imageIImageService = new ImageService();

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
        List<Size> sizeList = sizeISizeService.findAllSizeByProductId(id);
        request.setAttribute("sizeList", sizeList);
        List<Image> imageList = imageIImageService.findAllImageByProductId(id);
        request.setAttribute("imageList", imageList);
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
        List<Product> productList = null;
        String search = request.getParameter("search");
        if (search != null) {
            productList = productIService.findProductByName(search);
        } else {
            productList = productIService.findAll();
        }
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
            case "editsize":
                editSize(request, response);
                break;
            case "editimage":
                editImage(request, response);
                break;
        }
    }

    private void editImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String image = request.getParameter("image");
        int productId = Integer.parseInt(request.getParameter("productId"));
        Image image1 = new Image(id, image, productId);
        imageIImageService.edit(image1, productId, id);
        response.sendRedirect("/admin/product?action=edit&id=" + productId);
    }

    private void editSize(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String size = request.getParameter("size");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        Size size1 = new Size(size, quantity, productId);
        sizeISizeService.edit(size1, productId, size);
        response.sendRedirect("/admin/product?action=edit&id=" + productId);
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
        Product product = new Product(name, price, description, status, category);
        productIService.edit(product, id);
        response.sendRedirect("/admin/product?action=admin");
    }
}