<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Airline Reservation System</title>
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
	overflow-y: auto;
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

header h1, nav ul li a {
	transition: all 0.3s ease-in-out;
}

header h1:hover, nav ul li a:hover {
	color: lightblue;
	text-shadow: 0 0 15px rgba(0, 0, 255, 0.8);
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
}

.container {
	max-width: 600px;
	width: 90%;
	background: rgba(255, 255, 255, 0.2);
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.3);
	margin-top: 120px;
	margin-bottom: 80px;
}

.container h1 {
	text-align: center;
	color: black;
	margin-bottom: 30px;
}

.form-group {
	position: relative;
	width: 100%;
	margin-bottom: 30px;
}

input {
	width: 100%;
	padding: 12px 14px 6px 40px;
	border: none; /* Removed border */
	border-radius: 25px;
	transition: all 0.3s ease-in-out;
	background: rgba(255, 255, 255, 0.3);
	color: black;
	font-size: 15px;
	outline: none;
	position: relative;
}

input:focus {
	box-shadow: 0 0 10px darkblue; /* Glowing effect */
}

.form-group label {
	position: absolute;
	left: 40px;
	top: 50%;
	transform: translateY(-50%);
	color: black;
	font-size: 14px;
	transition: 0.3s ease-in-out;
	pointer-events: none;
	background: transparent;
	padding: 2px 5px;
}

input:focus + label,
input:not(:placeholder-shown) + label {
	top: -10px;
	left: 40px;
	font-size: 12px;
	color: black;
	background: rgba(255, 255, 255, 0.7);
	border-radius: 5px;
	padding: 3px 6px;
}

.icon {
	position: absolute;
	left: 15px;
	top: 50%;
	transform: translateY(-50%);
	color: black;
	font-size: 18px;
}

button {
	width: 100%;
	padding: 14px;
	background: linear-gradient(90deg, #007bff, #0056b3);
	color: white;
	border: none;
	border-radius: 25px;
	font-size: 18px;
	cursor: pointer;
	transition: all 0.3s;
	box-shadow: 0 5px 15px rgba(0, 0, 255, 0.3);
}

button:hover {
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

@media (max-width: 768px) {
	.container {
		width: 95%;
		padding: 20px;
	}
	header {
		flex-direction: column;
		text-align: center;
		padding: 15px;
	}
	nav ul {
		flex-direction: column;
		gap: 10px;
	}
}
</style>
</head>
<body>
    <div class="container">
        <h1>User Login</h1>
        
        <% String errorMessage = request.getParameter("error"); %>
        <% if (errorMessage != null) { %>
            <p style="color: red; text-align: center;"> <%= errorMessage %> </p>
        <% } %>

        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="Registration.html">Register here</a></p>
    </div>
</body>
</html>

