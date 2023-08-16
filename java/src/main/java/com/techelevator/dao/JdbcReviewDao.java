package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.CreateReviewDTO;
import com.techelevator.model.Review;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcReviewDao implements ReviewDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcReviewDao( JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    @Override
    public List<Review> getReviewByBeerId(int id) {
        List<Review> listOfReviews = new ArrayList<>();
        String sql = "SELECT * FROM reviews JOIN beers_reviews ON reviews.review_id = beers_reviews.review_id WHERE beer_id = ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            while (results.next()) {
                Review review = mapRowToReview(results);
                listOfReviews.add(review);
            }
        }catch(DataAccessException e){
            throw new DaoException("Cannot get list of reviews", e);
        }

        return listOfReviews;
    }

    @Override
    public List<Review> getReviewByBreweryId(int id) {
        List<Review> listOfReviews = new ArrayList<>();
        String sql = "SELECT * FROM reviews WHERE breweries_id = ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            while (results.next()) {
                Review review = mapRowToReview(results);
                listOfReviews.add(review);
            }
        }catch(DataAccessException e){
            throw new DaoException("Cannot get list of reviews", e);
        }

        return listOfReviews;

    }

    @Override
    public boolean createReviewByBeerId(CreateReviewDTO review, int beerID) {

        String sql = "INSERT INTO reviews (rating, description, user_id, username)" +
                "VALUES(?, ?, ?, ?) returning review_id";
        String joinSql = "INSERT INTO beers_reviews (review_id, beer_id)" +
                "VALUES(?,?) returning review_id";

        try {
            int newReviewId = jdbcTemplate.queryForObject(sql, int.class, review.getRating(), review.getDescription(), review.getUserId(), review.getUsername());
            int newBeerReviewId = jdbcTemplate.queryForObject(joinSql, int.class, newReviewId, beerID);

            if (newReviewId > 0 && newBeerReviewId > 0) {
                return true;
            }
        }catch(DataAccessException e){
            throw new DaoException("Could not create review for Beer", e);
        }
        return false;
    }

    @Override
    public boolean createReviewByBreweryId(CreateReviewDTO review, int breweryId) {
        String sql = "INSERT INTO reviews (rating, description, user_id, breweries_id, username)" +
                "VALUES(?, ?, ?, ?, ?) returning review_id";

        try {
            int newReviewId = jdbcTemplate.queryForObject(sql, int.class, review.getRating(), review.getDescription(), review.getUserId(), breweryId, review.getUsername());
            if (newReviewId > 0) {
                return true;
            }
        }catch(DataAccessException e){
            throw new DaoException("Could not create review for Brewery", e);
        }
        return false;
    }

    private Review mapRowToReview(SqlRowSet rs) {
        Review review = new Review();
        review.setId(rs.getInt("review_id"));
        review.setRating(rs.getInt("rating"));
        review.setDescription(rs.getString("description"));
        review.setUserId(rs.getInt("user_id"));
        review.setBreweriesId(rs.getInt("breweries_id"));
        review.setUsername(rs.getString("username"));

        return review;
    }
}
