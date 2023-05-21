package entity;

public class OrderAddress {
    private Integer id;
    private String city;
    private String district;
    private String wards;
    private String address;
    private String phoneNumber;
    private String note;
    private String paymentMethod;

    public OrderAddress(Integer id, String city, String district, String wards, String address, String phoneNumber, String note, String paymentMethod) {
        this.id = id;
        this.city = city;
        this.district = district;
        this.wards = wards;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.note = note;
        this.paymentMethod = paymentMethod;
    }

    public OrderAddress() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWards() {
        return wards;
    }

    public void setWards(String wards) {
        this.wards = wards;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
    
}
