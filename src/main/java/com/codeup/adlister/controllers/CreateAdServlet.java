package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.AdCat;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //if the user is NOT logged in, they should not be able to create an ad, so redirect them to the login page
        if(request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            // add a return statement to exit out of the entire method.
            return;
        }
        //otherwise, they are logged in, so they can create an ad
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //grabs the logged-in user info from the session
        User loggedInUser = (User) request.getSession().getAttribute("user");

        //creates a new ad object with the logged-in user id,
        //this add belongs to the logged-in user
        Ad ad = new Ad(
            loggedInUser.getId(),
            request.getParameter("title"),
            request.getParameter("description")
        );

        long catId = Long.parseLong(request.getParameter("category"));
        //inserts the new ad into the database // passes the ad object and the category id as arguments
        DaoFactory.getAdsDao().insert(ad,catId);



        //redirects the user to the ads index page to display all ads
        response.sendRedirect("/ads");
    }
}
