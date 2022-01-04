package vn.thegioidochoi.model.header_footer;

import java.util.ArrayList;
import java.util.List;

public class Category {
    private int id;
    private String name;
    private boolean active;
    private String slug;
    private int master_id;
    private int parent; //0: là nhánh lớn bình thường; 1: là nhánh lớn và là cha; 2 là nhánh con của nhánh 1
    private List<Category> subcategories;
    public Category() {
       parent = 0;
       subcategories = new ArrayList<Category>();

    }

    public List<Category> getSubcategories() {
        return subcategories;
    }

    public void setSubcategories(List<Category> subcategories) {
        this.subcategories = subcategories;
    }

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
    }

    public int getMaster_id() {
        return master_id;
    }

    public void setMaster_id(int master_id) {
        this.master_id = master_id;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

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

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    @Override
    public String toString() {
        System.out.println(id+"; "+name+" ; "+master_id);
       if(!subcategories.isEmpty()){
           System.out.println("s");
           for(Category c: subcategories){
               System.out.println(c);
           }
           System.out.println("e");
       }
        return "";
    }
}
