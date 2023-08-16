package com.techelevator.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class RegisterBeerDto {
    @NotNull
    private double averageRating;

    @NotEmpty
    private String beerName;

    private String beerId;

    @NotEmpty
    private String description;

    @NotNull // had to change annotation for numeric values
    private int rating;

    @NotEmpty
    private String beerType;

    @NotEmpty
    private String tastingNotes;

    @NotNull // had to change annotation for numeric values
    private Double abv;


    @NotEmpty
    private String image;

    public String getBeerName() {
        return beerName;
    }

    public void setBeerName(String beerName) {
        this.beerName = beerName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getBeerType() {
        return beerType;
    }

    public void setBeerType(String beerType) {
        this.beerType = beerType;
    }

    public String getTastingNotes() {
        return tastingNotes;
    }

    public void setTastingNotes(String tastingNotes) {
        this.tastingNotes = tastingNotes;
    }

    public Double getAbv() {
        return abv;
    }

    public void setAbv(Double abv) {
        this.abv = abv;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBeerId() {
        return beerId;
    }

    public void setBeerId(String beerID) {
        this.beerId = beerID;
    }

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }
}
