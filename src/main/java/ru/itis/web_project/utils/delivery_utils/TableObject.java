package ru.itis.web_project.utils.delivery_utils;

import java.sql.Date;

public class TableObject {
    private String name_dish;
    private Integer count_id_menu;
    private Integer price;
    private Date date;
    private Integer id_menu;

    public Integer getId_menu() {
        return id_menu;
    }

    public void setId_menu(Integer id_menu) {
        this.id_menu = id_menu;
    }

    public String getName_dish() {
        return name_dish;
    }

    public void setName_dish(String name_dish) {
        this.name_dish = name_dish;
    }

    public Integer getCount_id_menu() {
        return count_id_menu;
    }

    public void setCount_id_menu(Integer count_id_menu) {
        this.count_id_menu = count_id_menu;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Date getDate() {
        return date;
    }

    @Override
    public String toString() {
        return "TableObject{" +
                "name_dish='" + name_dish + '\'' +
                ", count_id_menu=" + count_id_menu +
                ", price=" + price +
                ", date=" + date +
                ", id_menu=" + id_menu +
                '}';
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
