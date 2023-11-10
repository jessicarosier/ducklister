package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "updateUserServlet", urlPatterns = "/profile/update")
public class UpdateUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // gets user from current session (logged user)
        User user = (User) request.getSession().getAttribute("user");

        //sets attribute with current session user and sends it to be displayed
        request.setAttribute("thisUser", DaoFactory.getUsersDao().findByUsername(user.getUsername()));
        request.getRequestDispatcher("/WEB-INF/updateUser.jsp").forward(request, response);
    }

//TODO work on the update user method in MySQLUsersDao first, then finish this doPost
    //TODO then go add the edit profile button on the navbar to be displayed only in that page


//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        //stores the user input from the form
//        String firstName = request.getParameter("firstName");
//        String lastName = request.getParameter("lastName");
//        String username = request.getParameter("username");
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//        String passwordConfirmation = request.getParameter("confirm_password");
//
//        // validate input
//        boolean inputHasErrors = firstName.isEmpty()
//                || lastName.isEmpty()
//                || username.isEmpty()
//                || email.isEmpty()
//                || password.isEmpty()
//                || (! password.equals(passwordConfirmation));
//
//        //if there are errors, send the user back to the register page
//        if (inputHasErrors) {
//            response.sendRedirect("/register");
//            return;
//        }
//
//        // create and save a new user
//        User user = new User(firstName, lastName, username, email, password);
//
//        // hash the password and add some salt
//        String hash = BCrypt.hashpw(password, BCrypt.gensalt(12));
//
//        //set the password to the hash
//        user.setPassword(hash);
//
//        //insert the user into the database
//        DaoFactory.getUsersDao().insert(user);
//
//        //redirect the user to the login page
//        response.sendRedirect("/login");
//    }
}
