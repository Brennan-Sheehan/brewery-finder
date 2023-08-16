package com.techelevator.model;

public class Brewery {

    private int breweryId;
    private String breweryName;
    private String review;
    private String breweryHistory;
    private String operatingHours;
    private String breweryImage;
    private String address;
    private int brewerId;
    private String emailAddress;
    private String phoneNumber;
    private String longitude;
    private String latitude;
    private boolean fromThirdParty;
    private double averageRating;

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    public void setBrewerId(int brewerId) {
        this.brewerId = brewerId;
    }

    public int getBrewerId() {
        return brewerId;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
public Brewery(){};
    public Brewery(int breweryId, String name, String review, String breweryHistory, String operatingHours, String breweryImage, String address, int brewerId, double averageRating) {
        this.breweryId = breweryId;
        this.breweryName = name;

        this.review = review;
        this.breweryHistory = breweryHistory;
        this.operatingHours = operatingHours;
        this.breweryImage = breweryImage;
        this.address = address;
        this.brewerId = brewerId;
        this.averageRating = averageRating;
    }

    public int getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(int breweryId) {
        this.breweryId = breweryId;
    }

    public String getBreweryName() {
        return breweryName;
    }

    public void setBreweryName(String breweryName) {
        this.breweryName = breweryName;
    }


    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public String getBreweryHistory() {
        return breweryHistory;
    }

    public void setBreweryHistory(String breweryHistory) {
        this.breweryHistory = breweryHistory;
    }

    public String getOperatingHours() {
        return operatingHours;
    }

    public void setOperatingHours(String operatingHours) {
        this.operatingHours = operatingHours;
    }

    public String getBreweryImage() {
        return breweryImage;
    }

    public void setBreweryImage(String breweryImage) {
        this.breweryImage = breweryImage;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public boolean isFromThirdParty() {
        return fromThirdParty;
    }

    public void setFromThirdParty(boolean fromThirdParty) {
        this.fromThirdParty = fromThirdParty;
    }
}
