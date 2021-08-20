<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
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
<head>
    <title>Account Settings</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body style="background-color: #f2f2f2">

<nav class="navbar navbar-default" style="background-color: #262626">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: #f2f2f2"><span class="glyphicon glyphicon-shopping-cart"></span> KenaKata</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/customer/home" style="color: #f2f2f2; font-family: 'Monaco',monospace"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="actv"><a href="/customer/settings" style="color: #f2f2f2; font-family: 'Monaco',monospace">
                <span class="glyphicon glyphicon-cog"></span> ${customer.username}</a></li>
            <li><a href="/customer/cart/view" style="color: #f2f2f2; font-family: 'Monaco',monospace">
                <span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
            <li><a href="/customer/orders" style="color: #f2f2f2; font-family: Monaco, monospace">
                <span class="glyphicon glyphicon-list"></span> Orders</a><li>
            <li><a href="/logout" style="color: #f2f2f2; font-family: 'Monaco',monospace">
                <span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
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
        <form method="POST" id="form">

            <div class="mb-3">
                <div>
                    <label>First Name: </label>
                    <input type="text"
                           name="fname"
                           value="${customer.fname}"
                           id="fname"
                           placeholder="Enter First Name"
                           autofocus="true"
                           style="background-color: white"/>
                </div>
            </div>

            <div class="mb-3">
                <div>
                    <label>Last Name: </label>
                    <input type="text"
                           name="lname"
                           id="lname"
                           value="${customer.lname}"
                           placeholder="Enter Last Name"
                           autofocus="true"
                           style="background-color: white"/>
                </div>
            </div>

            <div class="mb-3">
                <div>
                    <label>Username: </label>
                    <input type="text"
                           name="username"
                           value="${customer.username}"
                           autofocus="true" readonly="true"/>
                </div>
            </div>

            <div class="mb-3">
                <div>
                    <label>Email: </label>
                    <input type="email"
                           name="email"
                           value="${customer.email}"
                           autofocus="true" readonly="true"/>
                </div>
            </div>

            <div class="mb-3">
                <div>
                    <label>Contact Number: </label>
                    <input type="text"
                           name="phone"
                           id="phone"
                           value="${customer.phone}"
                           placeholder="Enter Contact Number"
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
                <div id="error" style="font-family: Monaco, monospace; color: #d4122b; margin: 0 auto; padding-bottom: 10px"></div>
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
            <button class="registerbtn" id="save" type="submit" style="transform: translate(40px, 30px)" >Save</button>
        </form>


    </div>
</div>
<div class="footer" style="font-family: Monaco, monospace">
    <div class="container-fluid" style="padding-left: 5%">
        <div class="temp" style="padding-top: 15px; padding-bottom: 15px; text-align: center; font-size: 14px; color: #f2f2f2;">
            <p style="font-size: 15px"> © KenaKata Unlimited. 2021. All Rights Reserved</p>
            <a href="/customer/complain/add">Contact Us</a>
            |
            <a href="/aboutUs">About Us</a>
        </div>
    </div>
</div>
</body>

<script>
    const password = document.getElementById("password");
    const currentpass = document.getElementById("currentpass");
    const form = document.getElementById("form");
    const errorElement = document.getElementById("error");
    const fname = document.getElementById("fname");
    const lname = document.getElementById("lname");
    const phone = document.getElementById("phone");

    form.addEventListener('submit', (e)=>{
        let message=[]
        if(password.value.length >=1 & password.value.length<= 7) {
            message.push("*Password must be 8 characters long")
        }
        if (currentpass.value.length == 0) {
            message.push("*Enter current password to save changes")
        }
        else if (fname.value.length == 0 || lname.value.length == 0 || phone.value.length == 0) {
            message.push("Name or contact number field cannot be empty!")
        }
        if(message.length>0){
            e.preventDefault()
            errorElement.innerText = message.join(',')
        }
    })

</script>
</html>
