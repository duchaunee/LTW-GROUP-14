package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContent;
import entity.Shoes;

public class ShoesDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Shoes> findAll() {
        List<Shoes> shoess = new ArrayList<>();
        String query = "SELECT * FROM SHOES";
        try {
            conn = new DBContent().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
               shoess.add(new Shoes(rs.getInt("id"),
                                    rs.getString("name"),
                                    rs.getInt("remaining"),
                                    rs.getInt("price"),
                                    rs.getString("image"),
                                    rs.getString("material"),
                                    rs.getString("gender"),
                                    rs.getString("description")
                                ));
            }
        } catch (Exception e) {

        }

        return shoess;
    }

    public static void main(String[] args) {
        List<Shoes> shoess = new ShoesDAO().findAll();
        for (Shoes p : shoess) {
            System.out.println(p);
        }
    }
}
