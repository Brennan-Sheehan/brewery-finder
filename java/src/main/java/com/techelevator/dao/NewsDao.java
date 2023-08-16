package com.techelevator.dao;

import com.techelevator.model.News;

import java.sql.Date;
import java.util.List;

public interface NewsDao {
    public List<News> getAllNews();
    public boolean createNews(int breweriesId, String newsDescription, Date newsDate);
    public int deleteNewsById(int id);
}
