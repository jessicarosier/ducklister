import fsKey from "./keys.js";

//initialize filestack with api key
const client = filestack.init(fsKey);

const image = document.getElementById("temp-pic");
const fileUpload = document.getElementById("file-upload");
const imageInput = document.getElementById("image-url");

// const form = document.getElementById("image-form");

//add event listener to file upload button, when a file is selected, upload it to filestack
fileUpload.addEventListener("change", (event) => {
    event.preventDefault();
    //get the file that was selected
    const file = event.target.files[0];
    console.log(file);
    client.upload(file).then((response) => {
        const imageUrl = response.url;

        imageInput.value = imageUrl;
        image.src = response.url;
        form.submit();
    }).catch((error) => {
        console.log(error);
    });

});