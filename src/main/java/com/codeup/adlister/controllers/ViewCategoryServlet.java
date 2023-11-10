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

        //sets the list of current ads as an attribute to be forwarded to the jsp
        List<Category> allCats = DaoFactory.getCategoriesDao().all();
        for (int i = 0; i < allCats.size(); i++) {
            System.out.println(allCats.get(i).getTitle());
        }
        request.setAttribute("cats", allCats);
        request.getRequestDispatcher("/WEB-INF/ads/category.jsp").forward(request, response);
    }

}
