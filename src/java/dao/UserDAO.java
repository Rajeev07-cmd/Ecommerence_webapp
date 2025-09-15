/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecommerce.dao;
import com.ecommerce.model.User;
import com.ecommerce.util.DBUtil;
import java.sql.*;

public class UserDAO {
  public boolean emailExists(String email) throws SQLException {
    String sql="SELECT id FROM users WHERE email=?";
    try (Connection c=DBUtil.getConnection(); PreparedStatement p=c.prepareStatement(sql)){
      p.setString(1,email);
      try(ResultSet r=p.executeQuery()){ return r.next(); }
    }
  }

  public void save(User u) throws SQLException {
    String sql="INSERT INTO users(fullname,email,password_hash,phone) VALUES(?,?,?,?)";
    try (Connection c=DBUtil.getConnection(); PreparedStatement p=c.prepareStatement(sql)){
      p.setString(1,u.getFullname());
      p.setString(2,u.getEmail());
      p.setString(3,u.getPasswordHash());
      p.setString(4,u.getPhone());
      p.executeUpdate();
    }
  }

  public User findByEmail(String email) throws SQLException {
    String sql="SELECT * FROM users WHERE email=?";
    try (Connection c=DBUtil.getConnection(); PreparedStatement p=c.prepareStatement(sql)){
      p.setString(1,email);
      try(ResultSet r=p.executeQuery()){
        if(r.next()){
          User u=new User();
          u.setId(r.getInt("id"));
          u.setFullname(r.getString("fullname"));
          u.setEmail(r.getString("email"));
          u.setPasswordHash(r.getString("password_hash"));
          u.setPhone(r.getString("phone"));
          return u;
        }
      }
    }
    return null;
  }
}
