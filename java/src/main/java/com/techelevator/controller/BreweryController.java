package com.techelevator.controller;

import com.techelevator.dao.BreweryDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Brewery;
import com.techelevator.model.RegisterBreweryDTO;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@PreAuthorize("isAuthenticated()")
@RestController
@CrossOrigin
public class BreweryController {

private BreweryDao breweryDao;


    public BreweryController(BreweryDao breweryDao, UserDao userDao) {
        this.breweryDao = breweryDao;

    }
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/breweries", method = RequestMethod.GET)
    public List<Brewery> listOfBreweries() {
        return breweryDao.getBrewery();
    }
    @PreAuthorize("permitAll")
    @RequestMapping(path="/breweries/{id}", method = RequestMethod.GET)
    public Brewery getBreweryById(@PathVariable int id){
        return breweryDao.getBreweryById(id);
    }
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/breweries",method = RequestMethod.POST)
    public boolean createBrewery(@Valid @RequestBody RegisterBreweryDTO newBrewery){
        return breweryDao.createBrewery(newBrewery);
    }
    @PreAuthorize("permitAll")
    @ResponseStatus(HttpStatus.ACCEPTED)
    @RequestMapping(path = "/breweries/{id}", method = RequestMethod.PUT)
    public boolean updateBrewery(@Valid @PathVariable int id,@RequestBody Brewery updatedBrewery){
        return breweryDao.updateBrewery(id, updatedBrewery);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')")
    @ResponseStatus(HttpStatus.ACCEPTED)
    @RequestMapping(path = "/breweries/brewer/{id}", method = RequestMethod.GET)
    public Brewery getBreweryByBrewerId(@Valid @PathVariable int id){
        return breweryDao.getBreweryByBrewerId(id);
    }

    @PreAuthorize("permitAll")
    @ResponseStatus(HttpStatus.ACCEPTED)
    @RequestMapping(path = "breweries/{brewId}/users/{userId}", method = RequestMethod.POST)
    public boolean addLikedBrewery(@PathVariable int brewId, @PathVariable int userId){
        return breweryDao.addLikedBrewery(brewId, userId);
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path="/users/{id}/breweries", method = RequestMethod.GET)
    public List<Brewery> getLikedBreweries(@PathVariable int id){
        return breweryDao.getLikedBreweries(id);
    }


    @PreAuthorize("permitAll")
    @RequestMapping(path = "/users/{userId}/breweries/{breweryId}", method = RequestMethod.DELETE)
    public boolean deleteLikedBrewery(@PathVariable int userId, @PathVariable int breweryId) {
        return breweryDao.deleteLikedBrewery(userId, breweryId);
    }
}


