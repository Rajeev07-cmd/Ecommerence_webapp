package com.ecommerce.servlet;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            User u = userDAO.findByEmail(email);

            // ⚠️ For now using plain text password check (replace with hashing later)
            if (u != null && u.getPasswordHash().equals(password)) {
                HttpSession session = req.getSession();
                session.setAttribute("user", u);       // store full User object
                session.setAttribute("userId", u.getId()); // store ID for checkout

                // handle redirect after login
                String redirect = req.getParameter("redirect");
                if ("checkout".equals(redirect)) {
                    resp.sendRedirect(req.getContextPath() + "/checkout");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/products");
                }

            } else {
                req.setAttribute("error", "Invalid email or password");
                req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
