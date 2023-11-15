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
    client.upload(file).then((response) => {
        const imageUrl = response.url;
        imageInput.value = imageUrl;
// <<<<<<< HEAD
//         image.src = response.url;
//         form.submit();
// =======
        // image.src = imageUrl;
        // console.log(imageUrl);
        // form.submit();
// >>>>>>> 0a57cc87fceb72308258f4e7ee07a67a40a5c167
    }).catch((error) => {
        console.log(error);
    });

});