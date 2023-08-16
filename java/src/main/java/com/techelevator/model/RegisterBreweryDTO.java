package com.techelevator.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class RegisterBreweryDTO {

    @NotNull
    private double averageRating;
    @NotEmpty
    private String breweryName;
    @NotEmpty
    private String phoneNumber;

    private String emailAddress;
    @NotEmpty
    private String address;
    @NotEmpty
    private String breweryHistory;

    private String operatingHours;

    private String breweryImage;
    @NotNull
    private int brewerId;

    private String longitude;
    private String latitude;
    private boolean fromThirdParty;

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    public String getBreweryName() {
        return breweryName;
    }

    public void setBreweryName(String breweryName) {
        this.breweryName = breweryName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public int getBrewerId() {
        return brewerId;
    }

    public void setBrewerId(int brewerId) {
        this.brewerId = brewerId;
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
