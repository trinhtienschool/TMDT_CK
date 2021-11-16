package vn.thegioicaycanh.model.user;

import java.util.Date;

public class User {
    private int id;
    private String name;
    private String avatar;
    private long password;
    private String email;
    private long phone;
    private String address;
    private String sex;
    private Date birthday;
    private boolean active;
    private String about;
    private int role_id;
    private Date date_created;
    private Date date_created_commnent;
    private int rating_type_id;
    private String comment;

    public User() {
    }
    public Date getDate_created_commnent() {
        return date_created_commnent;
    }

    public void setDate_created_commnent(Date date_created_commnent) {
        this.date_created_commnent = date_created_commnent;
    }

    public int getRating_type_id() {
        return rating_type_id;
    }

    public void setRating_type_id(int rating_type_id) {
        this.rating_type_id = rating_type_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public long getPassword() {
        return password;
    }

    public void setPassword(long password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }
    public boolean isMan(){
        if(getSex().equals("Nam")){
            return true;
        }
        return false;
    }
}
