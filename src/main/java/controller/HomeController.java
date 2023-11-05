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

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    private final IProductService<Product> productIService = new ProductService();
    private final IImageService<Image> imageIService = new ImageService();
    private final ISizeService<Size> sizeService = new SizeService();
    private final ICategoryService<Category> categoryService = new CategoryServices();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "home";
        }
        switch (action) {
            case "home":
                showHome(request, response);
                break;
            case "collections":
                showCollections(request, response);
                break;
            case "items":
                showItem(request, response);
                break;
            case "category":
                int id= Integer.parseInt(request.getParameter("id"));
                String category=categoryService.findProductById(id).getName();
                List<Product> products = productIService.findByCategory(id);
                request.setAttribute("category", category);
                request.setAttribute("listproduct", products);
                request.getRequestDispatcher("/products/nike.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect("/notfound");
        }
    }

    private void showItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productIService.findProductById(id);
        List<Image> listImage= imageIService.findAllImageByProductId(id);
        List<Size> listSize = sizeService.findAllSizeByProductId(id);
        request.setAttribute("product", product);
        request.setAttribute("images", listImage);
        request.setAttribute("sizes", listSize);
        request.getRequestDispatcher("/products/items.jsp").forward(request, response);
    }

    private void showCollections(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> list= productIService.findAll();
        List<Category> categories= categoryService.findAll();
        request.setAttribute("collections", list);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/products/collections.jsp").forward(request, response);
    }

    private void showHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/products/home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}