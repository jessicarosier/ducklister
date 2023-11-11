const fsKey = "ApuEX84WRR0K8zh6E6DuCz";
const client = filestack.init(fsKey);
const image = document.getElementById("profile-pic");
const fileUpload = document.getElementById("file-upload");


fileUpload.addEventListener("click", (event) => {
    event.preventDefault();
    // const file = event.target.files[0];
    //
    // client.upload(file).then((response) => {
    //     image.src = response.url;
    // }).catch((error) => {
    //     console.log(error);
    // });
    client.picker().open();
});



