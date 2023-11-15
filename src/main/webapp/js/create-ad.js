import fsKey from "./keys.js";

//initialize filestack with api key
const client = filestack.init(fsKey);
const image = document.getElementById("temp-pic");
const fileUpload = document.getElementById("file-upload");
const imageInput = document.getElementById("image-url");

//add event listener to file upload button, when a file is selected, upload it to filestack
fileUpload.addEventListener("change", (event) => {
    event.preventDefault();
    //get the file that was selected
    const file = event.target.files[0];
    console.log(file);
    client.upload(file).then((response) => {
        const imageUrl = response.url;
        image.src = imageUrl;
        imageInput.value = imageUrl;
    }).catch((error) => {
        console.log(error);
    });

});


const submitButton = document.getElementById("submit-button");


//FORM VALIDATION
submitButton.addEventListener("click", (event) => {
    event.preventDefault();
    const messageDiv = document.getElementById("message");
    //clear out any previous messages
    messageDiv.innerHTML = "";
    const title = document.getElementById("title").value;
    const description = document.getElementById("description").value;
    const categories = [];
    //get all the checked categories
    const categoryInputs = document.getElementsByClassName("category");
    for (let i = 0; i < categoryInputs.length; i++) {
        if (categoryInputs[i].checked) {
            categories.push(categoryInputs[i].value);
        }
    }
    //if there are no checked categories, add an error message
    if (categories.length < 1) {
        const categoryError = document.createElement("h3");
        categoryError.innerText = "Please select at least one category";
        messageDiv.appendChild(categoryError);

    }
    //if there is no title or description, add an error message
    if (title.length < 1) {
          const titleError = document.createElement("h3");
            titleError.innerText = "Please enter a title";
            messageDiv.appendChild(titleError);
    }
    if (description.length < 1) {
        const descriptionError = document.createElement("h3");
        descriptionError.innerText = "Please enter a description";
        messageDiv.appendChild(descriptionError);
    }

    //if there are no errors, submit the form
    if (messageDiv.innerHTML === "") {
        document.getElementById("create-ad-form").submit();
    }
});