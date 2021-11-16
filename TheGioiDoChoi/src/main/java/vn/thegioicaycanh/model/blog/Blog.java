package vn.thegioicaycanh.model.blog;

import java.util.Date;

public class Blog {
    private int id;
    private String name;
    private String description;
    private String content;
    private boolean active;
    private String avatar;
    private Date date_created;
    private String slug;
    private int admin_id;
    private int numOfRead;

    public Blog() {
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Blog(int id, String name, String content, boolean active, String avatar, Date date_created, String slug, int admin_id,int numOfRead) {
        this.id = id;
        this.name = name;
        this.content = content;
        this.active = active;
        this.avatar = avatar;
        this.date_created = date_created;
        this.slug = slug;
        this.admin_id = admin_id;
        this.numOfRead=numOfRead;
    }
    //generate getter and setter

    public int getNumOfRead() {
        return numOfRead;
    }

    public void setNumOfRead(int numOfRead) {
        this.numOfRead = numOfRead;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }
}
