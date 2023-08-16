package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import com.techelevator.model.RegisterBeerDto;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBeerDao implements BeerDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcBeerDao(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Beer> getBeersByBreweryId(int id) {
        List<Beer> listOfBeers = new ArrayList<>();
        String sql = "SELECT * FROM beers JOIN breweries_beers ON beers.beer_id = breweries_beers.beer_id WHERE breweries_beers.breweries_id = ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            while(results.next()) {
                Beer beer = mapRowToBeer(results);
                listOfBeers.add(beer);
            }
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Cannot find list of beers");
        }
        return listOfBeers;
    }

    @Override
    public List<Beer> getBeers(){
        List<Beer> listOfBeers = new ArrayList<>();
        String sql = "SELECT * FROM beers";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Beer beer = mapRowToBeer(results);
                listOfBeers.add(beer);
            }
        } catch (DataAccessException e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Cannot get list of Beers");
        }
        return listOfBeers;
    }

    @Override
    public Beer getBeerById(int beerId){
        Beer beer = null;
        String sql = "SELECT * FROM beers where beer_id=?";
        try{
            SqlRowSet result = jdbcTemplate.queryForRowSet(sql, beerId);
            if (result.next()){
                beer = mapRowToBeer(result);
            }
        } catch (Exception e){
            throw new DaoException("Cannot find beer", e);
        }
        return beer;
    }



    @Override
    public boolean createBeerByBreweryId(int breweryId, RegisterBeerDto beer) {

        String sql = "INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, average_rating, image)" +
                "VALUES (?, ?, ?, ?, ?, ?,?, ?) RETURNING beer_id";
        String joinSql = "INSERT INTO breweries_beers (breweries_id, beer_id)" +
                "VALUES(?, ?) returning beer_id";
        try {
            int newBeerId = jdbcTemplate.queryForObject(sql, int.class, beer.getBeerName(), beer.getDescription(), beer.getRating(),
                        beer.getBeerType(), beer.getTastingNotes(), beer.getAbv(),beer.getAverageRating(), beer.getImage());
            int newBreweryBeer = jdbcTemplate.queryForObject(joinSql, int.class, breweryId, newBeerId);
            if (newBeerId > 0 && newBreweryBeer > 0) {
                return true;
            }
        } catch (Exception e){
            throw new DaoException("Unable to create beer", e); 
        }
        return false;
    }

    @Override
    public boolean updateBeer(int beerId, RegisterBeerDto beer){

        String sql = "UPDATE beers SET average_rating = ? WHERE beer_id = ?";
    try{
        int rowsAffected = jdbcTemplate.update(sql, beer.getAverageRating(), beerId);
        return rowsAffected != 0;
    }catch (DataAccessException e){
        throw  new DaoException("Cannot update beer", e);
    }
    }


    @Override
    public boolean deleteBeerFromBrewery(int breweryId, int beerId){
        String sql = "DELETE FROM breweries_beers WHERE breweries_id=? " +
                "AND  beer_id=?";
        try {
            int numberOfRows = jdbcTemplate.update(sql,breweryId, beerId);
            return numberOfRows != 0;
        }catch (DataIntegrityViolationException e){
            throw new DataIntegrityViolationException("Cannot find beer", e);
        }
    }
    @Override
    public boolean addLikedBeer(int beerId, int userId){

        String sql = "INSERT INTO liked (beer_id, user_id)" +
                " VALUES (?,?)";
        try {
            int rowsAffected = jdbcTemplate.update(sql, beerId, userId);

            return rowsAffected != 0;

        } catch (DataAccessException e) {
            throw new DaoException("Unable to add liked beer", e);
        }
    }

    @Override
    public boolean deleteLikedBeer(int userId, int beerId){
        String sql = "DELETE FROM liked WHERE user_id=? " +
                "AND  beer_id=?";
        try {
            int numberOfRows = jdbcTemplate.update(sql,userId, beerId);
            return numberOfRows != 0;
        }catch (DataIntegrityViolationException e){
            throw new DataIntegrityViolationException("Cannot find beer", e);
        }
    }
    @Override
    public List<Beer> getLikedBeers(int userId) {
        List<Beer> likedBeers = new ArrayList<>();

        String sql = "SELECT beer_id FROM liked WHERE user_id = ? AND beer_id IS NOT NULL";

        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);

            while (results.next()) {
                int beerId = results.getInt("beer_id");
                Beer beer = getBeerById(beerId);
                likedBeers.add(beer);
            }
        } catch (DataAccessException e) {
            throw new DaoException("Cannot get liked beers by user Id", e);
        }

        return likedBeers;
    }


    private Beer mapRowToBeer(SqlRowSet rs) {
        Beer beer = new Beer();
        beer.setBeerId(rs.getInt("beer_id"));
        beer.setBeerName(rs.getString("beer_name"));
        beer.setDescription(rs.getString("description"));
        beer.setRating(rs.getInt("rating"));
        beer.setBeerType(rs.getString("beer_type"));
        beer.setTastingNotes(rs.getString("tasting_notes"));
        beer.setAbv(rs.getDouble("abv"));
        beer.setImage(rs.getString("image"));
        beer.setAverageRating(rs.getDouble("average_rating"));
        return beer;
    }
}
