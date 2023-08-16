package com.techelevator.controller;
import com.techelevator.dao.EventDao;
import com.techelevator.model.Event;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;
@PreAuthorize("isAuthenticated()")
@RestController
@CrossOrigin
public class EventController {
    private EventDao eventDao;

    public EventController(EventDao eventDao) {
        this.eventDao = eventDao;
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(path = "/events", method = RequestMethod.GET)
    public List<Event> getAllEvents() {
        return eventDao.getAllEvents();
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/events", method = RequestMethod.POST)
    public boolean createEvent(@PathVariable int beerId, @RequestParam String description, @RequestParam String title, @RequestParam Date eventDate) {
        return eventDao.createEvent(beerId, description, title, eventDate);
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(path = "/events/{eventId}", method = RequestMethod.DELETE)
    public int deleteEventById(@PathVariable int eventId) {
        return eventDao.deleteEventById(eventId);
    }
}

