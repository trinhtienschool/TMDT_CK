package vn.thegioicaycanh.model.notifications;

import java.util.Date;

public class Notifications {
    private int id;
    private String email;
    private Date date;
    private int status;

    public Notifications() {
    }

    public String getEmail() {
        return email;
    }
    public String getListEmail(){
        return Notification_Con_DB.getStringsNotifications();
    }

    public void setEmail(String email) {
        this.email = email;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Notifications{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", date=" + date +
                ", status=" + status +
                '}';
    }
}
