package com.ecommerce.servlet;

import com.ecommerce.dao.CartDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateCartServlet extends HttpServlet {
    private CartDAO cartDAO = new CartDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int qty = Integer.parseInt(request.getParameter("quantity"));
        try {
            String sql = "UPDATE cart_items SET quantity=? WHERE id=?";
            try (var conn = com.ecommerce.util.DBUtil.getConnection();
                 var ps = conn.prepareStatement(sql)) {
                ps.setInt(1, qty);
                ps.setInt(2, itemId);
                ps.executeUpdate();
            }
            response.sendRedirect(request.getContextPath() + "/cart");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
