let myNavbaricon = document.getElementById("navbaricon");
let myMenus = document.getElementById("menubar");

myNavbaricon.addEventListener("click", () => {
    // myMenus.classList.add("open");
    // myMenus.classList.remove("open");
    myMenus.classList.toggle("open")
    if (myMenus.classList.contains("open")) {
        myNavbaricon.textContent = "☰";
    }
    else {
        myNavbaricon.textContent = "X";
    }
})

const myformData = document.getElementById("myform");

myformData.addEventListener("submit", (userData) => {
    userData.preventDefault();

    let userName = document.getElementById("uname").value.trim();
    let userEmail = document.getElementById("uemail").value.trim();
    let userMobile = document.getElementById("umobile").value.trim();
    let userReason = document.getElementById("ureason").value.trim();
    let userFeedback = document.getElementById("ufeedback").value.trim();

    let myErrname = document.getElementById("errorName");
    let myErremail = document.getElementById("errorEmail");
    let myErrmobile = document.getElementById("errorMobile");
    let myErrreason = document.getElementById("errorReason");
    let myErrfeedback = document.getElementById("errorFeedback");

    let isvalid = true;

    if (!userName) {
        myErrname.textContent = "Please fill the Name"
        isvalid = false
    }
    else if (userName.length < 3) {
        myErrname.textContent = "Please fill the correct  Name data";
        isvalid = false;
    }
    else {
        myErrname.textContent = ""
        isvalid = true;
    }

    const myEmailPattern = /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/

    if (!userEmail) {
        myErremail.textContent = "Please fill the email data";
        isvalid = false;
    }
    else if (!myEmailPattern.test(userEmail)) {
        myErremail.textContent = "Please fill the correct email data";
        isvalid = false;
    }
    else {
        myErremail.textContent = ""
        isvalid = true;
    }

    const mobilePattern = /[6-9]\d{9}$/;

    if (!userMobile) {
        myErrmobile.textContent = "please fill the mobile data";
        isvalid = false
    }
    else if (!mobilePattern.test(userMobile)) {
        myErrmobile.textContent = "plase fill the data correct data mobile";
        isvalid = false;
    }
    else {
        myErrmobile.textContent = "";
        isvalid = true;
    }

    if (!userReason) {
        myErrreason.textContent = "please fill the reason"
        isvalid = false;
    }


    if (!userFeedback) {
        myErrfeedback.textContent = "olase fill the feedback data"
        isvalid = false;
    }
    else if (userFeedback.length < 5) {
        myErrfeedback.textContent = "please fill the below 10 charcters"
        isvalid = false;
    }
    else {
        myErrfeedback.textContent = ""
        isvalid = true
    }


    if (isvalid) {
        const userinfo = {
            userName,
            userEmail,
            userMobile,
            userReason,
            userFeedback
        }
        console.log(userinfo)
        // localStorage.setItem("userdata", userinfo);
        localStorage.setItem("userdata", JSON.stringify(userinfo));
        localStorage.getItem("")
        // let myLocalData =  localStorage.setItem("userdata", JSON.stringify(userinfo));
        alert("Data saved in console or db ...!!!")
        myformData.reset();

    }



    // if (!userName) {
    //     alert("Please fill the data")
    // }

    // if (userName === "") {
    //     alert("Please fill the data")
    // }

    // if (!userEmail) {
    //     alert("please fill the data");
    // }

    //   if (!userName || !userEmail || !userMobile || !userReason || !userFeedback) {
    //     alert("Please fill the data");
    // }
    // else {
    //     // console.log("username :", userName);
    //     // console.log("username :", userEmail);
    //     // console.log("username :", userMobile);
    //     // console.log("username :", userReason);
    //     // console.log("username :", userFeedback);
    //     const userinfo = {
    //         userName,
    //         userEmail,
    //         userMobile,
    //         userReason,
    //         userFeedback
    //     }
    //     console.log(userinfo)
    //     alert("Data saved in console or db ...!!!")
    //     myformData.reset();
    // }

    //  if (!userName || !userEmail || !userMobile || !userReason || !userFeedback) {
    //     // alert("Please fill the data");
    //     myErr.textContent = "Please fill the data";
    // }
    // else {
    //     const userinfo = {
    //         userName,
    //         userEmail,
    //         userMobile,
    //         userReason,
    //         userFeedback
    //     }
    //     console.log(userinfo)
    //     localStorage.setItem("userdata", userinfo)
    //     alert("Data saved in console or db ...!!!")
    //     myformData.reset();
    // }
})
let myData = new Date()
document.cookie = myData
console.log(myData)
console.log(document.cookie)