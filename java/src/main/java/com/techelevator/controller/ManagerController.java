package com.techelevator.controller;

import com.techelevator.dao.BreweryDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Brewery;
import com.techelevator.model.User;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@PreAuthorize("isAuthenticated()")
@RestController
@CrossOrigin
public class ManagerController {

    private UserDao userDao;
    private BreweryDao breweryDao;


    public ManagerController(UserDao userDao, BreweryDao breweryDao) {
        this.userDao = userDao;
        this.breweryDao = breweryDao;
    }

    @PreAuthorize("hasRole('ROLE_MANAGER')")
    @RequestMapping(path="/manager/users", method = RequestMethod.GET)
    public List<User> listOfUsers() {
        return userDao.getUsers();
    }

    @PreAuthorize("hasRole('ROLE_MANAGER')")
    @RequestMapping(path="/manager/users/{userId}", method = RequestMethod.GET)
    public User getUserById(@Valid @PathVariable int userId){
        return userDao.getUserById(userId);
    }

    @PreAuthorize("hasRole('ROLE_MANAGER')")
    @ResponseStatus(HttpStatus.ACCEPTED)
    @RequestMapping(path="/manager/breweries/{breweryId}", method = RequestMethod.PUT)
    public boolean updateBrewerByBreweryId(@Valid @PathVariable int breweryId, @RequestBody Brewery updatedBrewery){
        return breweryDao.updateBrewerByBreweryId(breweryId, updatedBrewery);
    }

    @PreAuthorize("hasRole('ROLE_MANAGER')")
    @ResponseStatus(HttpStatus.ACCEPTED)
    @RequestMapping(path="/manager/users/{userId}/{role}", method = RequestMethod.PUT)
    public boolean updateRole(@PathVariable int userId, @PathVariable String role ){
        return userDao.updateRole(userId, role);
    }

    @PreAuthorize("hasRole('ROLE_MANAGER')")
    @RequestMapping(path="/manager/breweries/{breweryId}", method = RequestMethod.DELETE)
    public boolean deleteBrewery(@Valid @PathVariable int breweryId) {
        return breweryDao.deleteBreweryById(breweryId);
    }

    @PreAuthorize("hasRole('ROLE_MANAGER')")
    @RequestMapping(path="/manager/users/{userId}", method = RequestMethod.DELETE)
    public boolean deleteUser(@Valid @PathVariable int userId) {
        return userDao.deleteUserById(userId);
    }


}
