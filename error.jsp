<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Airline Reservation System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            text-align: center;
        }
        .container {
            width: 60%;
            margin: auto;
            background: white;
            padding: 30px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
            border-radius: 10px;
        }
        h1 {
            color: #721c24;
        }
        p {
            color: #721c24;
            font-size: 18px;
        }
        .error-icon {
            font-size: 50px;
            color: #721c24;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #721c24;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #a94442;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="error-icon">⚠️</div>
        <h1>Oops! Something Went Wrong</h1>
        <p><%= request.getAttribute("error") %></p>
        <a href="index.html">Go Back to Home</a>
    </div>

</body>
</html>

