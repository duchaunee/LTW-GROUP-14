/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Cart;
import entity.CartItem;
import entity.ImageProduct;
import entity.Order;
import entity.OrderAddress;
import entity.OrderItem;
import entity.Product;
import entity.User;
import entity.Voucher;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class test {
    //user ok
    //cart ok
    //orderAddress ok
    //product ok
    //order ok
    //cartitem ok
    //image_product ok
    //orderitem ok
    //voucher ok
    public static void main(String[] args) throws Exception {
       VoucherDAO o=new VoucherDAO();
       List<Voucher>a=o.findAll();
       System.out.println(a.size());
//       Voucher b=o.findById(4);
//       System.err.println(b.getValue());
      for(Voucher x:a) System.out.println(x.getName());
    }
}
