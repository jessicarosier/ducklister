package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //if the user is NOT logged in, they should not be able to create an ad, so redirect them to the login page
        if (request.getSession().getAttribute("user") == null) {

            HttpSession session = request.getSession();
            String requestedUrl = request.getRequestURL().toString();
            session.setAttribute("requestedUrl", requestedUrl);


            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            // add a return statement to exit out of the entire method.
            return;
        }
        //otherwise, they are logged in, so they can create an ad
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //grabs the logged-in user info from the session
        User loggedInUser = (User) request.getSession().getAttribute("user");


        //creates a new ad object with the logged-in user id,
        Ad ad = new Ad(
                loggedInUser.getId(),
                request.getParameter("title").trim(),
                request.getParameter("description").trim(),
                request.getParameter("image")
        );

        //stores the ad ID obtained from the DB after inserting the ad into the ads table
        long adId = DaoFactory.getAdsDao().insert(ad);

        //TODO: FIX THIS, INPUT VALIDATION DOES NOT WORK YET -JR
        //input validation, user must enter a title and description when creating an ad
        if (ad.getTitle() == null || ad.getDescription() == null) {
            request.setAttribute("titleError", "Please fill out all fields.");
            request.setAttribute("ad", ad);
            request.getRequestDispatcher("/WEB-INF/ads/recreate.jsp").forward(request, response);
            return;
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

        //TODO: FIX THIS, INPUT VALIDATION DOES NOT WORK YET -JR
        //input validation, if the user does not select at least one category, display an error message
        if (catIds.isEmpty()) {
            request.setAttribute("ad", ad);
            request.setAttribute("categoryError", "Please select at least one category.");
            request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
            return;
        }

        //loops through the category ids bucket and inserts the ad into the ads_cats table
        for (Long catId : catIds) {
            DaoFactory.getAdsDao().insertAdCategory(adId, catId);
        }

        //redirects the user to the ads index page to display all ads
        response.sendRedirect("/ads");
    }
}
