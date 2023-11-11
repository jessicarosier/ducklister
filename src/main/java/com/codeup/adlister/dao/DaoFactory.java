package com.codeup.adlister.dao;

import com.codeup.adlister.models.AdCat;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.Comment;

import java.sql.SQLException;


public class DaoFactory {
    private static Ads adsDao;
    private static Users usersDao;

    private static Categories categoriesDao;

    private static Comments commentsDao;

    private static Config config = new Config();

    public static Ads getAdsDao() {
        if (adsDao == null) {
            adsDao = new MySQLAdsDao(config);
        }
        return adsDao;
    }

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new MySQLUsersDao(config);
        }
        return usersDao;
    }

    public static Categories getCategoriesDao() {
        if (categoriesDao == null) {
            categoriesDao = new MySQLCategoryDao(config);
        }
        return categoriesDao;
    }

    public static Comments getCommentsDao() {
        if (commentsDao == null) {
            commentsDao = new MySQLCommentsDao(config);
        }
        return commentsDao;
    }


}
