package com.AirLinesReservation;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SearchFlightsServlet")
public class SearchFlightsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String source = request.getParameter("source");
        String destination = request.getParameter("destination");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String name = null;

        if (email != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_db", "root", "root");

                String userQuery = "SELECT name FROM users WHERE email = ?";
                PreparedStatement userStmt = conn.prepareStatement(userQuery);
                userStmt.setString(1, email);

                ResultSet userRs = userStmt.executeQuery();
                if (userRs.next()) {
                    name = userRs.getString("name");
                    session.setAttribute("name", name);
                }

                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        session.setAttribute("source", source);
        session.setAttribute("destination", destination);

        List<Flight> flights = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_db", "root", "root");

            String query = "SELECT airline, departure_time, arrival_time, price FROM flights WHERE source = ? AND destination = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, source);
            stmt.setString(2, destination);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Flight flight = new Flight();
                flight.setAirline(rs.getString("airline"));
                flight.setDepartureTime(rs.getString("departure_time"));
                flight.setArrivalTime(rs.getString("arrival_time"));
                flight.setPrice(rs.getDouble("price"));
                flights.add(flight);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("flights", flights);
        request.getRequestDispatcher("flights.jsp").forward(request, response);
    }
}