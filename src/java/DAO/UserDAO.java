/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author DUY HUYNH
 */
public class UserDAO extends DBContext{

    

    public User checkUser(String user_email, String user_pass) {
        try {
            String checkUserquery = "select * from users where user_email = ? and user_pass = ?";
   
           PreparedStatement ps = connection.prepareStatement(checkUserquery);
            ps.setString(1, user_email);
            ps.setString(2, user_pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
            return user;
            }
        } catch (Exception ex) {

        }
        return null;
    }
public void deleteUser(int user_id){ 
    try{
        String deleteuser ="delete from users where user_id = ?";
        PreparedStatement ps = connection.prepareStatement(deleteuser);
    ps.setInt(1, user_id);
    ps.executeUpdate();
    }catch(SQLException e){
        
    }
}
    public void updateUser(int user_id, String user_name, String user_pass) {
      
        try {
          String updateUserquery = "update users set user_name = ? , user_pass = ? where user_id = ?";
           PreparedStatement ps = connection.prepareStatement(updateUserquery);
            ps.setString(1, user_name);
            ps.setString(2, user_pass);
            ps.setInt(3, user_id);
            ps.executeQuery();

        } catch (Exception e) {

        }
    }

    public User checkAcc(String user_email) {
        try {
            String checkAccquery = "select * from users where user_email = ?";
           
           PreparedStatement ps = connection.prepareStatement(checkAccquery);
            ps.setString(1, user_email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User a = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                return a;
            }

        } catch (Exception e) {

        }
        return null;
    }

    public void signup(String user_email, String user_pass) {
        try {
            String signupQuery = "insert into users values(?,?,?,?)";
       
           PreparedStatement ps = connection.prepareStatement(signupQuery);
            ps.setString(1, "");
            ps.setString(2, user_email);
            ps.setString(3, user_pass);
            ps.setString(4, "False");
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public List<User> getUser(int user_id, String isAdmin) {
        List<User> list = new ArrayList<>();
        String getUserquery = "select * from users";
        try {
 
            PreparedStatement ps = connection.prepareStatement(getUserquery);
           ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        } catch (Exception e) {

        }
        return list;
        
    }
       public List<User> getUser() {
        List<User> list = new ArrayList<>();
        String sql = "select * from users";
        try {
       
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void setAdmin(int user_id, String isAdmin) {
        String setAdminquery = "update users set isAdmin = ? where user_id = ?";
        try {
      
            PreparedStatement ps = connection.prepareStatement(setAdminquery);
            ps.setInt(2, user_id);
            ps.setString(1, isAdmin.toUpperCase());
            ps.executeQuery();
        } catch (Exception e) {

        }
    }
    
 
}
