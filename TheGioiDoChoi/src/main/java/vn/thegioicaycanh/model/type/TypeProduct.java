package vn.thegioicaycanh.model.type;

import java.util.List;

// Loại sản phẩm gồm id, danh sách sản phẩm, id_product
public class TypeProduct {
    int id;
    int pro_id;
    String nameType;

    public TypeProduct(){}

    public TypeProduct(int id, int pro_id, String nameType) {
        this.id = id;
        this.pro_id = pro_id;
        this.nameType = nameType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public String getNameType() {
        return nameType;
    }

    public void setNameType(String nameType) {
        this.nameType = nameType;
    }
}
