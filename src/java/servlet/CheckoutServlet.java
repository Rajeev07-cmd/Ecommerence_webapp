package com.ecommerce.servlet;

import com.ecommerce.dao.CartDAO;
import com.ecommerce.model.CartItem;
import com.ecommerce.util.DBUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.List;

public class CheckoutServlet extends HttpServlet {
    private CartDAO cartDAO = new CartDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Integer userId = (session != null) ? (Integer) session.getAttribute("userId") : null;

        if (userId == null) {
            // redirect to login with redirect param
            resp.sendRedirect(req.getContextPath() + "/jsp/login.jsp?redirect=checkout");
            return;
        }

        // ✅ Read payment method (and other details if your checkout.jsp has form fields)
        String paymentMethod = req.getParameter("paymentMethod");

        try (Connection conn = DBUtil.getConnection()) {
            int cartId = cartDAO.getOrCreateCartId(userId);
            List<CartItem> cartItems = cartDAO.getCartItems(cartId);

            if (cartItems == null || cartItems.isEmpty()) {
                req.setAttribute("error", "Your cart is empty!");
                req.getRequestDispatcher("/jsp/cart.jsp").forward(req, resp); // ✅ fixed path
                return;
            }

            // calculate total
            double total = 0;
            for (CartItem ci : cartItems) {
                total += ci.getQuantity() * ci.getProduct().getPrice();
            }

            // insert into orders
            String orderSql = "INSERT INTO orders (user_id, total) VALUES (?, ?)";
            int orderId = -1;
            try (PreparedStatement ps = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, userId);
                ps.setDouble(2, total);
                ps.executeUpdate();

                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        orderId = rs.getInt(1);
                    }
                }
            }

            // insert into order_items
            String itemSql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(itemSql)) {
                for (CartItem ci : cartItems) {
                    ps.setInt(1, orderId);
                    ps.setInt(2, ci.getProduct().getId());
                    ps.setInt(3, ci.getQuantity());
                    ps.setDouble(4, ci.getProduct().getPrice());
                    ps.addBatch();
                }
                ps.executeBatch();
            }

            // Clear cart
            cartDAO.clearCart(cartId);

            // ✅ Pass details to JSP
            req.setAttribute("orderId", orderId);
            req.setAttribute("total", total);
            req.setAttribute("paymentMethod", paymentMethod != null ? paymentMethod : "Not Selected");

            req.getRequestDispatcher("/jsp/orderSuccess.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
