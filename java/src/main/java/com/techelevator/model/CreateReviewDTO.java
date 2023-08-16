package com.techelevator.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class CreateReviewDTO {
    @NotNull
    private int reviewId;
    @NotNull
    private int rating;
    @NotEmpty
    private String description;
    @NotNull
    private int userId;
    @NotNull
    private int breweryId;

    @NotNull
    private int beerId;
    @NotNull
    private String username;

    public int getBeerId() {
        return beerId;
    }

    public void setBeerId(int beerId) {
        this.beerId = beerId;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
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

    public int getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(int breweryId) {
        this.breweryId = breweryId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
