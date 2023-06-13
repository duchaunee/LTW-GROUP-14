/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Contact {
    private int id;
    private String name;
    private String email;
    private String SDT;
    private String adress;
    private String cmt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getCmt() {
        return cmt;
    }

    public void setCmt(String cmt) {
        this.cmt = cmt;
    }

    public Contact(int id, String name, String email, String SDT, String adress, String cmt) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.SDT = SDT;
        this.adress = adress;
        this.cmt = cmt;
    }

    public Contact() {
    }

    @Override
    public String toString() {
        return "Contact{" + "id=" + id + ", name=" + name + ", email=" + email + ", SDT=" + SDT + ", adress=" + adress + ", cmt=" + cmt + '}';
    }
    
}
