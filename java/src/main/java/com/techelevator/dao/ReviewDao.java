package com.techelevator.dao;

import com.techelevator.model.CreateReviewDTO;
import com.techelevator.model.Review;

import java.util.List;

public interface ReviewDao {

    List<Review> getReviewByBeerId(int id);
    List<Review> getReviewByBreweryId(int id);
    boolean createReviewByBeerId(CreateReviewDTO review, int beerId);
    boolean createReviewByBreweryId(CreateReviewDTO review, int breweryId);

}
