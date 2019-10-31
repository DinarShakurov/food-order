package ru.itis.web_project.models;

import java.sql.Date;

public class DeliverOrder {
    private Integer id;
    private Integer id_user;
    private Date date;
    private Integer id_menu;
    private Integer count_id_menu;
    private String stringDate;

    public Integer getCount_id_menu() {
        return count_id_menu;
    }

    public void setCount_id_menu(Integer count_id_menu) {
        this.count_id_menu = count_id_menu;
    }

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

    public Date getDate() {
        return date;
    }


    public String getStringDate() {
        return stringDate;
    }

    public void setDate(Date date) {
        this.stringDate = "";
        String[] str = date.toString().split("-");

        for (int i = str.length - 1; i >= 0; i--) {
            if (i == 0) {
                this.stringDate = stringDate + str[i];
            } else {
                this.stringDate = this.stringDate + str[i] + ".";
            }
        }
        this.date = date;
    }

    public Integer getId_menu() {
        return id_menu;
    }

    public void setId_menu(Integer id_menu) {
        this.id_menu = id_menu;
    }



}
