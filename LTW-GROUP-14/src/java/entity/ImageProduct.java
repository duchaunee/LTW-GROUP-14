package entity;

public class ImageProduct {
    private Integer id;
    private String url;
    private String previewUrl1;
    private String previewUrl2;
    private String previewUrl3;
    private String previewUrl4;

    public ImageProduct() {
    }

    public ImageProduct(Integer id, String url, String previewUrl1, String previewUrl2, String previewUrl3, String previewUrl4) {
        this.id = id;
        this.url = url;
        this.previewUrl1 = previewUrl1;
        this.previewUrl2 = previewUrl2;
        this.previewUrl3 = previewUrl3;
        this.previewUrl4 = previewUrl4;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPreviewUrl1() {
        return previewUrl1;
    }

    public void setPreviewUrl1(String previewUrl1) {
        this.previewUrl1 = previewUrl1;
    }

    public String getPreviewUrl2() {
        return previewUrl2;
    }

    public void setPreviewUrl2(String previewUrl2) {
        this.previewUrl2 = previewUrl2;
    }

    public String getPreviewUrl3() {
        return previewUrl3;
    }

    public void setPreviewUrl3(String previewUrl3) {
        this.previewUrl3 = previewUrl3;
    }

    public String getPreviewUrl4() {
        return previewUrl4;
    }

    public void setPreviewUrl4(String previewUrl4) {
        this.previewUrl4 = previewUrl4;
    }
    
}
