function navM() {
    let x = document.getElementById("topNav");
    let y = document.getElementById("back");
    let w = document.getElementsByTagName("body")[0];
    let z = document.getElementById("icon");

    if (w.style.overflow != "hidden") {
        if (window.innerWidth <= 500)
            w.style.overflow = "hidden"
    }
    else {
        w.style.overflow = "initial"
    }


    x.classList.toggle("active");
    y.classList.toggle("active");
    z.classList.toggle("active");

}

function clear() {
    let w = document.getElementsByTagName("body")[0];
    w.style.overflow = "initial";
}