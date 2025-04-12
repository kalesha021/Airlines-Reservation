<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.AirLinesReservation.Flight" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Available Flights - Skywings Airlines</title>
<style>
/* ✅ Your Original CSS */
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
    overflow-y: auto;
    color: white;
    text-align: center;
}

.container {
    width: 80%;
    margin: auto;
    background: rgba(255, 255, 255, 0.2);
    padding: 30px;
    box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.3);
    margin-top: 120px;
    border-radius: 15px;
}

h1 {
    color: black;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    background: rgba(255, 255, 255, 0.9);
    color: black;
    margin-top: 20px;
    border-radius: 10px;
    overflow: hidden;
}

th, td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: center;
}

th {
    background-color: #007bff;
    color: white;
}

.book-btn {
    display: inline-block;
    padding: 8px 15px;
    background: #28a745;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 14px;
    transition: background 0.3s;
}

.book-btn:hover {
    background: #218838;
}

.no-results {
    color: red;
    font-size: 18px;
    margin-top: 20px;
}

.back-btn {
    display: inline-block;
    margin-top: 20px;
    padding: 12px 20px;
    background: linear-gradient(90deg, #007bff, #0056b3);
    color: white;
    text-decoration: none;
    border-radius: 25px;
    font-size: 16px;
    transition: all 0.3s;
    box-shadow: 0 5px 15px rgba(0, 0, 255, 0.3);
}

.back-btn:hover {
    background: linear-gradient(90deg, #0056b3, #003c7a);
    transform: translateY(-2px);
}
</style>
</head>
<body>

<div class="container">
    <h1>Available Flights</h1>

    <%
        List<Flight> flights = (List<Flight>) request.getAttribute("flights");
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");

        if (flights == null || flights.isEmpty()) {
    %>
    <p class="no-results">No flights available for the selected route.</p>
    <%
        } else {
    %>
    <table>
        <tr>
            <th>Airline</th>
            <th>Departure Time</th>
            <th>Arrival Time</th>
            <th>Price (INR)</th>
            <th>Action</th>
        </tr>
        <%
            for (Flight flight : flights) {
        %>
        <tr>
            <td><%= flight.getAirline() %></td>
            <td><%= flight.getDepartureTime() %></td>
            <td><%= flight.getArrivalTime() %></td>
            <td><%= String.format("%.2f", flight.getPrice()) %> INR</td>
            <td>
                <a href="BookFlightServlet?airline=<%= flight.getAirline() %>&departureTime=<%= flight.getDepartureTime() %>&arrivalTime=<%= flight.getArrivalTime() %>&price=<%= flight.getPrice() %>&source=<%= source %>&destination=<%= destination %>"
                   class="book-btn">Book Now</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        }
    %>
    <br> 
    <a href="Home.html" class="back-btn">Go Back</a>
</div>

</body>
</html>