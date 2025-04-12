<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SkyWings Ticket</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
/* General reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Background and body */
body {
    font-family: 'Poppins', sans-serif;
    background: url('./images/flightt.jpg') no-repeat center center/cover;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 15px;
    min-height: 100vh;
}

/* Ticket container */
.ticket {
    width: 100%;
    max-width: 720px;
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
    overflow: hidden;
    position: relative;
    border: 2px dashed #007bff;
}

/* Cutout circles for ticket look */
.ticket::before, .ticket::after {
    content: '';
    position: absolute;
    width: 28px;
    height: 28px;
    background: #fff;
    border-radius: 50%;
    top: 50%;
    transform: translateY(-50%);
    z-index: 5;
}
.ticket::before {
    left: -14px;
}
.ticket::after {
    right: -14px;
}

/* Header */
.ticket-header {
    background: #007bff;
    color: #fff;
    padding: 25px;
    text-align: center;
}
.ticket-header h2 {
    font-size: 28px;
    font-weight: 600;
}

/* Body */
.ticket-body {
    padding: 30px;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    border-top: 2px dashed #ccc;
}
.ticket-section {
    flex: 1 1 45%;
    margin-bottom: 20px;
}
.ticket-section p {
    font-size: 18px;
    margin: 10px 0;
    font-weight: 500;
    color: #222;
}
.ticket-section p strong {
    color: #007bff;
}

/* Actions */
.actions {
    padding: 25px;
    text-align: center;
}

/* Buttons */
button, a {
    width: 30%;
    padding: 14px;
    background: #007bff;
    color: white;
    border: none;
    border-radius: 25px;
    font-size: 18px;
    cursor: pointer;
    transition: all 0.3s;
    margin: 0 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 255, 0.3);
    text-decoration: none;
    display: inline-block;
}
button:hover, a:hover {
    background: #0056b3;
    transform: translateY(-2px);
}

/* Responsive */
@media (max-width: 600px) {
    .ticket-body {
        flex-direction: column;
    }
    .ticket-section {
        flex: 1 1 100%;
    }
    button, a {
        width: 80%;
        margin: 10px 0;
    }
}
</style>
<script>
function printTicket() {
    window.print();
}
</script>
</head>
<body>

<div class="ticket">
    <div class="ticket-header">
        <h2>SkyWings Boarding Pass</h2>
    </div>
    <div class="ticket-body">
        <div class="ticket-section">
            <p><strong>Passenger:</strong> <%= request.getAttribute("name") %></p>
            <p><strong>From:</strong> <%= request.getAttribute("source") %></p>
            <p><strong>To:</strong> <%= request.getAttribute("destination") %></p>
            <p><strong>Airline:</strong> <%= request.getAttribute("airline") %></p>
        </div>
        <div class="ticket-section">
            <p><strong>Departure:</strong> <%= request.getAttribute("departureTime") %></p>
            <p><strong>Arrival:</strong> <%= request.getAttribute("arrivalTime") %></p>
            <p><strong>Price:</strong> <%= request.getAttribute("price") %> INR</p>
            <p><strong>Ticket No:</strong> SW-<%= (int)(Math.random() * 9000 + 1000) %></p>
        </div>
    </div>
    <div class="actions">
        <button onclick="printTicket()">Print Ticket</button>
        <a href="Home.html">Back to Home</a>
    </div>
</div>

</body>
</html>