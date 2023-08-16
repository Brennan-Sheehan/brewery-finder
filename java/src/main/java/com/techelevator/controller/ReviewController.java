package com.techelevator.controller;

import com.techelevator.dao.BeerDao;
import com.techelevator.dao.ReviewDao;
import com.techelevator.model.CreateReviewDTO;
import com.techelevator.model.Review;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@PreAuthorize("isAuthenticated()")
@RestController
@CrossOrigin
public class ReviewController {
    private ReviewDao reviewDao;

    public ReviewController(ReviewDao reviewDao) {
        this.reviewDao = reviewDao;
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/beers/{beerId}/reviews", method = RequestMethod.GET)//doesn't work
    public List<Review> listReviewsByBeerId(@PathVariable int beerId) {
        return reviewDao.getReviewByBeerId(beerId);
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/breweries/{breweryId}/reviews", method = RequestMethod.GET)//works
    public List<Review> listReviewsByBreweryId(@PathVariable int breweryId) {
        return reviewDao.getReviewByBreweryId(breweryId);
    }

//    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @PreAuthorize("permitAll")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/beers/{beerId}/reviews", method = RequestMethod.POST)
    public boolean createReviewByBeerId(@PathVariable int beerId, @RequestBody CreateReviewDTO review) {
        return reviewDao.createReviewByBeerId(review, beerId);

    }

//    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @PreAuthorize("permitAll")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/breweries/{breweryId}/reviews", method = RequestMethod.POST)
    public boolean createReviewByBreweryId(@PathVariable int breweryId, @RequestBody CreateReviewDTO review) {
        return reviewDao.createReviewByBreweryId(review, breweryId);

    }
}