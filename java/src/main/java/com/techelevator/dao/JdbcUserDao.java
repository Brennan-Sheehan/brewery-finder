package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import com.techelevator.exception.DaoException;
import com.techelevator.model.*;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class JdbcUserDao implements UserDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcUserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public User getUserById(int userId) {
        User user = null;
        String sql = "SELECT user_id, username, password_hash, role, email_address, request FROM users WHERE user_id = ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
            if (results.next()) {
                user = mapRowToUser(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return user;
    }

    @Override
    public List<User> getUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT user_id, username, password_hash, role, email_address, request FROM users";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                User user = mapRowToUser(results);
                users.add(user);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return users;
    }

    @Override
    public User getUserByUsername(String username) {
        if (username == null) throw new IllegalArgumentException("Username cannot be null");
        User user = null;
        String sql = "SELECT user_id, username, password_hash, role, email_address, request FROM users WHERE username = ?;";
        try {
            SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql, username);
            if (rowSet.next()) {
                user = mapRowToUser(rowSet);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return user;
    }



    @Override
    public User createUser(RegisterUserDto user) {
        User newUser = null;
        String insertUserSql = "INSERT INTO users (username, password_hash, role, email_address, request) values (?, ?, ?, ?, ?) RETURNING user_id";
        String password_hash = new BCryptPasswordEncoder().encode(user.getPassword());
        String ssRole = user.getRole().toUpperCase().startsWith("ROLE_") ? user.getRole().toUpperCase() : "ROLE_" + user.getRole().toUpperCase();
        try {
            int newUserId = jdbcTemplate.queryForObject(insertUserSql, int.class, user.getUsername(), password_hash, ssRole, user.getEmail(), user.isRequest());
            newUser = getUserById(newUserId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return newUser;
    }

//    @Override
//    public boolean updateRoleByUserId(int userId, UserDto user) {
//        String sql = "UPDATE users SET role = ? WHERE user_id = ?";
////        String userName = "";
////        Set<Authority> userAuthorities = user.getAuthorities();
////        for (Authority authority : userAuthorities) {
////           userName = authority.getName();
////        }
//        try{
//            int rowsAffected = jdbcTemplate.update(sql, user.getRole(), userId);
//            return rowsAffected != 0;
//        } catch (DataAccessException e) {
//            throw new DaoException("Cannot change role", e);
//        }
//    }



    @Override
    public boolean updateRole(int userId, String role) {
        String sql = "UPDATE users SET role = ? WHERE user_id = ?";
        try {
            int rowsAffected = jdbcTemplate.update(sql, role, userId);
            return rowsAffected != 0;
        } catch (DataAccessException e) {
            throw new DaoException("Cannot change role", e);
        }
    }

    @Override
    public boolean deleteUserById(int userId) {
        String sql = "DELETE FROM users WHERE user_id =?";
        try {
            int rowsAffected = jdbcTemplate.update(sql, userId);
            return rowsAffected != 0;
        }catch (DataAccessException e) {
            throw new DaoException("Cannot delete user", e);
        }
    }


    private User mapRowToUser(SqlRowSet rs) {
        User user = new User();
        user.setId(rs.getInt("user_id"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password_hash"));
        user.setAuthorities(Objects.requireNonNull(rs.getString("role")));
        user.setEmail(rs.getString("email_address"));
        user.setRequest(rs.getBoolean("request"));
        user.setActivated(true);
        return user;
    }
}
