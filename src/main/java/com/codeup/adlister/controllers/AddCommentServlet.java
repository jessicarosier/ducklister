package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Comment;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddCommentServlet", urlPatterns = "/comment")
public class AddCommentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");

        request.getRequestDispatcher("/WEB-INF/addComment.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String comment = request.getParameter("comment");
        long adId = Long.parseLong(request.getParameter("id"));
        User user = (User) request.getSession().getAttribute("user");
        long userId = user.getId();

        //creates a new comment object
        Comment newComment = new Comment(userId, adId, comment);
        System.out.println(newComment.getUserId());
        System.out.println(newComment.getAdId());
        System.out.println(newComment.getComment());

        //inserts the new comment into the db
        DaoFactory.getCommentsDao().insertComment(newComment);


        response.sendRedirect("/ad?ad=" + adId+ "&from=ads");
    }

}
