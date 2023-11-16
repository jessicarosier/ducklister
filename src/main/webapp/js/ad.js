const commentLink = document.querySelector("#comment");

commentLink.addEventListener("click", (e) => {
    e.preventDefault();
    const modal = document.createElement("div");
    modal.classList.add("modal");
    let adId = commentLink.getAttribute("data-id");
    console.log(adId);

    modal.innerHTML = `
 <div class="modal-bg"></div>
        <div class="modal-content">
        <div class="modal-header">
        <h2 class="modal-title">Comment</h2>
            <span class="modal-close">&times;</span>
        </div>
            <form action="/comment" method="post">
                <input type="hidden" name="id" value="${adId}">
                <input type="hidden" name="location" value="/ad">
                <textarea name="comment" ></textarea>
                <button type="submit" class="submit-btn">Submit<button>
            </form>
        </div>
    `;

    const modalClose = modal.querySelector(".modal-close");
    // event listener for close button
    modalClose.addEventListener("click", () => {
        modal.remove();
    });


    document.body.appendChild(modal);

});