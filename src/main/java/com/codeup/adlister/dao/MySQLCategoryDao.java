package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.mysql.cj.jdbc.Driver;


public class MySQLCategoryDao implements Categories {
    private Connection connection;

    private List<Category> categories;

    public MySQLCategoryDao(Config config) {
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
    public List<Category> all() {
        try {
            this.categories = new ArrayList<>();
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM category");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                this.categories.add(extractCategory(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
        return categories;
    }

    @Override
    public String getCategoryName(long id) {
        String catName = "";
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT cat_title FROM category WHERE id = ?");
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                catName = rs.getString("cat_title");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving category title.", e);
        }
        return catName;
    }

    @Override
    public List<Category> getCategoriesByAdId(long id) {
        List<Category> categories = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM category JOIN ads_category ON category.id = ads_category.cat_id WHERE ads_category.ad_id = ?");
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                categories.add(extractCategory(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving category title.", e);
        }
        return categories;
    }


    private Category extractCategory(ResultSet rs) throws SQLException {
        return new Category(
                rs.getLong("id"),
                rs.getString("cat_title")
        );

    }


}
