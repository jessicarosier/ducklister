package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import java.sql.SQLException;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();

    //get a single ad
    List<Ad> selectedAd(Ad ad);
    List<Ad> searchAds(String keywords) throws SQLException;

    List<Ad> selectedAd(long adId) throws SQLException;
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    void delete(String id) throws SQLException;

    public List<Ad> getUserAds(User user) throws SQLException;

    Ad update(Ad ad) throws SQLException;

}
