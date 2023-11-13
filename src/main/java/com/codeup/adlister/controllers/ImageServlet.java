package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ImageServlet", urlPatterns = "/images")
public class ImageServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String image = request.getParameter("image");
        String location = request.getParameter("location");
        User user = (User) request.getSession().getAttribute("user");
        long userId = user.getId();

        System.out.println(image);
        System.out.println(location);
        //inserts the image into the database where the user id matches the user id in the session and returns the updated user
        User updatedUser = DaoFactory.getUsersDao().insertProfilePic(userId, image);
        //sets the updated user in the session
        request.getSession().setAttribute("user", updatedUser);
        //then redirects back to the profile page where the user can see their new profile pic
        response.sendRedirect("/profile");
    }
}
