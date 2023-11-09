package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.AdCat;

import java.sql.SQLException;
import java.util.List;

public interface AdCats {

    List<AdCat> all();

    Long insert(AdCat adcat);

    void delete(String id) throws SQLException;
}
