package com.codeup.adlister.models;


import java.io.Serializable;


public class Comment implements Serializable {

    long id;

    long userId;

    long adId;

    String comment;


    public Comment() {
    }

    public Comment(long id, long userId, long adId, String comment) {
        this.id = id;
        this.userId = userId;
        this.adId = adId;
        this.comment = comment;
    }

    public Comment(long userId, long adId, String comment) {
        this.userId = userId;
        this.adId = adId;
        this.comment = comment;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getAdId() {
        return adId;
    }

    public void setAdId(long adId) {
        this.adId = adId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
