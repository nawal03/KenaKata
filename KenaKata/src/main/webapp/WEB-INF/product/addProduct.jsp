<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <style>
        .navbar-brand{
            font-family: "Lucida Calligraphy";
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

        .navbar-nav .actv{
            border-bottom: 3px solid white;
        }
        legend {
            font-size: 32px;
            padding-bottom: 20px;
        }

        /* Full-width input fields */
        input[type=text], input[type=email], input[type=password] {
            width: 350px;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background-color: white;
            border-radius: 8px;
            box-shadow: 1px 1px 5px gray;
            font-family: Monaco, monospace;
        }

        input[type=text]:focus, input[type=password]:focus {
            background-color: white;
            outline: none;
            font-family: Monaco, monospace;
        }
        input[type=checkbox] {
            font-family: Monaco, monospace;
            display: inline-block;
            height: 20px;
            width: 20px;
        }
        .registerbtn {
            background-color: #262626;
            opacity: 70%;
            color: white;
            font-size: 22px;
            padding: 12px 20px;
            /*margin: 8px 0;*/
            border-radius: 8px;
            cursor: pointer;
            width: 200px;
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
            font-size: 18px;
            display: inline-block;
            width: 200px;
            text-align: right;
        }
        .imgprev img{
            width: 100px;
            height: 250px;
        }
        select{
            font-family: Monaco, monospace;
            font-size: 18px;
            border: none;
            width: 250px;
            margin-bottom: 20px;
        }
        option{
            font-family: Monaco, monospace;
            font-size: 18px;
            padding-left: 80px;
        }
        textarea{
            font-family: Monaco, monospace;
            font-size: 18px;
            height: 200px;
            width: 450px;
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
            height: 120px; /* Set same as footer's height */
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
<body style="background-color: #f2f2f2; margin: 0 auto; font-family: Monaco, monospace">
<nav class="navbar navbar-default" style="background-color: #262626; margin: 0 auto">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: #f2f2f2; font-family: 'Lucida Calligraphy',cursive"><span class="glyphicon glyphicon-shopping-cart"></span> KenaKata</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/shop/home" style="color: white; font-family: 'Monaco',monospace;">Home</a></li>
            <li class="actv"><a href="/shop/addProduct" style="color: white; font-family: 'Monaco',monospace;">Add Product</a></li>

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
            <li><a href="/shop/settings" style="color: #f2f2f2; font-family: 'Monaco',monospace">
                <span class="glyphicon glyphicon-cog"></span> ${shop.shopname}</a></li>
            <li><a href="/shop/orders" style="color: #f2f2f2; font-family: Monaco, monospace">
                <span class="glyphicon glyphicon-list"></span> Orders</a><li>
            <li><a href="/logout" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
        </ul>
    </div>

</nav>

<div class="container-fluid" align="center">
    <h1 align="center"><b>Product Details</b></h1><br>

    <form method="POST" id="form" enctype="multipart/form-data">
        <div class="mb-3">
            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                        ${error} <span class="glyphicon glyphicon-exclamation-sign"></span>
                </div>
            </c:if>
        </div>
        <div class="mb-3">
            <div>
                <label><h4 style="color: #d4122b; display: inline-block" >*</h4>Product Name: </label>
                <input type="text"
                       name="name"
                       class="form-control"
                       autofocus="true"/>
            </div>
        </div>

        <div class="mb-3">
            <div style="transform: translate(-50px, 0px)">
                <label><h4 style="color: #d4122b; display: inline-block" >*</h4>Category: </label>
                <select name="category">
                    <c:forEach var="category" items="${categoryList}">
                        <option value="${category}">${category}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="mb-3">
            <div>
                <label><h4 style="color: #d4122b; display: inline-block" >*</h4>Color: </label>
                <input type="text" name="color"
                       class="form-control"
                       autofocus="true"/>
            </div>
        </div>
        <div class="mb-3">
            <div>
                <label><h4 style="color: #d4122b; display: inline-block" >*</h4>Price (&#x09F3): </label>
                <input type="text" name="price"
                       class="form-control"
                       autofocus="true"/>
            </div>
        </div>

        <div class="mb-3">
            <div>
                <label><h4 style="color: #d4122b; display: inline-block" >*</h4>Product Size: </label>
                <input type="text"
                       name="size"
                       class="form-control"
                       placeholder="i.e. s, m, l... or N/A"
                       autofocus="true"/>
            </div>
        </div>

        <div class="mb-3">
            <div style="transform: translate(-165px, 0px); padding-bottom: 20px">
                <label>In Stock: </label>
                <input type="checkbox" name="stock" value="true" id="stock" >
                <%--<input type="hidden" name="stock" value="false" id="stock">--%>
            </div>
        </div>

        <div class="mb-3">
            <div style="transform: translate(48px, 0px)">
                <label style="transform: translate(0px, -190px)">Description: </label>
                <textarea name="description"></textarea>
            </div>

        </div>

        <div class="mb-3">
            <div class="image" <%--style="float: left; padding-left: 50px; padding-top: 27px;"--%>>
                <label style="transform: translate(-180px, 0px)"><h4 style="color: #d4122b; display: inline-block" >*</h4>Product Images:</label>
                <img src="/images/website%20images/addimage.jpg" id="previewImage1" alt="profile image" width="120" height="150"/>
                <input accept="image/*" type="file" name="fileImage1" id="inputImage1">
                <input type="hidden" id="productImage1" name="image1" value=""/><br>
                <img src="/images/website%20images/addimage.jpg" id="previewImage2" alt="extra image" width="120" height="150" />
                <input accept="image/*" type="file" name="fileImage2" id="inputImage2">
                <input type="hidden" id="productImage2" name="image2" value=""/><br><br>
                <img src="/images/website%20images/addimage.jpg" id="previewImage3" alt="extra image" width="120" height="150" />
                <input accept="image/*" type="file" name="fileImage3" id="inputImage3">
                <input type="hidden" id="productImage3" name="image3" value=""/><br><br>

            </div>
        </div>
        <br>
        <br>
        <div class="mb-3">
            <div id="error2" style="font-family: Monaco, monospace; color: #d4122b; margin: 0 auto; padding-bottom: 10px"></div>
        </div>
        <div class="mb-3" <%--style="margin-top: 200px; padding-top: 20px"--%>>
            <button class="registerbtn" type="submit">Add Product</button>
            <h6 style="color: mediumseagreen">Please wait until successful image preview in case of image uploading...</h6><br>
        </div>
    </form>
</div>
<div class="footer">
    <div class="container-fluid" &lt;%&ndash;style="padding-left: 40%"&ndash;%&gt;>
        <div class="temp" style="padding-top: 15px; padding-bottom: 15px; text-align: center; font-size: 14px; color: #f2f2f2;">
            <p style="font-size: 15px"> © KenaKata Unlimited. 2021. All Rights Reserved</p>
            <a href="shop/complain/add">Contact Us</a>
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
        if(message.length>0){
            e.preventDefault()
            errorElement.innerText = message
        }
    })
    <!-- The core Firebase JS SDK is always required and must be listed first -->
</script>
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
    const imageInputField1 = document.querySelector("#inputImage1")
    const imageInputField2 = document.querySelector("#inputImage2")
    const imageInputField3 = document.querySelector("#inputImage3")
    const preview1 = document.querySelector("#previewImage1")
    const preview2 = document.querySelector("#previewImage2")
    const preview3 = document.querySelector("#previewImage3")
    const logoUrlInputField1 = document.querySelector("#productImage1")
    const logoUrlInputField2 = document.querySelector("#productImage2")
    const logoUrlInputField3 = document.querySelector("#productImage3")
    onImageSelected(imageInputField1, preview1, function() {
        console.log("image selected for logo")
        if (this.files && this.files[0]) {
            uploadToFirebase(this.files[0],logoUrlInputField1,function (imageUrl){
                console.log("adding image url to src")
                preview1.setAttribute('src', imageUrl);
            });

        }
    });
    onImageSelected(imageInputField2, preview2, function() {
        console.log("image selected for logo")
        if (this.files && this.files[0]) {
            uploadToFirebase(this.files[0],logoUrlInputField2,function (imageUrl){
                console.log("adding image url to src")
                preview2.setAttribute('src', imageUrl);
            });

        }
    });
    onImageSelected(imageInputField3, preview3, function() {
        console.log("image selected for logo")
        if (this.files && this.files[0]) {
            uploadToFirebase(this.files[0],logoUrlInputField3,function (imageUrl){
                console.log("adding image url to src")
                preview3.setAttribute('src', imageUrl);
            });

        }
    });
    function onImageSelected(imageInputField, preview,  onchange){
        imageInputField.addEventListener("change", onchange);
    }




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
