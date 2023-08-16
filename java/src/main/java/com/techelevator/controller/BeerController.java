package com.techelevator.controller;

import com.techelevator.dao.BeerDao;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import com.techelevator.model.RegisterBeerDto;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@PreAuthorize("isAuthenticated()")
@RestController
@CrossOrigin
public class BeerController {

    private BeerDao beerDao;

    public BeerController(BeerDao beerDao) {
        this.beerDao = beerDao;
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/breweries/{id}/beers", method = RequestMethod.GET)
    public List<Beer> getBeersByBreweryId(@PathVariable int id) {
        return beerDao.getBeersByBreweryId(id);
    }
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/beers/{id}", method = RequestMethod.GET)
    public Beer getBeerById(@PathVariable int id) {
        Beer beer = beerDao.getBeerById(id);
        return beer;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/breweries/{id}/beers", method = RequestMethod.POST)
    public boolean createBeerByBreweryId(@PathVariable int id, @RequestBody RegisterBeerDto newBeer) {
        return beerDao.createBeerByBreweryId(id, newBeer);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')")
    @ResponseStatus(HttpStatus.ACCEPTED)
    @RequestMapping(path = "/breweries/{breweryId}/beers/{beerId}", method = RequestMethod.DELETE)
    public boolean deleteBeerFromBrewery(@PathVariable int breweryId, @PathVariable int beerId ) {
        return beerDao.deleteBeerFromBrewery(breweryId, beerId);
    }

    @PreAuthorize("permitAll")
    @ResponseStatus(HttpStatus.ACCEPTED)
    @RequestMapping(path = "/beers/{id}", method = RequestMethod.PUT)
    public boolean updateBeer(@Valid @PathVariable int id, @RequestBody RegisterBeerDto newBeer){
        return beerDao.updateBeer(id, newBeer);
    }

    @PreAuthorize("permitAll")
    @ResponseStatus(HttpStatus.ACCEPTED)
    @RequestMapping(path = "/beers", method = RequestMethod.GET)
    public List<Beer> getBeers(){
        return  beerDao.getBeers();
    }

    @PreAuthorize("permitAll")
    @ResponseStatus(HttpStatus.ACCEPTED)
    @RequestMapping(path = "beers/{beerId}/users/{userId}", method = RequestMethod.POST)
    public boolean addLikedBeer(@PathVariable int beerId, @PathVariable int userId){
        return beerDao.addLikedBeer(beerId, userId);
    }


    @PreAuthorize("permitAll")
    @RequestMapping(path="/users/{id}/beers", method = RequestMethod.GET)
    public List<Beer> getLikedBeers(@PathVariable int id){
        return beerDao.getLikedBeers(id);
    }


    @PreAuthorize("permitAll")
    @RequestMapping(path = "/users/{userId}/beers/{beerId}", method = RequestMethod.DELETE)
    public boolean deleteLikedBeer(@PathVariable int userId, @PathVariable int beerId) {
        return beerDao.deleteLikedBeer(userId, beerId);
    }
}
