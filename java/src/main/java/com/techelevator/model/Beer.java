package com.techelevator.model;

public class Beer {

    private double averageRating;
    private int beerId;
    private String beerName;
    private String description;
    private int rating;
    private String beerType;
    private String tastingNotes;
    private double abv;
    private String image;

    public Beer() {
    }

    public Beer(int id, String beer_name, String description, int rating, String beerType, String tastingNotes, double abv, String image, double averageRating) {
        this.beerId = id;
        this.beerName = beer_name;
        this.description = description;
        this.rating = rating;
        this.beerType = beerType;
        this.tastingNotes = tastingNotes;
        this.abv = abv;
        this.image = image;
        this.averageRating = averageRating;
    }

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    public int getBeerId() {
        return beerId;
    }

    public void setBeerId(int beerId) {
        this.beerId = beerId;
    }

    public String getBeerName() {
        return beerName;
    }

    public void setBeerName(String beerName) {
        this.beerName = beerName;
    }

    public String getDescription() {
        return this.description;
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

    public double getAbv() {
        return abv;
    }

    public void setAbv(double abv) {
        this.abv = abv;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
