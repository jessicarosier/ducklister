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


    @Override
    public List<Ad> selectedAd(long id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE id = '" + id + "'");

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
            if (rs.next()) {
                long adId = rs.getLong(1);
                return adId;
            } else {
                return null;
            }
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
    public long update(Ad ad) {
        try {
            Statement statement = connection.createStatement();
            String updateQuery = "UPDATE ads SET title = '" + ad.getTitle() + "', description = '" + ad.getDescription() + "' WHERE id = '" + ad.getId() + "'";
            statement.executeUpdate(updateQuery, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                long adId = rs.getLong(1);
                return adId;
            } else {
                return 0;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error updating ad.", e);
        }

    }

    @Override
    public List<Ad> adsByCategory(long id) {
        List<Ad> ads = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement
                    ("SELECT * FROM ads JOIN ads_category ON ads.id = ads_category.ad_id JOIN category ON ads_category.cat_id = category.id WHERE category.id = ?");
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ads.add(extractAd(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
        return ads;
    }

    @Override
    public void insertAdCategory(long adId, long catId) {
        try {
            String insertAdCat = "INSERT INTO ads_category (ad_id, cat_id) VALUES ('" + adId + "', '" + catId + "')";
            Statement statement = connection.createStatement();
            statement.executeUpdate(insertAdCat);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

}
