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
    const categoryError = document.getElementById("category-error");
    const titleError = document.getElementById("title-error");
    const descriptionError = document.getElementById("description-error");
    //clear out any previous messages
    categoryError.innerHTML = "";
    titleError.innerHTML = "";
    descriptionError.innerHTML = "";

    const title = document.getElementById("title");
    const description = document.getElementById("description");
    const categories = [];

    //get all the checked categories, if they are checked, add them to an array
    const categoryInputs = document.getElementsByClassName("category");
    for (let i = 0; i < categoryInputs.length; i++) {
        if (categoryInputs[i].checked) {
            categories.push(categoryInputs[i].value);
        }
    }
    //if there are no checked categories, add an error message
    if (categories.length < 1) {
        categoryError.innerHTML = `<p style="color: red">Please select at least one category</p>`;

    }
    //if there is no title, add an error message
    if (title.value.length < 1) {
        titleError.innerHTML = `<p style="color: red" >Please enter a title</p>`;
    }

    //if there is no description, add an error message
    if (description.value.length < 1) {
        descriptionError.innerHTML = `<p style="color: red">Please enter a description</p>`;
    }

    //if there are no errors, submit the form
    if (categoryError.innerHTML.length < 1 && titleError.innerHTML.length < 1 && descriptionError.innerHTML.length < 1) {
        document.getElementById("create-ad-form").submit();
    }
});