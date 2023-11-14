package com.codeup.adlister.models;

import java.io.Serializable;

public class Ad implements Serializable {
    private long id;
    private long userId;
    private String title;
    private String description;

    private String image;

    public Ad() {

    }

    public Ad(long id, long userId, String title, String description, String image) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.image = image;
    }
    public Ad(String title, String description, long id) {
        this.title = title;
        this.description = description;
        this.id = id;
    }


    public Ad(long id, String title, String description, String image) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.image = image;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {return image;}

    private void setImage(String image) {this.image = image;}
}
