package dao;

import context.DBContent;
import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public Account findByUsernameAndPassword(String username, String password){
        String query = "SELECT * FROM account WHERE username=? AND password=?";
        try{
            conn = new DBContent().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Account account = new Account(rs.getString("username"), rs.getString("password"));
                return account;
            }
        }
        catch (Exception e){
            
        }
        return null;
    }
}
