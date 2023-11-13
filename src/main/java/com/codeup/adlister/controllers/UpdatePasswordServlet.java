package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import org.mindrot.jbcrypt.BCrypt;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UpdatePasswordServlet", urlPatterns = "/profile/update/password")
public class UpdatePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        long id = Long.parseLong(request.getParameter("id"));
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        boolean inputHasErrors =  password.isEmpty()
                    || (! password.equals(passwordConfirmation));

        if (inputHasErrors) {
                response.sendRedirect("/profile/update");
                return;
            }


         //create and save a new user
        User user = new User(id,password);

        // hash the password and add some salt
        String hash = BCrypt.hashpw(password, BCrypt.gensalt(12));

        //set the password to the hash
            user.setPassword(hash);

        //insert the user into the database
        try {
            DaoFactory.getUsersDao().updatePassword(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        //redirect the user to the profile page
            response.sendRedirect("/profile");
    }
}
