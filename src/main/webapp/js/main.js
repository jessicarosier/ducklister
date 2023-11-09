console.log("test");

const deleteAd = document.querySelector(".delete-ad");
console.log(deleteAd);

deleteAd.addEventListener("click", ()=> {
    let adId = deleteAd.getAttribute("data-id");
    console.log(adId);
});