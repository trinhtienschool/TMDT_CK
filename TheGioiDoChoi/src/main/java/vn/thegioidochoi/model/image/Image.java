package vn.thegioidochoi.model.image;

public class Image {
    public int pro_id;
    public String url;

    public Image() {
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Image{" +
                "pro_id=" + pro_id +
                ", url='" + url + '\'' +
                '}';
    }
}
