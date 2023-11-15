package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //remove old session error attributes
        request.getSession().removeAttribute("UsernameError");
        request.getSession().removeAttribute("PasswordError");

//        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        if (request.getSession().getAttribute("user") == null) {

            HttpSession session = request.getSession();
            String requestedUrl = request.getRequestURL().toString();
            session.setAttribute("requestedUrl", requestedUrl);


            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            // add a return statement to exit out of the entire method.
            return;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //stores the user input from the form
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        // validate input
        boolean inputHasErrors = firstName.isEmpty()
                || lastName.isEmpty()
                || username.isEmpty()
                || email.isEmpty()
                || password.isEmpty()
                || (!password.equals(passwordConfirmation));


        //if there are errors, send the user back to the register page
        if (inputHasErrors) {
            request.setAttribute("FirstName", firstName);
            request.setAttribute("LastName", lastName);
            request.setAttribute("Username", username);
            request.setAttribute("Email", email);
            request.setAttribute("PasswordError", "Passwords don't match.");
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
            return;
        }

        // create and save a new user
        User user = new User(firstName, lastName, username, email, password);

        // hash the password and add some salt
        String hash = BCrypt.hashpw(password, BCrypt.gensalt(12));

        //set the password to the hash
        user.setPassword(hash);


        //insert the user into the database
        if (DaoFactory.getUsersDao().insert(user) == null) {
            //if null, the username already exists, so send the user back to the register page and display an error message
            request.setAttribute("UsernameError", "Username already exists.");
            request.setAttribute("FirstName", firstName);
            request.setAttribute("LastName", lastName);
            request.setAttribute("Username", username);
            request.setAttribute("Email", email);
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
        } else {
            //otherwise, the user was successfully created, so set the session attribute to success and redirect them to the login page
            request.getSession().setAttribute("register", "success");
            response.sendRedirect("/login");
        }


    }
}


