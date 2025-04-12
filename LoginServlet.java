package com.AirLinesReservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Email and Password are required!');");
            out.println("location='login.jsp';");
            out.println("</script>");
            return;
        }

        String hashedPassword = hashPassword(password);

        if (validateUser(email, hashedPassword)) {
            // Store the email in session
            HttpSession session = request.getSession();
            session.setAttribute("email", email); // Use email as session attribute

            // Redirect to the Available Flights page (instead of Home.html)
            response.sendRedirect("Home.html"); // Change this to your next page after login
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('Invalid Email or password!');");
            out.println("location='Login.html';");
            out.println("</script>");
        }
    }

    private boolean validateUser(String email, String password) {
        boolean isValid = false;
        String url = "jdbc:mysql://localhost:3306/airline_db";
        String dbUser = "root";
        String dbPassword = "root";
        String query = "SELECT COUNT(*) FROM users WHERE email=? AND password=?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                 PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, email);
                ps.setString(2, password);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        isValid = true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }

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
