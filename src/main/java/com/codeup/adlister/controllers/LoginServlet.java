package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import com.mysql.cj.Session;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




        //if a user is logged in, redirect to profile
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }

        //otherwise, show the login page
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        //stores the username and password from the login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");


        // checks if the username and password are in the database
        User user = DaoFactory.getUsersDao().findByUsername(username);

        //if the username is not in the database, redirect to login
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }


        //is true if the password matches the hashed password in the database
        boolean validAttempt = BCrypt.checkpw(password, user.getPassword());
        //////////////////////////////////////////

        /////////////////////////////////////////
        request.getSession().setAttribute("user", user);
        String requestedUrl = (String) request.getSession().getAttribute("requestedUrl");

        //if the password is correct, redirect to profile
        if (validAttempt && requestedUrl != null) {

            response.sendRedirect(requestedUrl);

        } else if (validAttempt){

            response.sendRedirect("/profile");

        } else {
            //otherwise, redirect to login page
            response.sendRedirect("/login");
        }
    }
}
