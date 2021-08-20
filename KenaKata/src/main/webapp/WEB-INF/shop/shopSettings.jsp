<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<style>
    .navbar-brand{
        font-family: "Lucida Calligraphy";
    }
    .navbar-nav .actv{
        border-bottom: 3px solid white;
    }
    .container {
        padding: 50px;
        alignment: center;
        align-content: center;
        opacity: 100%;
    }
    /* Full-width input fields */
    input[type=text], input[type=email], input[type=password] {
        width: 50%;
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: none;
        background: #f1f1f1;
        font-family: Monaco, monospace;
        border-radius: 10px;
    }

    input[type=text]:focus, input[type=password]:focus {
        background-color: #ddd;
        outline: none;
        font-family: Monaco, monospace;
    }
    label{
        font-family: Monaco, monospace;
        font-size: 16px;
    }
    .imgprev img{
        width: 600px;
        height: 300px;
    }
    /* Overwrite default styles of hr */
    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }
    .navbar-nav .actv{
        border-bottom: 3px solid white;
    }
    label{
        font-family: Monaco, monospace;
        font-size: 18px;
        display: inline-block;
        width: 200px;
        text-align: right;
    }
    .dropbtn {
        font-family: Monaco, monospace;
        background-color: #262626;
        color: #f2f2f2;
        padding-top: 14px;
        /*padding: 16px;*/
        font-size: 16px;
        border: none;
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
        width: fit-content;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 12px;
        text-decoration: none;
        display: inline-block;
        width: 150px;
        font-size: 14px;
    }

    .dropdown-content a:hover {background-color: #ddd;}

    .dropdown:hover .dropdown-content {display: block;}

    /* Set a style for the submit/register button */
    .registerbtn {
        background-color: #262626;
        opacity: 70%;
        color: white;
        font-size: 22px;
        padding: 12px 20px;
        /*margin: 8px 0;*/
        border-radius: 8px;
        cursor: pointer;
        width: 250px;
        height: auto;
        opacity: 0.9;
        alignment: center;
        font-family: Monaco, monospace;
    }

    .registerbtn:hover {
        opacity:1;
    }
    a:hover {
        opacity: 1;
    }
    .temp a{
        text-decoration: underline;
        color: #f2f2f2;
    }
    .temp a:hover{
        color: #f2f2f2;
        text-decoration: none;
    }
    body{
        font-family: Monaco, monospace;
        margin: 0 auto;
        position: relative;
    }
    body::after {
        content: '';
        display: block;
        height: 80px; /* Set same as footer's height */
    }
    .footer {
        background-color: #262626;
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        height: 80px;
    }
</style>
<head>
    <title>Shop Settings</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body style="background-color: #f2f2f2">

<nav class="navbar navbar-default" style="background-color: #262626; margin: 0 auto">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: #f2f2f2; font-family: 'Lucida Calligraphy',cursive"><span class="glyphicon glyphicon-shopping-cart"></span> KenaKata</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/shop/home" style="color: white; font-family: 'Monaco',monospace;">Home</a></li>
            <li><a href="/shop/addProduct" style="color: white; font-family: 'Monaco',monospace;">Add Product</a></li>
            <li class="nav-item dropdown" style="width: fit-content">
                <div class="dropdown">
                    <button class="dropbtn" style="font-size:14px; font-family: Monaco, monospace">View Categories</button>
                    <div class="dropdown-content">
                        <c:forEach var="category" items="${categoryList}">
                            <a  href="/shop/viewCategory/${category}" style="font-size: 14px; color: #262626; font-family: 'Monaco',monospace">${category}</a>
                        </c:forEach>
                    </div>
                </div>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="actv"><a href="/shop/settings" style="color: #f2f2f2; font-family: 'Monaco',monospace">
                <span class="glyphicon glyphicon-cog"></span> ${shop.shopname}</a></li>
            <li><a href="/shop/orders" style="color: #f2f2f2; font-family: Monaco, monospace">
                <span class="glyphicon glyphicon-list"></span> Orders</a>
            <li><a href="/logout" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
        </ul>
    </div>

</nav>

<div class="container" align="center">
    <div class="row">
        <legend style="color: #262626; font-family: Monaco, monospace; font-size: 32px"> Account Settings </legend>
        <c:if test="${flag != null}">
            <h5 style="color: #d4122b; font-family: Monaco, monospace">
                Incorrect current password!</h5>
            <br>
        </c:if>
        <c:if test="${updated != null}">
            <h4 style="color: lightseagreen; font-family: Monaco, monospace">
                Saved Changes <span class="glyphicon glyphicon-ok"></span> </h4>
            <br>
        </c:if>
        <form method="POST" id="form" enctype="multipart/form-data">

            <div class="mb-3">
                <div>
                    <label>Username: </label>
                    <input type="text"
                           name="shopname"
                           value="${shop.shopname}"
                           autofocus="true" readonly="true"/>
                </div>
            </div>

            <div class="mb-3">
                <div>
                    <label>Email: </label>
                    <input type="email"
                           name="shop_email"
                           value="${shop.shop_email}"
                           autofocus="true" readonly="true"/>
                </div>
            </div>

            <div class="mb-3">
                <div>
                    <label>Contact Number: </label>
                    <input type="text"
                           name="contact_number"
                           id="phone"
                           value="${shop.contact_number}"
                           placeholder="Enter Contact Number"
                           autofocus="true"
                           style="background-color: white"/>
                </div>
            </div>

            <div class="mb-3">
                <div>
                    <label>About Shop: </label>
                    <input type="text"
                           name="about"
                           id="about"
                           value="${shop.about}"
                           placeholder="Enter Shop Description"
                           autofocus="true"
                           style="background-color: white"/>
                </div>
            </div>

            <div class="mb-3">
                <div>
                    <label><h4 style="color: #d4122b; display: inline-block" >*</h4>Current Password: </label>
                    <input type="password"
                           name="currentpass"
                           id="currentpass"
                           class="form-control"
                           placeholder="Enter Current Password"
                           autofocus="true"
                           style="background-color: white"/>
                </div>
            </div>
            <div class="mb-3">
                <div>
                    <label>New Password: </label>
                    <input type="password"
                           name="password"
                           id="password"
                           class="form-control"
                           placeholder="Enter New Password"
                           autofocus="true"
                           style="background-color: white"/>
                </div>
            </div>

            <div class="mb-3" style="margin-left: 180px">
                <div class="image">
                    <label style="float: left; padding-left: 50px; padding-top: 20px;">Shop Cover:</label>
                    <div class="imgprev" style="float: left; padding-left: 38px; font-family: Monaco, monospace; opacity: 0.9;">
                        <input accept="image/*" type="file" name="fileImage" id="inputShopLogo"
                               style="padding-top: 30px; font-family: Monaco, monospace; border: none; float: left;">
                        <input type="hidden" id="shoplogoUrl" name="shop_logo" value=""/>
                        <br>
                        <img src="${shop.shop_logo}" id="shopImagePreview" alt="cover image" style="padding-top: 20px; padding-bottom: 20px"/>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <div id="error" style="font-family: Monaco, monospace; color: #d4122b; margin: 0 auto;
                padding-bottom: 10px; width: 350px; height: 80px"></div>
            </div>
            <div class="mb-3" style="margin-top: 320px;">
                <button class="registerbtn" id="save" type="submit" style="transform: translate(50px, 10px)" >Save</button><br>
                <h6 style="color: mediumseagreen; font-family: Monaco, monospace; transform: translate(45px,10px)">Please wait until successful image preview in case of image uploading...</h6><br>
            </div>

        </form>


    </div>
</div>
<div class="footer" style="font-family: Monaco, monospace">
    <div class="container-fluid" &lt;%&ndash;style="padding-left: 40%"&ndash;%&gt;>
        <div class="temp" style="padding-top: 15px; padding-bottom: 15px; text-align: center; font-size: 14px; color: #f2f2f2;">
            <p style="font-size: 15px"> © KenaKata Unlimited. 2021. All Rights Reserved</p>
            <a href="/shop/complain/add">Contact Us</a>
            |
            <a href="/aboutUs">About Us</a>
        </div>
    </div>
</div>
</body>

<script>
    const form = document.getElementById("form");
    const errorElement = document.getElementById("error");
    const phone = document.getElementById("phone");
    const about = document.getElementById("about");

    form.addEventListener('submit', (e)=>{
        let message=[]
        if(password.value.length >=1 & password.value.length<= 7) {
            message.push("*Password must be 8 characters long")
        }
        if (currentpass.value.length == 0) {
            message.push("*Enter current password to save changes")
        }
        else if (about.value.length == 0 || phone.value.length == 0) {
            message.push("*Shop description or contact number field cannot be empty!")
        }
        if(message.length>0){
            e.preventDefault()
            errorElement.innerText = message.join(',')
        }
    })
</script>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/8.9.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.9.1/firebase-storage.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->

<script>
    // Your web app's Firebase configuration
    var firebaseConfig = {
        apiKey: "${firebaseApikey}",
        authDomain: "kenakata-b5228.firebaseapp.com",
        projectId: "kenakata-b5228",
        storageBucket: "kenakata-b5228.appspot.com",
        messagingSenderId: "130318703762",
        appId: "1:130318703762:web:3c0c0d47f79301aaf21a4b"
    };
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
    console.log("firebase initialized.")


    // render the image file in image view
    const imageInputField = document.getElementById("inputShopLogo")
    const preview = document.getElementById("shopImagePreview")
    const logUrlInputField = document.querySelector("#shoplogoUrl")

    imageInputField.addEventListener("change", function() {
        console.log("image selected for logo")
        if (this.files && this.files[0]) {
            uploadToFirebase(this.files[0],logUrlInputField, function (imageUrl){
                console.log("adding image url to src")
                preview.setAttribute('src', imageUrl);
            });

        }
    });

    function uploadToFirebase(file, logUrlInputField,onUploadSuccess){
        const fileName = file.name;

        // Points to the root reference
        const storageRef = firebase.storage().ref();

        // Points to 'images'
        const imagesStorageRef = storageRef.child('images');

        // space ref where image will be stored
        const currentDate = new Date().getTime();
        const spaceRef = imagesStorageRef.child(currentDate+"-"+fileName);

        const uploadTask = spaceRef.put(file)
            .then(function (snapshot) {
                console.info("image uploaded in firebase");
                // Handle successful uploads on complete
                // For instance, get the download URL: https://firebasestorage.googleapis.com/...
                snapshot.ref.getDownloadURL().then((downloadURL) => {
                    console.log('File available at', downloadURL);
                    logUrlInputField.setAttribute("value", downloadURL);

                    onUploadSuccess(downloadURL);
                });
            })


    }
</script>

</html>
