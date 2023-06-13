/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import javax.servlet.http.HttpServletRequest;
import entity.Contact;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ContactDAO extends DAO {
    public ContactDAO() {
    }
    public void save(HttpServletRequest request){
        String query="INSERT INTO contact (name, email, SDT, adress, cmt)\n" +
"       VALUES (?, ?, ?, ?, ?)";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, request.getParameter("name"));
            ps.setString(2, request.getParameter("email"));
            ps.setString(3, request.getParameter("SDT"));
            ps.setString(4, request.getParameter("adress"));
            ps.setString(5, request.getParameter("cmt"));
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }   
    public List<Contact> getAllContact(){
        List<Contact> list=new ArrayList<>();
        String query = "Select * from contact";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
            list.add(new Contact(rs.getInt(1),
                                 rs.getString(2),
                                 rs.getString(3),
                                 rs.getString(4),
                                 rs.getString(5),
                                 rs.getString(6)));
        }
        }
        catch (Exception e){
            
        }            
        return list;                 
    }
}
