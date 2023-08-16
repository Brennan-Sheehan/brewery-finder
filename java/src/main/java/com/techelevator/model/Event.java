package com.techelevator.model;

import java.sql.Date;

public class Event {
    private int event_id;
    private int beer_id;
    private String description;
    private String title;
    private Date event_date;

    public Event(int event_id, int beer_id, String description, String title, Date event_date) {
        this.event_id = event_id;
        this.beer_id = beer_id;
        this.description = description;
        this.title = title;
        this.event_date = event_date;
    }
    public Event() {
        this.event_id = 0;
        this.beer_id = 0;
        this.description = "";
        this.title = "";
        this.event_date = null;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public int getBeer_id() {
        return beer_id;
    }

    public void setBeer_id(int beer_id) {
        this.beer_id = beer_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getEvent_date() {
        return event_date;
    }

    public void setEvent_date(Date event_date) {
        this.event_date = event_date;
    }
}
