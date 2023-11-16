console.log("test");

const registerButton = document.getElementById("register-button");

const hiddenDuck = document.getElementById("hidden-duck");

//when the register button is hovered over, the duck will animate in

registerButton.addEventListener("mouseover", function() {
    hiddenDuck.classList.add("animate");
});
