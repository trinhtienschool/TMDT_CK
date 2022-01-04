package vn.thegioidochoi.model.notifications;

import java.util.Date;

public class Notifications {
    private int id;
    private String title;
    private String content;
    private Date date;
    private int note_type;
    private int user_id;
    private int admin_id;

    public Notifications() {
    }






    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getNote_type() {
        return note_type;
    }

    public void setNote_type(int note_type) {
        this.note_type = note_type;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }
}
