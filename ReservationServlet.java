package com.AirLinesReservation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user data from the form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Validate inputs
        if (name == null || email == null || phone == null || password == null || 
            name.isEmpty() || email.isEmpty() || phone.isEmpty() || password.isEmpty()) {
            response.sendRedirect("Registration.html?error=missing_fields");
            return;
        }

        // Hash password using SHA-256
        String hashedPassword = hashPassword(password);

        // Database connection setup
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC Driver
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_db?user=root&password=root"
            		+ "") ){
                // Check if user already exists
                String checkQuery = "SELECT * FROM users WHERE email=?";
                try (PreparedStatement checkStmt = con.prepareStatement(checkQuery)) {
                    checkStmt.setString(1, email);
                    try (ResultSet rs = checkStmt.executeQuery()) {
                        if (rs.next()) {
                            // User already exists
                            response.sendRedirect("Registration.html?error=user_exists");
                            return;
                        }
                    }
                }

                // Insert new user into database
                String insertQuery = "INSERT INTO users (name, email, phone, password) VALUES (?, ?, ?, ?)";
                try (PreparedStatement insertStmt = con.prepareStatement(insertQuery)) {
                    insertStmt.setString(1, name);
                    insertStmt.setString(2, email);
                    insertStmt.setString(3, phone);
                    insertStmt.setString(4, hashedPassword); // Store hashed password

                    int result = insertStmt.executeUpdate();
                    if (result > 0) {
                        response.sendRedirect("Login.html"); // Successful registration
                    } else {
                        response.sendRedirect("Registration.html?error=registration_failed");
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("Registration.html?error=driver_error");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Registration.html?error=database_error");
        }
    }

    // Helper method to hash password using SHA-256
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}