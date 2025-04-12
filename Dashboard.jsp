<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Skywings Airlines</title>
    
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: url('./images/flightt.jpg') no-repeat center center/cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            margin: 0;
        }
        
        header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 40px;
            background: rgba(0, 0, 0, 0.4); 
            color: white;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
        }
        
        .logo {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 20px;
        }
        
        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            padding: 0;
        }
        
        nav ul li {
            display: inline;
        }
        
        nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            text-transform: uppercase;
            transition: all 0.3s ease-in-out;
        }
        
        nav ul li a:hover {
            color: lightblue;
            text-shadow: 0 0 15px rgba(0, 0, 255, 0.8);
        }
        
        .container {
            max-width: 800px;
            width: 90%;
            background: rgba(255, 255, 255, 0.2);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.3);
            margin-top: 120px;
            text-align: center;
        }
        
        .container h1 {
            color: black;
            margin-bottom: 20px;
        }
        
        .buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }
        
        .buttons a {
            padding: 12px 20px;
            background: linear-gradient(90deg, #007bff, #0056b3);
            color: white;
            border-radius: 25px;
            text-decoration: none;
            font-size: 18px;
            transition: all 0.3s;
            box-shadow: 0 5px 15px rgba(0, 0, 255, 0.3);
        }
        
        .buttons a:hover {
            background: linear-gradient(90deg, #0056b3, #003c7a);
            transform: translateY(-2px);
        }
        
        footer {
            position: relative;
            text-align: center;
            font-size: 14px;
            color: white;
            width: 100%;
            padding: 10px 0;
            background: rgba(0, 0, 0, 0.4);
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <header>
        <img src="images/logo.jpg" alt="Airline Logo" class="logo">
        <h1>SKYWINGS AIRLINES DASHBOARD</h1>
        <nav>
            <ul>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h1>Welcome to Your Dashboard</h1>
        <p>Manage your flight bookings, check schedules, and update your profile.</p>
        
        <div class="buttons">
            <a href="bookFlight.jsp">Book a Flight</a>
            <a href="viewBookings.jsp">View Bookings</a>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 Skywings Airlines. All rights reserved.</p>
    </footer>
</body>
</html>

