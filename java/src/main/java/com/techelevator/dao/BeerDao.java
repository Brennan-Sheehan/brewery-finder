package com.techelevator.dao;

import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import com.techelevator.model.RegisterBeerDto;

import java.util.List;

public interface BeerDao {

    List<Beer> getBeersByBreweryId(int id);

    List<Beer> getBeers();

    boolean createBeerByBreweryId(int breweryId, RegisterBeerDto beer);

    boolean deleteBeerFromBrewery(int beerId, int breweryId);
    Beer getBeerById(int beerId);
    boolean updateBeer(int beerId, RegisterBeerDto beer);
    public boolean addLikedBeer(int beerId, int userId);
    public List<Beer> getLikedBeers(int userId);

    boolean deleteLikedBeer(int beerId, int userId);
}
