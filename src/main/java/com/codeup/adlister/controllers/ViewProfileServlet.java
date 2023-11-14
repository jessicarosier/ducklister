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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");


        if (user == null) {

            response.sendRedirect("/login");
            return;
        }

        try {
            //below line gets the user from the db and to be displayed in the profile header
            request.setAttribute("thisUser", DaoFactory.getUsersDao().findByUsername(user.getUsername()));
            request.setAttribute("ads", DaoFactory.getAdsDao().getUserAds(user));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }
}
