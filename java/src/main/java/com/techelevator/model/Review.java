package com.techelevator.model;

public class Review {

    private int id;
    private int rating;
    private String description;
    private int userId;
    private int breweriesId;
    private String username;
    public Review(int id, int rating, String description, int userId, int breweriesId, String username) {
        this.id = id;
        this.rating = rating;
        this.description = description;
        this.userId = userId;
        this.breweriesId = breweriesId;
        this.username = username;
    }

    public Review() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBreweriesId() {
        return breweriesId;
    }

    public void setBreweriesId(int breweriesId) {
        this.breweriesId = breweriesId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
