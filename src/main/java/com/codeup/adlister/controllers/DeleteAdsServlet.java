package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/delete")
public class DeleteAdsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        //gets the ad id from the form
        String adId = request.getParameter("adid");

        //deletes the ad from the database using the ad id
        try {
            DaoFactory.getAdsDao().delete(adId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        //then redirects to the ads page to display the remaining ads
        response.sendRedirect("/ads");

    }
}
