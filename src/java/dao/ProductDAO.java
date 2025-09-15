package com.ecommerce.dao;

import com.ecommerce.model.Product;
import com.ecommerce.util.DBUtil;
import java.sql.*;
import java.util.*;

public class ProductDAO {

    // Get all products
    public List<Product> getAllProducts() throws SQLException {
        return queryProducts("SELECT * FROM products", null);
    }

    // Search products by keyword
    public List<Product> searchProducts(String keyword) throws SQLException {
        String sql = "SELECT * FROM products WHERE name LIKE ? OR description LIKE ?";
        return queryProducts(sql, "%" + keyword + "%");
    }

    // Filter products by category
    public List<Product> getProductsByCategory(int categoryId) throws SQLException {
        String sql = "SELECT * FROM products WHERE category_id=?";
        List<Product> products = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    products.add(mapProduct(rs));
                }
            }
        }
        return products;
    }

    // Utility: run queries
    private List<Product> queryProducts(String sql, String keyword) throws SQLException {
        List<Product> products = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (keyword != null) {
                ps.setString(1, keyword);
                ps.setString(2, keyword);
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    products.add(mapProduct(rs));
                }
            }
        }
        return products;
    }

    private Product mapProduct(ResultSet rs) throws SQLException {
        Product p = new Product();
        p.setId(rs.getInt("id"));
        p.setCategoryId(rs.getInt("category_id"));
        p.setName(rs.getString("name"));
        p.setDescription(rs.getString("description"));
        p.setPrice(rs.getDouble("price"));
        p.setStock(rs.getInt("stock"));
        p.setImageUrl(rs.getString("image_url"));
        return p;
    }
}
