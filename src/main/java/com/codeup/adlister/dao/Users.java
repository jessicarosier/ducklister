package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.sql.SQLException;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);
    User findUserById(long adId);

    void updateProfile(User user) throws SQLException;
    void updatePassword(User user) throws SQLException;


    User insertProfilePic(long userId, String image);

}
