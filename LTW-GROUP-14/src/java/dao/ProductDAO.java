/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.Product;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DAO {

  public ProductDAO() {

  }

  public List<Product> findAll() {
    List<Product> list = new ArrayList<>();
    String query = "select * from product";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        Product product = new Product(rs.getInt(1),
                rs.getString(2),
                rs.getInt(3),
                rs.getInt(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7),
                rs.getTimestamp(8).toLocalDateTime(),
                rs.getTimestamp(9).toLocalDateTime());
        product.setImage_id(rs.getInt("image_id"));
        list.add(product);
      }
    } catch (Exception e) {
    }
    return list;
  }

  public Product findById(Integer Id) throws Exception {
    String query = "select * from product where id=?";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      ps.setInt(1, Id);
      rs = ps.executeQuery();
      if (rs.next()) {
        Product product = new Product(rs.getInt(1),
                rs.getString(2),
                rs.getInt(3),
                rs.getInt(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7),
                rs.getTimestamp(8).toLocalDateTime(),
                rs.getTimestamp(9).toLocalDateTime());
        product.setImage_id(rs.getInt("image_id"));
        return product;
      } else {
      }
    } catch (Exception e) {
    }
    return null;
  }

  public int getSizeByFields(String category, String brand, String from, String to) {
    int size = 0;
    String query = "select count(*) from product "
            + "where category like ? "
            + "and brand like ? ";
    if (from != null && from != "") {
      query += " and CONVERT(price, double) >= '" + Integer.parseInt(from) + "'";
    }
    if (to != null && to != "") {
      query += " and CONVERT(price, double) <= '" + Integer.parseInt(to) + "'";
    }
    try {
      if (brand.equals("default") || brand.equals("all")) { //moi chay servlet thi no la "default"
        brand = "";
      }
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      ps.setString(1, "%" + category + "%");
      ps.setString(2, "%" + brand + "%");
      rs = ps.executeQuery();
      if (rs.next()) {
        size = rs.getInt(1);
      }
    } catch (Exception e) {
    }
    return size;
  }

  // lay ra "limit" san pham moi nhat
  public List<Product> getNewestProduct(String category, int limit) {
    List<Product> list = new ArrayList<>();
    String query = "SELECT * FROM product "
            + "WHERE category LIKE ? "
            + "order by create_at desc "
            + "LIMIT ?";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      ps.setString(1, "%" + category + "%");
      ps.setInt(2, limit);
      rs = ps.executeQuery();
      while (rs.next()) {
        Product product = new Product(rs.getInt(1),
                rs.getString(2),
                rs.getInt(3),
                rs.getInt(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7),
                rs.getTimestamp(8).toLocalDateTime(),
                rs.getTimestamp(9).toLocalDateTime());
        product.setImage_id(rs.getInt("image_id"));
        list.add(product);
      }
    } catch (Exception e) {
    }
    return list;
  }

  public List<Product> paginationByPage(String category,
          String brand,
          String from, String to,
          Integer numPerPage,
          Integer page,
          String order) {
    List<Product> list = new ArrayList<>();
    String query = "select * from product "
            + "where category like ? " //1
            + "and brand like ? "; //2

    //mặc định nếu không có "to" thì "to" sẽ là 9.000.000
    if (from != null && from != "") {
      query += " and CONVERT(price, double) >= '" + Integer.parseInt(from) + "' ";
//      query += " and CONVERT(price, double) <= '" + 9000000 + "' ";
    }

    //mặc định nếu không có "from" thì "from" sẽ là 500.000
    if (to != null & to != "") {
//      query += " and CONVERT(price, double) <= '" + 5000000 + "' ";
      query += " and CONVERT(price, double) <= '" + Integer.parseInt(to) + "' ";
    }

    query += "order by " + order + " " //3: Nó sẽ ordey by trước sau đó mới offset + limit chứ không phải nó offset + limit trước rồi mới order by
            + "limit ? " //3
            + "offset ?"; //4: offset từ bao nhiêu thì nó sẽ cắt từ đó

    try {
      if (brand.equals("default") || brand.equals("all")) { //moi chay servlet thi no la "default"
        brand = "";
      }
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      ps.setString(1, "%" + category + "%");
      ps.setString(2, "%" + brand + "%");
      ps.setInt(3, numPerPage);
      ps.setInt(4, (page - 1) * numPerPage);
      rs = ps.executeQuery();
      while (rs.next()) {
        Product product = new Product(rs.getInt(1),
                rs.getString(2),
                rs.getInt(3),
                rs.getInt(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7),
                rs.getTimestamp(8).toLocalDateTime(),
                rs.getTimestamp(9).toLocalDateTime());
//        product.setImage_id(rs.getInt("image_id"));
        list.add(product);
      }
    } catch (Exception e) {
    }
    return list;
  }

  public Product getProductById(Integer Id) throws Exception {
    String query = "select * from product where id=  ?";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      ps.setInt(1, Id);
      rs = ps.executeQuery();
      if (rs.next()) {
        Product product = new Product(rs.getInt(1),
                rs.getString(2),
                rs.getInt(3),
                rs.getInt(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7),
                rs.getTimestamp(8).toLocalDateTime(),
                rs.getTimestamp(9).toLocalDateTime());
//        product.setImage_id(rs.getInt("image_id"));
        return product;
      } else {
      }
    } catch (Exception e) {
    }
    return null;
  }

  public Product findByName(String name) throws Exception {
    String query = "select * from product where name = ?";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      ps.setString(1, name);
      rs = ps.executeQuery();
      if (rs.next()) {
        Product product = new Product(rs.getInt(1),
                rs.getString(2),
                rs.getInt(3),
                rs.getInt(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7),
                rs.getTimestamp(8).toLocalDateTime(),
                rs.getTimestamp(9).toLocalDateTime());
        product.setImage_id(rs.getInt("image_id"));
        return product;
      } else {
      }
    } catch (Exception e) {
      System.out.println(e);
    }
    return null;
  }

  public List<Product> findByPattern(String pattern) {
    List<Product> list = new ArrayList<>();
    String query = "select * from product where name like ?";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      ps.setString(1, "%" + pattern + "%");
      rs = ps.executeQuery();
      while (rs.next()) {
        list.add(new Product(rs.getInt(1),
                rs.getString(2),
                rs.getInt(3),
                rs.getInt(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7),
                rs.getTimestamp(8).toLocalDateTime(),
                rs.getTimestamp(9).toLocalDateTime()));
      }
    } catch (Exception e) {
    }
    return list;
  }

  public void save(HttpServletRequest request, Integer image_id) {
    String query = "INSERT INTO product(name, price, inventory, category, brand, description, create_at, update_at, image_id)"
            + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      ps.setString(1, request.getParameter("name"));
      ps.setString(2, request.getParameter("price"));
      ps.setString(3, request.getParameter("inventory"));
      ps.setString(4, request.getParameter("category"));
      ps.setString(5, request.getParameter("brand"));
      ps.setString(6, request.getParameter("desc"));
      ps.setTimestamp(7, Timestamp.valueOf(LocalDateTime.now()));
      ps.setTimestamp(8, Timestamp.valueOf(LocalDateTime.now()));
      ps.setInt(9, image_id);
      ps.executeUpdate();
    } catch (Exception e) {
      System.out.println(e);
    }
  }

  public void update(HttpServletRequest request) {
    String query = "UPDATE product SET name = ?, price = ?,"
            + "inventory = ?, category = ?, brand = ?, description = ?,"
            + "update_at = ? WHERE id = ?";
    Integer id = Integer.valueOf(request.getParameter("id"));
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      ps.setString(1, request.getParameter("name"));
      ps.setString(2, request.getParameter("price"));
      ps.setString(3, request.getParameter("inventory"));
      ps.setString(4, request.getParameter("category"));
      ps.setString(5, request.getParameter("brand"));
      ps.setString(6, request.getParameter("desc"));
      ps.setTimestamp(7, Timestamp.valueOf(LocalDateTime.now()));
      ps.setInt(8, id);
      ps.executeUpdate();
    } catch (Exception e) {
      System.out.println(e);
    }
  }

  public List<Product> pagningProduct(Integer id) {
    List<Product> list = new ArrayList<>();
    String query = "select * from product order by id limit 3 offset ?";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      ps.setInt(1, (id - 1) * 3);
      rs = ps.executeQuery();
      while (rs.next()) {
        Product product = new Product(rs.getInt(1),
                rs.getString(2),
                rs.getInt(3),
                rs.getInt(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7),
                rs.getTimestamp(8).toLocalDateTime(),
                rs.getTimestamp(9).toLocalDateTime());
        product.setImage_id(rs.getInt("image_id"));
        list.add(product);
      }
    } catch (Exception e) {
    }
    return list;
  }

  public int countProduct() {
    String query = "select count(*) from product";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        return rs.getInt(1);
      }
    } catch (Exception e) {
    }
    return 0;
  }

  public void updateQuantity(Integer id, Integer newQuantity) {
    String query = "UPDATE product SET inventory =  ? WHERE id = ?";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      ps.setInt(1, newQuantity);
      ps.setInt(2, id);
      ps.executeUpdate();
    } catch (Exception e) {
    }

  }

  public void deleteById(Integer id) {
    String query = "DELETE FROM product where id = ?";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareCall(query);
      ps.setInt(1, id);
      ps.executeUpdate();
    } catch (Exception e) {
      System.out.println(e);
    }
  }

  public List<Product> findNew() {
    List<Product> list = new ArrayList<>();
    String query = "Select * FROM product order by id desc limit 5";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        Product product = new Product(rs.getInt(1),
                rs.getString(2),
                rs.getInt(3),
                rs.getInt(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7),
                rs.getTimestamp(8).toLocalDateTime(),
                rs.getTimestamp(9).toLocalDateTime());
        product.setImage_id(rs.getInt("image_id"));
        list.add(product);
      }
    } catch (Exception e) {
    }
    return list;
  }

  public List<Product> findHot() {
    List<Product> list = new ArrayList<>();
    String query = "Select * FROM product order by inventory asc limit 5";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        Product product = new Product(rs.getInt(1),
                rs.getString(2),
                rs.getInt(3),
                rs.getInt(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7),
                rs.getTimestamp(8).toLocalDateTime(),
                rs.getTimestamp(9).toLocalDateTime());
        product.setImage_id(rs.getInt("image_id"));
        list.add(product);
      }
    } catch (Exception e) {
    }
    return list;
  }
}
