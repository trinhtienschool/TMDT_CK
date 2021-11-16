package vn.thegioicaycanh.model.feeback;


import java.util.Date;

public class Feedback {
    private String email;
    private String name;
    private String content;
    private Date date_created;

    public Feedback() {
    }

    public Feedback(String email, String name, String content) {
        this.email = email;
        this.name = name;
        this.content = content;
        this.date_created = new Date();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }
}
