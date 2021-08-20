<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    .navbar-brand{
        font-family: "Lucida Calligraphy";
    }

    .row{
        display: inline;
    }
    .carousel-inner .item img{
        border-radius: 10px;
        height: 100%;
        width: 100%;
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

    /* Overwrite default styles of hr */
    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }
    .navbar-nav .actv{
        border-bottom: 3px solid white;
    }
    textarea{
        font-family: Monaco, monospace;
        font-size: 18px;
        height: 250px;
        width: 550px;
    }
    .card{
        background-color: rgba(255, 255, 255, 0.9);
        border-radius: 15px;
        width: 1100px;
        height: 150px;
        display: inline-block;
        box-shadow: 4px 4px 12px gray;
        margin-bottom: 50px;
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
    <title>Complains</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f2f2f2; font-family: Monaco, monospace">
<nav class="navbar navbar-default" style="background-color: #262626; font-family: Monaco, monospace">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: #f2f2f2"><span class="glyphicon glyphicon-shopping-cart"></span> KenaKata</a>
        </div>
        <ul>
            <li><a href="/logout" style="color: #f2f2f2; font-family: 'Monaco',monospace;">
                <div style="padding-top: 15px; padding-left: 1350px"><span class="glyphicon glyphicon-log-in"></span> Logout</div>
            </a></li>
        </ul>
    </div>
</nav>

<div class="container" align="center">
    <div class="row">
        <legend style="color: #262626; font-family: Monaco, monospace; font-size: 32px"> Unreplied Complains </legend>
        <c:if test="${unrepliedComplains.size() == 0}">
            <h4>No Complains to Show</h4>
        </c:if>
        <c:forEach var="complain" items="${unrepliedComplains}">
            <form action="/admin/complain/reply/${complain.id}">
                <div class="card" align="left">
                    <div class="card-header" style="padding-top: 20px; padding-left: 27px;
                            font-style: oblique; font-size: 15px; color: gray">
                            ${complain.username} ${complain.time}
                    </div>
                    <div class="card-body">
                        <blockquote class="blockquote mb-0">
                            <p>${complain.message}</p>
                            <footer class="blockquote-footer">
                                <input type="text" id="in" name="reply" style="opacity: 0; height: 0px; width: 0px">
                                <button onclick="myFunction()" type="submit"
                                        style="background-color: rgba(167, 199, 231, 0.4); border: none;
                                        height: 40px; width: 80px; color: darkblue; font-family: Monaco, monospace; border-radius: 8px">
                                    Reply <span class="glyphicon glyphicon-plus"></span>
                                </button> </footer>
                        </blockquote>
                    </div>
                </div>
            </form>
        </c:forEach>
    </div>
    <hr/>
    <div class="row">
        <legend style="color: #262626; font-family: Monaco, monospace; font-size: 32px"> Replied Complains </legend>
        <c:if test="${repliedComplains.size() == 0}">
            <h4>No Complains to Show</h4>
        </c:if>
        <c:if test="${repliedComplains.size() != 0}">
            <c:forEach var="complain" items="${repliedComplains}">
                <div class="card" align="left">
                    <div class="card-header" style="padding-top: 20px; padding-left: 27px;
                            font-style: oblique; font-size: 15px; color: gray">
                            ${complain.username} ${complain.time}
                    </div>
                    <div class="card-body">
                        <blockquote class="blockquote mb-0">
                            <p>${complain.message}</p>
                            <footer class="blockquote-footer" style="color: darkblue; font-size: 18px">
                                    ${complain.reply} </footer>
                        </blockquote>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>

</div>
<div class="footer">
    <div class="container-fluid" &lt;%&ndash;style="padding-left: 40%"&ndash;%&gt;>
        <div class="temp" style="padding-top: 15px; padding-bottom: 15px; text-align: center; font-size: 14px; color: #f2f2f2;">
            <p style="font-size: 15px"> © KenaKata Unlimited. 2021. All Rights Reserved</p>
            <a href="/aboutUs">About Us</a>
        </div>
    </div>
</div>
</body>
<script>
    function myFunction() {
        let reply = prompt("Enter reply for this complain:");
        if (reply == null || reply === "") {

        } else {
            var x= document.getElementById("in");
            x.value=reply;
        }
    }
</script>
</html>
