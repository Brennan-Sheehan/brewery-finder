package com.techelevator.model;

import java.sql.Date;

public class News {
    private int news_id;
    private String description;
    private Date news_date;

    public News(int news_id, String description, Date news_date) {
        this.news_id = news_id;
        this.description = description;
        this.news_date = news_date;
    }
    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getNews_date() {
        return news_date;
    }

    public void setNews_date(Date news_date) {
        this.news_date = news_date;
    }
}
