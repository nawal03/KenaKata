<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shop Registration</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .navbar-brand{
            font-family: "Lucida Calligraphy";
        }
        .container {
            padding: 50px;
            alignment: center;
            align-content: center;
            opacity: 100%;
        }

        legend {
            font-size: 32px;
            padding-bottom: 20px;
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
        }

        input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
            font-family: Monaco, monospace;
        }
        input[type=checkbox] {
            font-family: Monaco, monospace;
            /*padding: 15px;*/
            display: inline-block;
        }

        /* Overwrite default styles of hr */
        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }

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
            width: 50%;
            height: auto;
            opacity: 0.9;
            alignment: center;
            font-family: Monaco, monospace;
        }

        .registerbtn:hover {
            opacity:1;
        }
        label{
            font-family: Monaco, monospace;
            font-size: 16px;
        }
        .imgprev img{
            width: 500px;
            height: 250px;
        }
        .navbar-nav .actv{
            border-bottom: 3px solid white;
        }
        .temp a{
            text-decoration: underline;
            color: #f2f2f2;
        }
        .temp a:hover{
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
</head>
<body style="background-color: #f2f2f2">
<nav class="navbar navbar-default" style="background-color: #262626">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: #f2f2f2"><span class="glyphicon glyphicon-shopping-cart"></span> KenaKata</a>
        </div>
        <div class="navbar-2">
            <ul class="nav navbar-nav">
                <li><a href="/" style="color: #f2f2f2; font-family: 'Monaco',monospace">Home</a></li>
            </ul>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/register" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li class="actv"><a href="/registershop" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-pencil"></span> Register Shop</a></li>
            <li><a href="/login" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>

<div class="container" align="center">

    <div class="row">
        <legend style="color: #262626; font-family: Monaco, monospace"> Register New Shop</legend>


        <form:form method="POST" id="form" modelAttribute="shop" class="form-signin" enctype="multipart/form-data">

            <div class="mb-3">
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                            ${error} <span class="glyphicon glyphicon-exclamation-sign"></span>
                    </div>
                </c:if>
            </div>

            <div class="mb-3">
                <div>
                    <form:input type="text"
                                path="shopname"
                                class="form-control"
                                placeholder="Enter Shop Name*"
                                autofocus="true"/>
                </div>
            </div>

            <div class="mb-3">
                <div>
                    <form:input type="email"
                                path="shop_email"
                                class="form-control"
                                placeholder="Enter Email Address*"
                                autofocus="true"/>
                </div>
            </div>
            <div class="mb-3">
                <div>
                    <form:input type="password"
                                path="password"
                                class="form-control"
                                placeholder="Enter Password*"/>
                </div>

            </div>
            <div class="mb-3">
                <div>
                    <form:input type="text"
                                path="contact_number"
                                class="form-control"
                                placeholder="Enter Contact Number*"
                                autofocus="true"/>
                </div>
            </div>

            <div class="mb-3">
                <div>
                    <form:input type="text"
                                path="about"
                                class="form-control"
                                placeholder="Write a few lines about your shop*"
                                autofocus="true"/>
                </div>
            </div>

            <div class="mb-3">
                <div style="padding-top: 10px">
                    <label style="float: left; padding-left: 50px; opacity: 0.8"><h5 style="color: #d4122b; display: inline-block">*</h5>Select Delivery Divisions:</label>
                    <div class="check1" style="float: left; padding-left: 18px; font-family: Monaco, monospace; opacity: 0.8">
                        <input type="checkbox" name="da1" id="da1" value="Dhaka">
                        <label for="da1">Dhaka</label>

                        <input type="checkbox" name="da2" id="da2" value="Khulna">
                        <label for="da2">Khulna</label>

                        <input type="checkbox" name="da3" id="da3" value="Rajshahi">
                        <label for="da3">Rajshahi</label>

                        <input type="checkbox" name="da4" id="da4" value="Sylhet">
                        <label for="da4">Sylhet</label>

                        <input type="checkbox" name="da5" id="da5" value="Rangpur">
                        <label for="da5">Rangpur</label>

                        <input type="checkbox" name="da6" id="da6" value="Chattogram">
                        <label for="da6">Chattogram</label>

                        <input type="checkbox" name="da7" id="da7" value="Barishal">
                        <label for="da7">Barishal</label>
                        <input type="checkbox" name="da8" id="da8" value="Mymensingh">
                        <label for="da8">Mymensingh</label>
                    </div>
                    <br>
                </div>
            </div>

            <div class="mb-3">
                <div style="padding-top: 30px">
                    <label style="float: left; padding-left: 50px; opacity: 0.8;"><h5 style="color: #d4122b; display: inline-block">*</h5>Select Shop Categories:</label>
                    <div class="check2" style="float: left; padding-left: 44px; font-family: Monaco, monospace; opacity: 0.8;">
                        <input type="checkbox" name="category1" id="category1" value="Women's Clothing">
                        <label for="category1">Women's Clothing</label>

                        <input type="checkbox" name="category2" id="category2" value="Men's Clothing">
                        <label for="category2">Men's Clothing</label>

                        <input type="checkbox" name="category3" id="category3" value="Kid's Clothing">
                        <label for="category3">Kid's Clothing</label>

                        <input type="checkbox" name="category4" id="category4" value="Accessories">
                        <label for="category4">Accessories</label>
                        <br>
                        <div class="inner-check2" style="float: left; padding-top: 10px; font-family: Monaco, monospace; opacity: 0.9;">
                            <input type="checkbox" name="category5" id="category5" value="Health and Beauty">
                            <label for="category5">Health and Beauty</label>

                            <input type="checkbox" name="category6" id="category6" value="Home and Decor">
                            <label for="category6">Home and Decor</label>

                            <input type="checkbox" name="category7" id="category7" value="Others">
                            <label for="category7">Others</label>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="mb-3">
                <div class="image">
                    <label style="float: left; padding-left: 50px; padding-top: 27px; opacity: 0.8"><h5 style="color: #d4122b; display: inline-block">*</h5>Select Shop Cover Photo:</label>
                    <div class="imgprev" style="float: left; padding-left: 38px; font-family: Monaco, monospace; opacity: 0.9;">
                        <input accept="image/*" type="file" name="fileImage" id="inputShopLogo"
                               style="padding-top: 30px; font-family: Monaco, monospace; border: none; float: left;">
                            <%--Shop.shop_logo--%>
                        <form:input type="hidden" id="shoplogoUrl" path="shop_logo" value=""/>

                        <br>
                        <img src="/images/website%20images/imgprev.jpg" id="shopImagePreview" alt="profile image" style="padding-top: 10px; padding-bottom: 20px"/>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <div id="error2" style="font-family: Monaco, monospace; color: #d4122b; margin: 0 auto; padding-bottom: 10px; width: 300px;"></div>
            </div>

            <div class="mb-3" style="padding-top: 20px">
                <button class="registerbtn" type="submit">Register</button>
            </div>
            <h6 style="color: mediumseagreen">Please wait until successful image preview in case of image uploading...</h6><br>
        </form:form>
        <div class="mb-3" style="margin-top: 10px">
            <a href="/login">Already have an account? Sign in here!</a>
        </div>
        <div class="mb-3" style="margin-top: 10px">
            <a href="/register">Want to register as a User? Click here!</a>
        </div>
    </div>
</div>
<div class="footer">
    <div class="container-fluid" &lt;%&ndash;style="padding-left: 40%"&ndash;%&gt;>
        <div class="temp" style="padding-top: 15px; padding-bottom: 15px; text-align: center; font-size: 14px; color: #f2f2f2;">
            <p style="font-size: 15px"> © KenaKata Unlimited. 2021. All Rights Reserved</p>
            Email: kenakata.unlimited@gmail.com
            |
            <a href="/aboutUs">About Us</a>
        </div>
    </div>
</div>
</body>
<script>
    const password = document.getElementById("password");
    const form = document.getElementById("form");
    const errorElement = document.getElementById("error2");

    form.addEventListener('submit', (e)=>{
        let message=""
        var valid = true;
        $('.form-control').each(function () {
            if ($(this).val() === '') {
                valid = false;
            }
        });
        if(valid === false){
            message = "*Please fill up all input fields!"
        }
        if(password.value.length <= 7 && valid === true) {
            message= "*Password must be 8 characters long"
        }
        if(message.length>0){
            e.preventDefault()
            errorElement.innerText = message
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
