package com.CapstoneRB.Service;

import java.io.IOException;
import java.util.List;

import com.CapstoneRB.Model.Reservation;

import jakarta.servlet.http.HttpServletResponse;

public interface ReservationService {
	
    List<Reservation> getPendingReservations();
    Reservation approveReservation(long reservationId);
    Reservation rejectReservation(long reservationId);
	List<Reservation> getAllReservations();
	void exportToExcel(List<Reservation> reservations, HttpServletResponse response);
	
}
