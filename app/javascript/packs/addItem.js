const addItem = ()=> {
    const createButton = document.getElementById("addItem");
    createButton.addEventListener("click", () => {
        const lastId = document.querySelector('#itemContainer').lastElementChild.id;
        
        const newId = parseInt(lastId, 10) + 1;

        const newFieldSet = document.querySelector('[id="0"]').outerHTML.replace(/0/g, newId);

        document.querySelector("#itemContainer").insertAdjacentHTML(
            "afterend", newFieldSet
        );
    });
}

export { addItem }