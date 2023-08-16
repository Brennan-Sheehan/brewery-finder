package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.News;
import com.techelevator.model.Review;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcNewsDao implements NewsDao {
    private JdbcTemplate jdbcTemplate;
    public JdbcNewsDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public List<News> getAllNews() {
        System.out.println("getting news");
        List<News> listOfNews = new ArrayList<>();
        String sql = "SELECT * FROM news;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                int news_id = results.getInt("news_id");
                String news_description = results.getString("news_description");
                Date news_date = results.getDate("news_date");
                News news = new News(news_id, news_description, news_date);
                listOfNews.add(news);
            }
        } catch(DataAccessException e) {
            throw new DaoException("Cannot get list of news", e);
        }
        return listOfNews;
    }
    @Override
    public boolean createNews(int breweriesId, String newsDescription, Date newsDate) {
        String sql = "INSERT INTO news (breweries_id, news_description, news_date) VALUES (? ,? ,?); ";
        try {
            jdbcTemplate.queryForObject(sql, int.class, breweriesId, newsDescription, newsDate);
            return true;
        }catch(DataAccessException e) {
            throw new DaoException("Failed to create new news", e);
        }
    }
    @Override
    public int deleteNewsById(int id) {
        String sql = "DELETE FROM news WHERE news_id = ?; ";
        try {
            return jdbcTemplate.queryForObject(sql, int.class, id);
        } catch(DataAccessException e) {
            throw new DaoException("Failed to delete news",e);
        }
    }

}
