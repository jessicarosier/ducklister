package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Comment;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "controllers.SingleAdServlet", urlPatterns = "/ad")
public class SingleAdServlet extends HttpServlet {

    //I had to change this to doGet so I could get the adId from the url for the AdCommentsServlet
    //This did not need to be a post because not data is being sent from the form to the db
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //sets the list of current ads as an attribute to be forwarded to the jsp
        long adId = Long.parseLong(request.getParameter("ad"));


        //gets the ad and sets it as an attribute to be forwarded to the jsp

        List<Ad> singleAd = null;
        try {
            singleAd = DaoFactory.getAdsDao().selectedAd(adId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("ad", singleAd);

        //gets the urserId for this specific ad
        long userAd = 0;
        for (Ad ad : singleAd) {
            userAd = ad.getUserId();
        }

        //gets the owner of the ad using the usersID obtained above and sets them as an attribute to be forwarded to the jsp
        User adOwner = DaoFactory.getUsersDao().findUserById(userAd);
        request.setAttribute("owner", adOwner);


        //gets a list of users who have commented on the ad and stores each user in an arraylist
        List<User> commentUsers = new ArrayList<>();
        for (Comment comment : DaoFactory.getCommentsDao().getCommentsByAdId(adId)) {
            commentUsers.add(DaoFactory.getUsersDao().findUserById(comment.getUserId()));
        }

        //creates a hashmap of the user and their comment to be forwarded to the jsp
        //hashmap was the only way I could figure out how to get the user and their comment to display together in the correct order
        HashMap<String, String> commentUserMap = new HashMap<>();
        //loops through the commentUsers arraylist and gets the username and comment for each user and stores them in the hashmap
        for (int i = 0; i < commentUsers.size(); i++) {
            commentUserMap.put(commentUsers.get(i).getUsername(), DaoFactory.getCommentsDao().getCommentsByAdId(adId).get(i).getComment());
        }
        request.setAttribute("commentUserMap", commentUserMap);

        request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);
    }

}
