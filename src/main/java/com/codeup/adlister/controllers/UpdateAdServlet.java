package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = "/update")
public class UpdateAdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long adId = Long.valueOf(request.getParameter("ad"));

//        System.out.println(adId);

        //TODO: call method to get the ad where the ad ID = adID,
        //TODO: then set that add as an attribute to send it to the JSP
        request.setAttribute("thisAd", DaoFactory.getAdsDao().selectedAd(adId));
        request.getRequestDispatcher("/WEB-INF/ads/update.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        long adId = Long.parseLong(request.getParameter("adId"));


        Ad updatedAd = new Ad(title,description, adId);

        System.out.println(updatedAd.getId());

        try {
            DaoFactory.getAdsDao().update(updatedAd);
        } catch (SQLException e) {
e.printStackTrace();        }


    }
}
