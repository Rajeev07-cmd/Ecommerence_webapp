package com.ecommerce.servlet;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            String search = req.getParameter("search");
            String catId = req.getParameter("category");

            List<Product> products;

            if (search != null && !search.trim().isEmpty()) {
                products = productDAO.searchProducts(search);
            } else if (catId != null) {
                products = productDAO.getProductsByCategory(Integer.parseInt(catId));
            } else {
                products = productDAO.getAllProducts();
            }

            req.setAttribute("products", products);
            req.getRequestDispatcher("/jsp/products.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
