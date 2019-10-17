package ru.itis.web_project.models;

import java.sql.Date;

public class BookReview {
    private Integer id;
    private Integer id_user;
    private String message;
    private Integer raiting;
    private Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId_user() {
        return id_user;
    }

    public void setId_user(Integer id_user) {
        this.id_user = id_user;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getRaiting() {
        return raiting;
    }

    public void setRaiting(Integer raiting) {
        this.raiting = raiting;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
