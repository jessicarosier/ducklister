package com.codeup.adlister.dao;

import com.codeup.adlister.models.Comment;
import com.codeup.adlister.models.User;

import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

public interface Comments {

    long insertComment(Comment comment);

    void deleteComment(long commentId);

    void updateComment(String comment, long commentId);

    List<Comment> all();

    List<Comment> getCommentsByAdId(long adId);

    List<Comment> getCommentsByUser(long userId);


    HashMap<String, User> mapCommentToUsers(long adId);



}
