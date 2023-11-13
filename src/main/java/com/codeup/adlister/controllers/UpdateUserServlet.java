package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "updateUserServlet", urlPatterns = "/profile/update")
public class UpdateUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // gets user from current session (logged user)
        User user = (User) request.getSession().getAttribute("user");
        System.out.println(user.getJeepYear());
        System.out.println(user.getEmail());


        if (user == null) {

            HttpSession session = request.getSession();
            String requestedUrl = request.getRequestURL().toString();
            session.setAttribute("requestedUrl", requestedUrl);


               request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
          //  response.sendRedirect("/login");

            return;
        } else {


            //sets attribute with current session user and sends it to be displayed
            request.setAttribute("thisUser", DaoFactory.getUsersDao().findByUsername(user.getUsername()));
            request.getRequestDispatcher("/WEB-INF/updateUser.jsp").forward(request, response);
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //stores the user input from the form
        long id = Long.parseLong(request.getParameter("id"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String jeepModel = request.getParameter("model");
        String jeepYear = request.getParameter("year");
        String jeepColor = request.getParameter("color");


        // validate input
        boolean inputHasErrors = firstName.isEmpty()
                || lastName.isEmpty()
                || username.isEmpty()
                || email.isEmpty();

        //if there are errors, send the user back to the profile update page
        if (inputHasErrors) {
            response.sendRedirect("/profile/update");
            return;
        }

        // create and save a new user
        User user = new User(id, firstName, lastName, username, email,jeepModel, jeepYear, jeepColor);


        //insert the user into the database with new password into
        try {
            DaoFactory.getUsersDao().updateProfile(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        //redirect the user to the profile page
        request.getRequestDispatcher("/WEB-INF/userUpdatedMessage.jsp").forward(request, response);
    }
}
