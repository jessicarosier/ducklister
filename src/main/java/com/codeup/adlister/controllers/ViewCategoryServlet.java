package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(urlPatterns = "/cat")
public class ViewCategoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //stores all categories in a list
        List<Category> allCats = DaoFactory.getCategoriesDao().all();

        //passes the list to the jsp
        request.setAttribute("cats", allCats);
        request.getRequestDispatcher("/WEB-INF/ads/category.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cat = request.getParameter("title");
        long catId = Long.parseLong(request.getParameter("id"));




    }

}
