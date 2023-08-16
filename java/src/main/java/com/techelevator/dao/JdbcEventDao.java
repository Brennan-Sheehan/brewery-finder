package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Event;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcEventDao implements EventDao {
    private final JdbcTemplate jdbcTemplate;
    public JdbcEventDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Event> getAllEvents() {
        List<Event> listOfEvents = new ArrayList<>();
        String sql = "SELECT * FROM event;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                int event_id = results.getInt("event_id");
                int beer_id = results.getInt("beer_id");
                String description = results.getString("description");
                String title = results.getString("title");
                Date event_date = results.getDate("event_date");
                Event  event = new Event(event_id,beer_id,description,
                        title,event_date);
                listOfEvents.add(event);
            }
        } catch(DataAccessException e) {
            throw new DaoException("Cannot access events", e);
        }
        return listOfEvents;
    }
    @Override
    public boolean createEvent(int beerId, String description, String title, Date eventDate) {
        String sql = "INSERT INTO event (beer_id, description, title, event_date) VALUES (?, ?, ?, ?)";
        try {
            int newEventId = jdbcTemplate.queryForObject(sql, int.class, beerId, description, title, eventDate);
            return true;
        } catch(DataAccessException e) {
            throw new DaoException("Could not create event", e);
        }

    }
    @Override
    public int deleteEventById(int id) {
        String sql = "DELETE FROM event WHERE event_id = ?; ";
        try {
            int idOfDeleted = jdbcTemplate.queryForObject(sql, int.class, id);
            return idOfDeleted;
        } catch(DataAccessException e) {
            throw new DaoException("Failed to delete", e);
        }

    }
}
