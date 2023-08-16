package com.techelevator.dao;

import com.techelevator.model.Brewery;
import com.techelevator.model.RegisterBreweryDTO;

import java.util.List;

public interface BreweryDao {
    List<Brewery> getBrewery();
    Brewery getBreweryById(int id);
    boolean createBrewery(RegisterBreweryDTO brewery);
    boolean updateBrewery(int breweryId, Brewery brewery);
    Brewery getBreweryByBrewerId(int brewerId);

    boolean addLikedBrewery(int breweryId, int userId);
    public List<Brewery> getLikedBreweries(int userId);

    boolean deleteBreweryById(int breweryId);

    public boolean deleteLikedBrewery(int userId, int breweriesId);

    boolean updateBrewerByBreweryId(int breweryId, Brewery brewery);

}
