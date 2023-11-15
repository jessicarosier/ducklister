package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/update")
public class UpdateAdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long adId = Long.valueOf(request.getParameter("ad"));

        //TODO: call method to get the ad category where the ad ID = adID,
        List<Category> categoryList = DaoFactory.getCategoriesDao().getCategoriesByAdId(adId);

        //loops through the list of categories and sets the attribute for each category that is not null
        for (int i = 0; i < categoryList.size(); i++) {
            if (categoryList.get(i).getId() == 1) {
                request.setAttribute("generic", categoryList.get(i).getId());
            } else if (categoryList.get(i).getId() == 2) {
                request.setAttribute("music", categoryList.get(i).getId());
            } else if (categoryList.get(i).getId() == 3) {
                request.setAttribute("sports", categoryList.get(i).getId());
            } else if (categoryList.get(i).getId() == 4) {
                request.setAttribute("seasonal", categoryList.get(i).getId());
            } else if (categoryList.get(i).getId() == 5) {
                request.setAttribute("international", categoryList.get(i).getId());
            } else if (categoryList.get(i).getId() == 6) {
                request.setAttribute("patriotic", categoryList.get(i).getId());
            } else if (categoryList.get(i).getId() == 7) {
                request.setAttribute("movie", categoryList.get(i).getId());
            } else if (categoryList.get(i).getId() == 8) {
                request.setAttribute("superhero", categoryList.get(i).getId());
            } else {
                continue;
            }
        }

        //gets the single ad to be updated from the database
        try {
            request.setAttribute("thisAd", DaoFactory.getAdsDao().selectedAd(adId));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        Long userId = null;
        try {
            List <Ad> ad = DaoFactory.getAdsDao().selectedAd(adId);
            for (int i = 0; i < ad.size(); i++) {
                userId = ad.get(i).getUserId();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        User user = DaoFactory.getUsersDao().findUserById(userId);
        request.setAttribute("User", user);
        //send the ad to the update page
        request.getRequestDispatcher("/WEB-INF/ads/update.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("title").trim();
        String description = request.getParameter("description").trim();
        long adId = Long.parseLong(request.getParameter("adId"));
        String image = request.getParameter("image").trim();



        //creates a new ad object with the updated information
        Ad updatedAd = new Ad(title, description, adId, image);
        System.out.println(updatedAd.getImage());
        //send the updated ad to the database
        try {
            DaoFactory.getAdsDao().update(updatedAd);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //bucket to hold the category ids
        List<Long> catIds = new ArrayList<>();

        //if the user selects a category, add the category id to the bucket
        if (request.getParameter("generic") != null) {
            catIds.add(Long.parseLong(request.getParameter("generic")));
        }
        if (request.getParameter("music") != null) {
            catIds.add(Long.parseLong(request.getParameter("music")));
        }
        if (request.getParameter("sports") != null) {
            catIds.add(Long.parseLong(request.getParameter("sports")));
        }
        if (request.getParameter("seasonal") != null) {
            catIds.add(Long.parseLong(request.getParameter("seasonal")));
        }
        if (request.getParameter("international") != null) {
            catIds.add(Long.parseLong(request.getParameter("international")));
        }
        if (request.getParameter("patriotic") != null) {
            catIds.add(Long.parseLong(request.getParameter("patriotic")));
        }
        if (request.getParameter("movie") != null) {
            catIds.add(Long.parseLong(request.getParameter("movie")));
        }
        if (request.getParameter("superhero") != null) {
            catIds.add(Long.parseLong(request.getParameter("superhero")));
        }

        for (int i = 0; i < catIds.size(); i++) {
            DaoFactory.getAdsDao().insertAdCategory(adId, catIds.get(i));
        }

        //then redirects back to the profile to show the updated ad
        response.sendRedirect("/profile");


    }
}
