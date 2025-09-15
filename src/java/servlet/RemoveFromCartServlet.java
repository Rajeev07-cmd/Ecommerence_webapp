package com.ecommerce.servlet;

import com.ecommerce.util.DBUtil;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RemoveFromCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String itemIdStr = request.getParameter("itemId");

        if (itemIdStr == null || itemIdStr.isEmpty()) {
            // No item id provided, redirect back to cart
            response.sendRedirect(request.getContextPath() + "/cart?error=missingItemId");
            return;
        }

        try {
            int itemId = Integer.parseInt(itemIdStr);

            try (Connection conn = DBUtil.getConnection();
                 PreparedStatement ps = conn.prepareStatement("DELETE FROM cart_items WHERE id=?")) {
                ps.setInt(1, itemId);
                ps.executeUpdate();
            }

            response.sendRedirect(request.getContextPath() + "/cart");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
