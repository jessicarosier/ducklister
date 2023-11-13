package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUsername(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description")
        );
    }

    @Override
    public List<Ad> selectedAd(Ad ad) {

        return null;
    }


    public List<Ad> searchAds(String searched) throws SQLException {
        String query = "SELECT * FROM ads WHERE title LIKE ? OR description LIKE ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, "%" + searched + "%");
            statement.setString(2, "%" + searched + "%");
            ResultSet rs = statement.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error searching for ads", e);
        }
//        try {
//            PreparedStatement stmt = connection.prepareStatement(query);
//            stmt.setString(1, "%" + searched + "%");
//            stmt.setString(2, "%" + searched + "%");
//            ResultSet rs = stmt.executeQuery();
//            return (createAdsFromResults(rs));
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new RuntimeException("Error finding retrieving your ad", e);
//        }
    }

    @Override
    public List<Ad> selectedAd(long id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE id = '"+ id +"'");
          
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving ad.", e);
        }
    }


    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }



    public void delete(String id) throws SQLException {
        Statement statement = connection.createStatement();
        String deleteQuery = "DELETE FROM ads WHERE id = " + id + "";
        statement.execute(deleteQuery);
    }

    @Override
    public List<Ad> getUserAds(User user) throws SQLException {
        List<Ad> userAds = new ArrayList<>();
        long id = user.getId();
        Statement statement = connection.createStatement();
        String deleteQuery = "SELECT * FROM ads WHERE user_id = '" + id + "'";
        statement.execute(deleteQuery);
        ResultSet rs = statement.getResultSet();
        while (rs.next()) {
            Ad userAd = new Ad(
                    rs.getLong("id"),
                    rs.getLong("user_id"),
                    rs.getString("title"),
                    rs.getString("description")
            );
            userAds.add(userAd);
        }
        return userAds;
    }


    //TODO: create a method that executes the update in the DB
    @Override
    public Ad update(Ad ad) throws SQLException {
        Ad updatedAd = new Ad();
        Statement statement = connection.createStatement();
        String updateQuery = "UPDATE ads SET title = '"+ad.getTitle()+"', description = '"+ad.getDescription()+ "' WHERE id = '"+ad.getId()+"'";

        statement.executeUpdate(updateQuery);


        return null;

    }

}
