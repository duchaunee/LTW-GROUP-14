package entity;

public class ImageProduct {
    private Integer id;
    private byte[] img;
    private byte[] imgPreview1;
    private byte[] imgPreview2;
    private byte[] imgPreview3;
    private byte[] imgPreview4;
   

    public ImageProduct() {
    }

    public ImageProduct(Integer id, byte [] img, byte[] imgPreview1, byte[] imgPreview2, byte[] imgPreview3, byte[] imgPreview4) {
        this.id = id;
        this.img = img;
        this.imgPreview1 = imgPreview1;
        this.imgPreview2 = imgPreview2;
        this.imgPreview3 = imgPreview3;
        this.imgPreview4 = imgPreview4;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public byte[] getImg() {
        return img;
    }

    public void setImg(byte [] img) {
        this.img = img;
    }

    public byte[] getImgPreview1() {
        return imgPreview1;
    }

    public void setImgPreview1(byte[] imgPreview1) {
        this.imgPreview1 = imgPreview1;
    }

    public byte[] getImgPreview2() {
        return imgPreview2;
    }

    public void setImgPreview2(byte[] imgPreview2) {
        this.imgPreview2 = imgPreview2;
    }

    public byte[] getImgPreview3() {
        return imgPreview3;
    }

    public void setImgPreview3(byte[] imgPreview3) {
        this.imgPreview3 = imgPreview3;
    }

    public byte[] getImgPreview4() {
        return imgPreview4;
    }

    public void setImgPreview4(byte[] imgPreview4) {
        this.imgPreview4 = imgPreview4;
    }
    
    

    
}
