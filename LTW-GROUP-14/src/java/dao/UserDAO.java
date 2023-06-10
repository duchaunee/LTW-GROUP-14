/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.User;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class UserDAO extends DAO{
    public UserDAO(){}
    public List<User>findAll(){
        List<User>list=new ArrayList<>();
        String query="select * from user where role LIKE 'USER'";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new User(rs.getInt(1),rs.getString(2),
                                    rs.getString(3),rs.getString(4),rs.getBytes(5),
                                    rs.getString(6),rs.getString(7),
                                    rs.getTimestamp(8).toLocalDateTime()));
            }
        }catch(Exception e){
        }
        return list;
    }
    public User findById(Integer Id){
        String query="select * from user where id=?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, Id);
            rs=ps.executeQuery();
            if(rs.next()){
                return new User(rs.getInt(1),rs.getString(2),
                                    rs.getString(3),rs.getString(4),rs.getBytes(5),
                                    rs.getString(6),rs.getString(7),
                                    rs.getTimestamp(8).toLocalDateTime());
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
    
    public User findByEmail(String email){
        String query="select * from user where email = ?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, email);
            rs=ps.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setProvider(rs.getString("provider"));
                user.setRole(rs.getString("role"));
                user.setCreateAt(rs.getTimestamp("create_at").toLocalDateTime());
                if(rs.getBytes("avatar") != null) 
                    user.setAvatar(rs.getBytes("avatar"));
                return user;
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    
    public User findByEmailAndPassword(String email, String password){
        String query="select * from user where email = ? AND password = ?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs=ps.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setProvider(rs.getString("provider"));
                user.setRole(rs.getString("role"));
                user.setCreateAt(rs.getTimestamp("create_at").toLocalDateTime());
                if(rs.getBytes("avatar") != null) 
                    user.setAvatar(rs.getBytes("avatar"));
                return user;
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    
    public Integer countUser(){
        String query = "SELECT count(id) FROM user WHERE role LIKE 'USER'";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void save(String email, String password){
        String query = "INSERT INTO user(name, email, password, provider, create_at, role)"
                     + "VALUES(?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, "email");
            ps.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
            ps.setString(6, "USER");
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public List<User> pagingUser(Integer page){
        String query = "SELECT * FROM user WHERE role LIKE 'USER' LIMIT 5 offset ?";
        List<User> userList = new ArrayList<>();
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (page - 1) * 5);
            rs = ps.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                if(rs.getBytes("avatar") != null)
                    user.setAvatar(rs.getBytes("avatar"));
                user.setEmail(rs.getString("email"));
                user.setCreateAt(rs.getTimestamp("create_at").toLocalDateTime());
                user.setPassword(rs.getString("password"));
                user.setProvider(rs.getString("provider"));
                user.setRole(rs.getString("role"));
                userList.add(user);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return userList;
    }
    
    public void deleteById(Integer Id) throws Exception{
        try {
            conn = new DBConnect().getConnection();
            String query = "DELETE FROM user WHERE id = ?";
            ps=conn.prepareStatement(query);
            ps.setInt(1, Id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
