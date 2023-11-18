

let firstHome = document.getElementById("first-home");
let firstAbout = document.getElementById("first-about");
let firstRegister = document.getElementById("first-register");
let home = document.getElementById("home");
let about = document.getElementById("about");
let register = document.getElementById("register");
let login = document.getElementById("login");
let viewAll = document.getElementById("view-all");
let profile = document.getElementById("profile");
let create = document.getElementById("create");
let edit = document.getElementById("edit");
let logout = document.getElementById("logout");

let firstHomeChild = document.getElementById("first-home-duck");
let firstAboutChild = document.getElementById("first-about-duck");
let firstRegisterChild = document.getElementById("first-register-duck");
let homeChild = document.getElementById("home-duck");
let aboutChild = document.getElementById("about-duck");
let registerChild = document.getElementById("register-duck");
let loginChild = document.getElementById("login-duck");
let viewAllChild = document.getElementById("view-all-duck");
let profileChild = document.getElementById("profile-duck");
let editProfileChild = document.getElementById("edit-duck");
let createChild = document.getElementById("create-duck");
let logoutChild = document.getElementById("logout-duck");


window.addEventListener("DOMContentLoaded", (event) => {

if(firstHome){
  firstHome.addEventListener("mouseenter", function () {
    firstHomeChild.style.display = "block";
  });
  firstHome.addEventListener("mouseleave", function () {
    firstHomeChild.style.display = "none";
  });
}

if(firstAbout){
  firstAbout.addEventListener("mouseenter", function () {
    firstAboutChild.style.display = "block";
  });
  firstAbout.addEventListener("mouseleave", function () {
    firstAboutChild.style.display = "none";
  });
}


if(firstRegister){
  firstRegister.addEventListener("mouseenter", function () {
    firstRegisterChild.style.display = "block";
  });
  firstRegister.addEventListener("mouseleave", function () {
    firstRegisterChild.style.display = "none";
  });
}

if(login){
  login.addEventListener("mouseenter", function () {
    loginChild.style.display = "block";
  });
  login.addEventListener("mouseleave", function () {
    loginChild.style.display = "none";
  });
}

if (home) {
  home.addEventListener("mouseenter", function () {
    homeChild.style.display = "block";
  });
  home.addEventListener("mouseleave", function () {
    homeChild.style.display = "none";
  });
}

if (about) {
  about.addEventListener("mouseenter", function () {
    aboutChild.style.display = "block";
  });
  about.addEventListener("mouseleave", function () {
    aboutChild.style.display = "none";
  });
}

if (register) {
  register.addEventListener("mouseenter", function () {
    registerChild.style.display = "block";
  });
  register.addEventListener("mouseleave", function () {
    registerChild.style.display = "none";
  });
}

if (viewAll) {
  viewAll.addEventListener("mouseenter", function () {
    viewAllChild.style.display = "block";
  });
  viewAll.addEventListener("mouseleave", function () {
    viewAllChild.style.display = "none";
  });
}

if (profile) {
  profile.addEventListener("mouseenter", function () {
    profileChild.style.display = "block";
  });
  profile.addEventListener("mouseleave", function () {
    profileChild.style.display = "none";
  });
}

if (edit) {
  edit.addEventListener("mouseenter", function () {
    editProfileChild.style.display = "block";
  });
  edit.addEventListener("mouseleave", function () {
    editProfileChild.style.display = "none";
  });
}

if (create) {
  create.addEventListener("mouseenter", function () {
    createChild.style.display = "block";
  });
  create.addEventListener("mouseleave", function () {
    createChild.style.display = "none";
  });
}

if (logout) {
  logout.addEventListener("mouseenter", function () {
    logoutChild.style.display = "block";
  });
  logout.addEventListener("mouseleave", function () {
    logoutChild.style.display = "none";
  });
}

});