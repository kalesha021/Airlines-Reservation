package com.AirLinesReservation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/BookFlightServlet")
public class BookFlightServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String name = (String) session.getAttribute("name");
        String source = (String) session.getAttribute("source");
        String destination = (String) session.getAttribute("destination");

        String airline = request.getParameter("airline");
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
        String price = request.getParameter("price");

        request.setAttribute("name", name);
        request.setAttribute("source", source);
        request.setAttribute("destination", destination);
        request.setAttribute("airline", airline);
        request.setAttribute("departureTime", departureTime);
        request.setAttribute("arrivalTime", arrivalTime);
        request.setAttribute("price", price);

        request.getRequestDispatcher("Ticketdetails.jsp").forward(request, response);
    }
}