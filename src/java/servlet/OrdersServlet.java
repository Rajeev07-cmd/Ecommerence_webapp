package com.ecommerce.servlet;

import com.ecommerce.util.DBUtil;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class OrdersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Integer userId = (session != null) ? (Integer) session.getAttribute("userId") : null;

        if (userId == null) {
            resp.sendRedirect(req.getContextPath() + "/jsp/login.jsp?redirect=orders");
            return;
        }

        List<Map<String, Object>> orders = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                "SELECT id, total, created_at FROM orders WHERE user_id=? ORDER BY created_at DESC")) {

            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> order = new HashMap<>();
                    order.put("id", rs.getInt("id"));
                    order.put("total", rs.getDouble("total"));
                    order.put("created_at", rs.getTimestamp("created_at"));
                    orders.add(order);
                }
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        req.setAttribute("orders", orders);
        req.getRequestDispatcher("/jsp/orders.jsp").forward(req, resp);
    }
}
