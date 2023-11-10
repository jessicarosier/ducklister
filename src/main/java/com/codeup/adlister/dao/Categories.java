package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import java.util.List;
import java.util.SplittableRandom;

public interface Categories {

    List<Category> all();

    String getCategoryName(long id);

}
