package com.ecommerce.servlet;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");

        try {
            if (userDAO.emailExists(email)) {
                req.setAttribute("error", "Email already registered");
                req.getRequestDispatcher("/jsp/register.jsp").forward(req, resp);
                return;  // ✅ stop execution
            }

            // For now: storing plain password (testing only)
            User u = new User();
            u.setFullname(fullname);
            u.setEmail(email);
            u.setPasswordHash(password); // ⚠️ should hash later
            u.setPhone(phone);

            userDAO.save(u);

            // Redirect to login page after success
            resp.sendRedirect(req.getContextPath() + "/jsp/login.jsp?registered=1");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
