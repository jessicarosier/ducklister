package com.codeup.adlister.models;

import java.io.Serializable;

public class User implements Serializable {
    private long id;
    private String firstName;
    private String lastName;
    private String username;
    private String email;
    private String password;
    private String avatar;
    private String jeep_model;
    private String jeep_year;
    private String jeep_color;

    public User() {
    }

    public User(long id, String firstName, String lastName, String username, String email, String jeep_model, String jeep_year, String jeep_color) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.jeep_model = jeep_model;
        this.jeep_year = jeep_year;
        this.jeep_color = jeep_color;
    }

    public User(String firstName, String lastName, String username, String email, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public User(long id, String firstName, String lastName, String username, String email, String password, String avatar) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.password = password;
        this.avatar = avatar;
    }

    public User(long id, String firstName, String lastName, String username, String email) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
    }

    public User(long id, String password) {
        this.id = id;
        this.password = password;
    }

    public User(long id, String firstName, String lastName, String username, String email, String password, String avatar, String jeep_model, String jeep_year, String jeep_color) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.password = password;
        this.avatar = avatar;
        this.jeep_model = jeep_model;
        this.jeep_year = jeep_year;
        this.jeep_color = jeep_color;
    }

    public User(String username, long id, String firstName, String lastName) {
        this.username = username;
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getUsername() {
        return username;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {return avatar;}

    public void setAvatar(String avatar) {this.avatar = avatar;}

    public String getJeepModel() {
        return jeep_model;
    }

    public String getJeepYear() {
        return jeep_year;
    }

    public String getJeepColor() {
        return jeep_color;
    }
}


