package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class MySQLCategoryDao implements Categories {
    private Connection connection;

    private List<Category> categories;

    public MySQLCategoryDao(Config config) {
        try {
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
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                this.categories.add(extractCategory(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
        return null;
    }

    private Category extractCategory(ResultSet rs) throws SQLException {
        return new Category(
                rs.getLong("id"),
                rs.getString("title")
        );

    }


}
