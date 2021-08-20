<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="bind" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>View Cart</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .navbar-brand{
            font-family: "Lucida Calligraphy";
        }
        .navbar-nav .actv{
            border-bottom: 3px solid white;
        }
        .table-striped span{
            color: #262626;
        }
        .table-striped span:hover{
            color: #d4122b;
        }
        legend {
            font-size: 28px;
            padding-bottom: 12px;
        }
        .container {
            padding: 50px;
            alignment: center;
            align-content: center;
            opacity: 100%;
        }
        label{
            font-family: Monaco, monospace;
            font-size: 18px;
            display: inline-block;
            width: 200px;
            text-align: right;
        }
        select{
            font-family: Monaco, monospace;
            font-size: 18px;
            border: none;
            width: 150px;
            margin-bottom: 20px;
        }
        option{
            font-family: Monaco, monospace;
            font-size: 18px;
            padding-left: 80px;
        }
        /* Full-width input fields */
        input[type=text], input[type=email], input[type=password] {
            width: 50%;
            /*padding: 15px;*/
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            font-family: Monaco, monospace;
            font-size: 18px;
        }

        input[type=text]:focus, input[type=email] input[type=password]:focus {
            outline: none;
            font-family: Monaco, monospace;
        }
        .mb-3{
            text-align: center;
        }
        /* Overwrite default styles of hr */
        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }
        .navbar-nav .actv{
            border-bottom: 3px solid white;
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
            width: 40%;
            height: auto;
            opacity: 0.9;
            alignment: center;
            font-family: Monaco, monospace;
        }

        .registerbtn:hover {
            opacity:1;
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
            font-family: Monaco, monospace;
            background-color: #262626;
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 80px;
        }
    </style>
</head>
<body style="background-color: #f2f2f2; font-family: Monaco, monospace">

<nav class="navbar navbar-default" style="background-color: #262626">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: #f2f2f2"><span class="glyphicon glyphicon-shopping-cart"></span> KenaKata</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/customer/home" style="color: #f2f2f2; font-family: 'Monaco',monospace">Home</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/customer/settings" style="color: #f2f2f2; font-family: 'Monaco',monospace">
                <span class="glyphicon glyphicon-cog"></span> ${customer.username}</a></li>
            <li class="actv"><a href="/customer/cart/view" style="color: #f2f2f2; font-family: Monaco, monospace" style="font-family: Monaco, monospace">
                <span class="glyphicon glyphicon-shopping-cart"></span>
                Cart</a></li>
            <li><a href="/customer/orders" style="color: #f2f2f2; font-family: Monaco, monospace">
                <span class="glyphicon glyphicon-list"></span> Orders</a><li>
            <li><a href="/logout" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid">
    <h2 style="text-align: center; font-family: Monaco, monospace;">Items in Your Cart</h2>
    <br>
    <div class="error" align="center" style="transform: translate(0px, -15px); color: #d4122b">
        <h4>${updated}</h4>
    </div>
    <div class="row">
        <table class="table table-striped" style="width: 80%; margin: auto; font-size: 18px">
            <thead>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Shop Name</th>
                <th>Product Size</th>
                <th>Product Quantity</th>
                <th>Price</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="cart" items="${cartList}">
                <tr>
                    <td>${cart.pid}</td>
                    <td>${cart.pname}</td>
                    <td>${cart.shopname}</td>
                    <td>${cart.size}</td>
                    <td>${cart.quantity}</td>
                    <td>${cart.price}</td>
                    <td><a href="/customer/cart/delete/${cart.cid}" onclick="return confirm('Are you sure you want to delete it?');">
                        <span class="glyphicon glyphicon-trash"></span></a></td>
                </tr>
            </c:forEach>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td style="text-align: right">Total Price:</td>
                <td><b>${totalPrice} &#x09F3</b></td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row">
        <c:if test="${cartList.size() == 0}">
            <h3 style="font-family: Monaco, monospace; opacity: 70%; text-align: center;">
                Your cart is currently empty.
            </h3>
        </c:if>
    </div>
    <c:if test="${cartList.size() != 0}">

        <div class="container" align="center">
            <div class="row">
                <legend style="color: #262626; font-family: Monaco, monospace"> Order Details</legend>

                <form:form method="POST" modelAttribute="customer" class="form-signin">

                <div class="mb-3">
                    <div>
                        <label>First Name: </label>
                        <form:input type="text"
                                    path="fname"
                                    class="form-control"
                                    placeholder="Enter First Name"
                                    autofocus="true" readonly="true" cssStyle="padding-left: 10px"/>
                    </div>
                </div>

                <div class="mb-3">
                    <div>
                        <label>Last Name: </label>
                        <form:input type="text"
                                    path="lname"
                                    class="form-control"
                                    placeholder="Enter Last Name"
                                    autofocus="true" readonly="true"/>
                    </div>
                </div>

                <div class="mb-3">
                    <div>
                        <label>Email: </label>
                        <form:input type="email"
                                    path="email"
                                    class="form-control"
                                    placeholder="Enter Email Address"
                                    autofocus="true" readonly="true"/>
                    </div>
                </div>

                <div class="mb-3">
                    <div>
                        <label>Contact Number:</label>
                        <form:input type="text"
                                    path="phone"
                                    class="form-control"
                                    placeholder="Enter Contact Number"
                                    autofocus="true" readonly="true"/>
                    </div>
                </div>
            </div>
            </form:form>
            <form:form method="POST" modelAttribute="order" class="form-signin" id="form">

            <div class="mb-3">
                <div>
                    <label><h4 style="color:red; display: inline-block">*</h4>Shipping Address: </label>
                    <form:input type="text"
                                path="address"
                                id="address"
                                class="form-control"
                                placeholder="Enter Full Address"
                                autofocus="true"/>
                    <div id="error" align="center" style="color: #d4122b; transform: translate(-25px, -20px)"></div>
                </div>
                <div class="mb-3" style="transform: translate(-190px, 0px)">
                    <label style="display: inline-block; text-align: right"><h4 style="color:red; display: inline-block">*</h4>Shipping Division: </label>
                    <select name="da">
                        <c:forEach var="delivery_area" items="${daList}">
                            <option value="${delivery_area}">${delivery_area}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <div>
                        <label>Total Amount (Tk): </label>
                        <form:input type="text"
                                    path="totalprice"
                                    class="form-control"
                                    value="${totalPrice} "
                                    autofocus="true" readonly="true"/>
                    </div>
                </div>
                <button class="registerbtn" type="submit" onclick="return confirm('Do you confirm this order?');">Checkout</button>
                </form:form>
            </div>
        </div>
    </c:if>

</div>
<div class="footer">
    <div class="container-fluid" &lt;%&ndash;style="padding-left: 40%"&ndash;%&gt;>
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
    const address = document.getElementById("address");
    const form = document.getElementById("form");
    const errorElement = document.getElementById("error");

    form.addEventListener('submit', (e)=>{
        let message=[]
        if(address.value.length <= 0) {
            message.push("*Please insert shipping address")
        }
        if(message.length>0){
            e.preventDefault()
            errorElement.innerText = message.join(',')
        }
    })

</script>
</html>