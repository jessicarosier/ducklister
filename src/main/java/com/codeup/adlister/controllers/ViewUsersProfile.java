package com.codeup.adlister.controllers;


import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
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

@WebServlet(name = "ViewUsersProfile", urlPatterns = "/userProfile")
public class ViewUsersProfile extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //get the username of the user that was clicked on
        String username = request.getParameter("username");
        String location = request.getParameter("location");

        //get the user data from the DB for the user that was clicked on
        User user = DaoFactory.getUsersDao().findByUsername(username);

        //get the ads from the DB that belong to the user that was clicked on
        List<Ad> usersads = new ArrayList<>();
        try {
            usersads = DaoFactory.getAdsDao().getUserAds(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        //send the user to the profile page of the user they clicked on

        //set the user object for the user that was clicked on to the jsp
        request.setAttribute("userToView", user);
        //if the user clicks on someone else's profile, tell the view profile servlet where they are coming from
        request.setAttribute("location", location);
        //send the ads that belong to the user that was clicked on to the jsp
        request.setAttribute("usersAds", usersads);
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }
}
