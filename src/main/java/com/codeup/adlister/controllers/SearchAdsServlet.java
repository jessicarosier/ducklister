package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.ListAdsDao;
import com.codeup.adlister.dao.MySQLAdsDao;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.List;

@WebServlet(name = "SearchAdsServlet", urlPatterns = "/ads/search")
public class SearchAdsServlet extends HttpServlet {

    public SearchAdsServlet() throws SQLException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String searched = request.getParameter("search");
        System.out.println("Search term being submitted:" + searched);
        request.setAttribute("searched", searched);
        Ads ads = DaoFactory.getAdsDao();
        List<Ad> searchedAds = null;
        try {
            searchedAds = DaoFactory.getAdsDao().searchAds(searched);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        System.out.println("Number of results: " + searchedAds.size());
        try {
            request.setAttribute("searchedAds", DaoFactory.getAdsDao().searchAds(searched));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request,response);
//        String searchTerm = request.getParameter("searchTerm");
//        response.sendRedirect(request.getContextPath() + "/ads/search.jsp");

    }
}