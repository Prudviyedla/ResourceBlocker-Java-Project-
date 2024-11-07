package com.CapstoneRB.Controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.CapstoneRB.Model.Reservation;
import com.CapstoneRB.Service.ReservationService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ReservationController {

    @Autowired
    private ReservationService reservationService;
    
    @GetMapping("/reservations")
	public ModelAndView getAllCategories(){
    	ModelAndView mv=new ModelAndView("AllReservations");
		List<Reservation> allReservation = reservationService.getAllReservations();
		mv.addObject("reservations",allReservation );
		return mv;	
	}

    @GetMapping("/pendingReservations")
    public ModelAndView getPendingReservations() {
        List<Reservation> pendingReservations = reservationService.getPendingReservations();
        ModelAndView mv = new ModelAndView("pendingReservations");
        mv.addObject("reservations", pendingReservations);
        return mv;
    }

    @GetMapping("/approveReservation/{reservationId}")
    public ModelAndView approveReservation(@PathVariable long reservationId) {
        Reservation reservation = reservationService.approveReservation(reservationId);
        ModelAndView mv = new ModelAndView("reservationDetails");
        mv.addObject("reservation", reservation);
        return mv;
    }

    @GetMapping("/rejectReservation/{reservationId}")
    public ModelAndView rejectReservation(@PathVariable long reservationId) {
        Reservation reservation = reservationService.rejectReservation(reservationId);
        ModelAndView modelAndView = new ModelAndView("reservationDetails");
        modelAndView.addObject("reservation", reservation);
        return modelAndView;
    }

    @GetMapping("/exportToExcel")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        List<Reservation> reservations = reservationService.getAllReservations();
        reservationService.exportToExcel(reservations, response);
    }
	
}

