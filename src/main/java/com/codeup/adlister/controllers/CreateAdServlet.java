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
        System.out.println(loggedInUser.getId());
        System.out.println(ad.getImage());
        System.out.println(ad.getTitle());
        System.out.println(ad.getDescription());

        //if the user selected any categories, store that
        String generic = request.getParameter("generic");
        String music = request.getParameter("music");
        String sports = request.getParameter("sports");
        String seasonal = request.getParameter("seasonal");
        String international = request.getParameter("international");
        String patriotic = request.getParameter("patriotic");
        String movie = request.getParameter("movie");
        String superhero = request.getParameter("superhero");

        List<String> selectedCats = new ArrayList<>();
        if (generic != null) {
            selectedCats.add(generic);
        }
        if (music != null) {
            selectedCats.add(music);
        }
        if (sports != null) {
            selectedCats.add(sports);
        }
        if (seasonal != null) {
            selectedCats.add(seasonal);
        }
        if (international != null) {
            selectedCats.add(international);
        }
        if (patriotic != null) {
            selectedCats.add(patriotic);
        }
        if (movie != null) {
            selectedCats.add(movie);
        }
        if (superhero != null) {
            selectedCats.add(superhero);
        }


        //input validation, user must enter a title and description when creating an ad
        if (ad.getTitle() == "" || ad.getDescription() == "" || selectedCats.isEmpty()) {
            request.setAttribute("Error", "Please fill out all fields.");
            request.setAttribute("ad", ad);
            request.setAttribute("generic", generic);
            request.setAttribute("music", music);
            request.setAttribute("sports", sports);
            request.setAttribute("seasonal", seasonal);
            request.setAttribute("international", international);
            request.setAttribute("patriotic", patriotic);
            request.setAttribute("movie", movie);
            request.setAttribute("superhero", superhero);
            request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
            return;
        }

        long adId = DaoFactory.getAdsDao().insert(ad);
        //bucket to hold the category ids
        List<Long> catIds = new ArrayList<>();

        //gets the categories
        List<Category> adsCategories = DaoFactory.getCategoriesDao().getCategoriesByAdId(adId);


        for (String selectedCat : selectedCats) {
            DaoFactory.getAdsDao().insertAdCategory(adId, Long.parseLong(selectedCat));

        }

        //redirects the user to the ads index page to display all ads
        response.sendRedirect("/ads");
    }


}

