package com.ecommerce.servlet;

import com.ecommerce.dao.CartDAO;
import com.ecommerce.model.CartItem;
import com.ecommerce.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class CartServlet extends HttpServlet {
    private CartDAO cartDAO = new CartDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("user");
        if (loggedUser == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        try {
            int cartId = cartDAO.getOrCreateCartId(loggedUser.getId());
            List<CartItem> items = cartDAO.getCartItems(cartId);
            request.setAttribute("cart", items);
            RequestDispatcher rd = request.getRequestDispatcher("/jsp/cart.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
