package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Brewery;
import com.techelevator.model.RegisterBreweryDTO;
import com.techelevator.model.User;
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
public class JdbcBreweryDao implements BreweryDao {
    private final JdbcTemplate jdbcTemplate;

    public JdbcBreweryDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }



    @Override
    public List<Brewery> getBrewery() {
        List<Brewery> listOfBreweries = new ArrayList<>();
        String sql = "SELECT * FROM breweries";

        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Brewery brewery = mapRowtoBrewery(results);
                listOfBreweries.add(brewery);
            }
        } catch (DataAccessException e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Cannot get list of Breweries");
        }

        return listOfBreweries;
    }



    @Override
    public Brewery getBreweryById(int id) {
        Brewery brewery = null;
        String sql = "SELECT * FROM breweries WHERE breweries_id=?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            if (results.next()) {
                brewery = mapRowtoBrewery(results);
            }
        } catch (DataAccessException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Brewery not found");
        }
        return brewery;
    }

    @Override
    public boolean createBrewery(RegisterBreweryDTO brewery) {
        //Brewery newBrewery = null;
        String sql = "INSERT INTO breweries (brewery_name, phone_number, email_address, address, " +
                "brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating) VALUES(?,?,?,?,?,?,?,?,?,?,?,?) RETURNING breweries_id";
        try {
            int newBreweryId = jdbcTemplate.queryForObject(sql, int.class, brewery.getBreweryName(), brewery.getPhoneNumber(), brewery.getEmailAddress(),
                    brewery.getAddress(), brewery.getBreweryHistory(), brewery.getOperatingHours(), brewery.getBreweryImage(), brewery.getLongitude(),
                    brewery.getLatitude(), brewery.isFromThirdParty(), brewery.getBrewerId(), brewery.getAverageRating());
            if(newBreweryId >0) {
                return true;
            }
        } catch (DataAccessException e) {
          throw new DaoException("Unable to create brewery", e);
        }
     return false;
    }

    @Override
    public  boolean updateBrewery(int breweryId, Brewery brewery){
        String sql = "UPDATE breweries SET brewery_name=?, phone_number=?, email_address=?, address=?," +
                "brewery_history=?, operating_hours=?, brewery_image=?, longitude =?, latitude=?, from_third_party=?, brewer_id=?, average_rating=? " +
                "WHERE breweries_id=?";
        try{
            int rowsAffected = jdbcTemplate.update(sql, brewery.getBreweryName(), brewery.getPhoneNumber(), brewery.getEmailAddress(),
            brewery.getAddress(), brewery.getBreweryHistory(), brewery.getOperatingHours(),
            brewery.getBreweryImage(), brewery.getLongitude(), brewery.getLatitude(), brewery.isFromThirdParty(), brewery.getBrewerId(), brewery.getAverageRating(), breweryId);
            return rowsAffected != 0;
        }catch (DataAccessException e){
            throw new DaoException("Cannot update brewery",e);
        }
    }

    public Brewery getBreweryByBrewerId(int brewerId) {
        Brewery brewery = new Brewery();
        String sql = "SELECT * FROM breweries WHERE brewer_id = ?";

        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, brewerId);
            if (results.next()) {
                brewery = mapRowtoBrewery(results);
            }
        } catch (DataAccessException e) {
            throw new DaoException("Cannot get brewery by brewer Id", e);
        }
        return brewery;
    }

@Override
public boolean addLikedBrewery(int breweryId, int userId){

        String sql = "INSERT INTO liked (breweries_id, user_id)" +
                " VALUES (?,?)";
    try {
        int rowsAffected = jdbcTemplate.update(sql, breweryId, userId);

            return rowsAffected != 0;

    } catch (DataAccessException e) {
        throw new DaoException("Unable to add liked brewery", e);
    }
}

    @Override
    public boolean deleteLikedBrewery(int userId, int breweriesId){
        String sql = "DELETE FROM liked WHERE user_id=? " +
                "AND  breweries_id=?";
        try {
            int numberOfRows = jdbcTemplate.update(sql,userId, breweriesId);
            return numberOfRows != 0;
        }catch (DataIntegrityViolationException e){
            throw new DataIntegrityViolationException("Cannot find brewery", e);
        }
    }

    @Override
    public List<Brewery> getLikedBreweries(int userId) {
        List<Brewery> likedBreweries = new ArrayList<>();

        String sql = "SELECT breweries_id FROM liked WHERE user_id = ? AND breweries_id IS NOT NULL";

        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);

            while (results.next()) {
                int breweryId = results.getInt("breweries_id");
                Brewery brewery = getBreweryById(breweryId);
                likedBreweries.add(brewery);
            }
        } catch (DataAccessException e) {
            throw new DaoException("Cannot get liked breweries by user Id", e);
        }

        return likedBreweries;

    }
    @Override
    public boolean updateBrewerByBreweryId(int breweryId, Brewery brewery){
        String sql = "UPDATE breweries SET brewer_id = ? WHERE breweries_id = ?";
        try{
            int rowsAffected = jdbcTemplate.update(sql, brewery.getBrewerId(), breweryId);
            return rowsAffected !=0;
        } catch (DataAccessException e) {
            throw new DaoException("Cannot change brewerId", e);
        }
    }
    @Override
    public boolean deleteBreweryById(int breweryId) {
        String breweryBeerSql = "DELETE FROM breweries_beers WHERE breweries_beers.breweries_id =?";
        String reviewSql = "DELETE FROM reviews WHERE breweries_id =?";
        String likedSql = "DELETE FROM liked WHERE breweries_id = ?";
        String sql = "DELETE FROM breweries WHERE breweries_id =?";
        try{
            jdbcTemplate.update(breweryBeerSql, breweryId);
            jdbcTemplate.update(reviewSql, breweryId);
            jdbcTemplate.update(likedSql, breweryId);
            int rowsAffected = jdbcTemplate.update( sql, breweryId);
            return rowsAffected != 0;
        } catch (DataAccessException e) {
            throw new DaoException("Cannot delete brewery", e);
        }
    }

   // switched order of brewerId and average rating to reflect the database
    private Brewery mapRowtoBrewery(SqlRowSet rs) {
        Brewery brewery = new Brewery();
        brewery.setBreweryId(rs.getInt("breweries_id"));
        brewery.setBreweryName(rs.getString("brewery_name"));
        brewery.setPhoneNumber(rs.getString("phone_number"));
        brewery.setEmailAddress(rs.getString("email_address"));
        brewery.setAddress(rs.getString("address"));
        brewery.setBreweryHistory(rs.getString("brewery_history"));
        brewery.setOperatingHours(rs.getString("operating_hours"));
        brewery.setBreweryImage(rs.getString("brewery_image"));
        brewery.setLongitude(rs.getString("longitude"));
        brewery.setLatitude(rs.getString("latitude"));
        brewery.setFromThirdParty(rs.getBoolean("from_third_party"));
        brewery.setBrewerId(rs.getInt("brewer_id"));
        brewery.setAverageRating(rs.getDouble("average_rating"));

        return brewery;
    }
}
