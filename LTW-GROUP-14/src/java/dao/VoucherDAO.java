/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.User;
import entity.Voucher;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class VoucherDAO extends DAO{
    private UserDAO udao=new UserDAO();
    public VoucherDAO(){} 
    public List<Voucher>findAll(){
        List<Voucher>list=new ArrayList<>();
        String query="select * from voucher";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new Voucher(rs.getInt(1),udao.findById(rs.getInt(2)),
                                    rs.getString(3),rs.getInt(4)));
            }
        }catch(Exception e){
        }
        return list;
    }
    public Voucher findById(Integer Id) throws Exception{
        String query="select * from voucher where id=?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, Id);
            rs=ps.executeQuery();
            if(rs.next()){
                return new Voucher(rs.getInt(1),udao.findById(rs.getInt(2)),
                                    rs.getString(3),rs.getInt(4));
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
}
