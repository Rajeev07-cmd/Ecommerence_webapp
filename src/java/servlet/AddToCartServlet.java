package com.ecommerce.servlet;

import com.ecommerce.dao.CartDAO;
import com.ecommerce.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AddToCartServlet extends HttpServlet {
    private CartDAO cartDAO = new CartDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("user");
        if (loggedUser == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {
            int cartId = cartDAO.getOrCreateCartId(loggedUser.getId());
            cartDAO.addToCart(cartId, productId, quantity);
            response.sendRedirect(request.getContextPath() + "/cart");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
