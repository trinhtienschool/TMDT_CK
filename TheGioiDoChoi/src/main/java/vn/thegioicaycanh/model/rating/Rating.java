package vn.thegioicaycanh.model.rating;

import java.util.Date;

public class Rating {
    private int id;
    private int user_id;
    private int pro_id;
    private String comment;
    private int rating_type_id;
    private Date date_created;

    public Rating() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRating_type_id() {
        return rating_type_id;
    }

    public void setRating_type_id(int rating_type_id) {
        this.rating_type_id = rating_type_id;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }
    public static String getNameById(int id){
        String result=Rating_Con_DB.getNameUserById(id);
        return result;
    }
    public static String getNameRatingById(int id){
        String result=Rating_Con_DB.getNameRatingTypeById(id);
        return result;
    }
    public static String getAvatarUserById(int id){
        String result=Rating_Con_DB.getImgaeUserById(id);
        return result;
    }

    public static void main(String[] args) {
        System.out.println(getAvatarUserById(1));
    }
}
