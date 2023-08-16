package com.techelevator.dao;

import com.techelevator.model.Event;

import java.sql.Date;
import java.util.List;

public interface EventDao {
    public List<Event> getAllEvents();
    public boolean createEvent(int beerId, String description, String title, Date eventDate);
    public int deleteEventById(int id);
}
