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
import java.util.List;

@WebServlet(name = "controllers.SingleAdServlet", urlPatterns = "/ad")
public class SingleAdServlet extends HttpServlet {

    //I had to change this it doGet so I could get the adId from the url for the AdCommentsServlet
    //This did not need to be a post because not data is being sent from the form to the db
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //sets the list of current ads as an attribute to be forwarded to the jsp
        long adId = Long.parseLong(request.getParameter("ad"));

        List<Ad> singleAd = null;
        try {
            singleAd = DaoFactory.getAdsDao().selectedAd(adId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("ad",singleAd );

        long userAd = 0;
        for ( Ad ad: singleAd) {
           userAd = ad.getUserId();
        }

        User adOwner = DaoFactory.getUsersDao().findUserById(userAd);
        request.setAttribute("owner",adOwner );
        request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);
    }

}
