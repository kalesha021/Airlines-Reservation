package com.AirLinesReservation;

public class Flight {
    private String airline;
    private String departureTime;
    private String arrivalTime;
    private double price; //  Change price to double

    // Constructor
    public Flight() {}

    public Flight(String airline, String departureTime, String arrivalTime, double price) { // ✅ Accept price as double
        this.airline = airline;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.price = price;
    }

    // Getters and Setters
    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public double getPrice() { //  Change return type to double
        return price;
    }

    public void setPrice(double price) { //  Ensure setter accepts double
        this.price = price;
    }

    @Override
    public String toString() {
        return "Flight{" +
                "airline='" + airline + '\'' +
                ", departureTime='" + departureTime + '\'' +
                ", arrivalTime='" + arrivalTime + '\'' +
                ", price=" + price +
                '}';
    }
}