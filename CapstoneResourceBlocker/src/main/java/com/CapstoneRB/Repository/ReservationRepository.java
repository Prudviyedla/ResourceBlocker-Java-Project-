package com.CapstoneRB.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.CapstoneRB.Model.Reservation;
import com.CapstoneRB.Model.Reservation.ReservationStatus;


@Repository
	public interface ReservationRepository extends JpaRepository<Reservation, Long> {
	
	    List<Reservation> findByEmployeeId(long employeeId);
	    List<Reservation> findByResourceId(String resourceId);
	    List<Reservation> findByStatus(ReservationStatus pending);
	    
	}
