package com.CapstoneRB.Service;

import java.io.IOException;
import java.util.List;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.CapstoneRB.Model.Reservation;
import com.CapstoneRB.Model.Reservation.ReservationStatus;
import com.CapstoneRB.Repository.ReservationRepository;

import jakarta.servlet.http.HttpServletResponse;


@Service
	public class ReservationServiceImpl implements ReservationService {

	    @Autowired
	    private ReservationRepository reservationRepository;
	    
	    @Override
	    public List<Reservation> getAllReservations() {
	        return reservationRepository.findAll();
	    }

	    @Override
	    public List<Reservation> getPendingReservations() {
	        return reservationRepository.findByStatus(ReservationStatus.PENDING);
	    }

	    public Reservation approveReservation(long reservationId) {
	        Reservation reservation = reservationRepository.findById(reservationId).orElseThrow(() -> new IllegalArgumentException("Invalid reservation ID"));
	        reservation.setStatus(ReservationStatus.APPROVED);
	        return reservationRepository.save(reservation);
	    }

	    @Override
	    public Reservation rejectReservation(long reservationId) {
	        Reservation reservation = reservationRepository.findById(reservationId).orElseThrow(() -> new IllegalArgumentException("Invalid reservation ID"));
	        reservation.setStatus(ReservationStatus.REJECTED);
	        return reservationRepository.save(reservation);
	    }

	    @Override
	    public void exportToExcel(List<Reservation> reservations, HttpServletResponse response) {
	        try {
	            XSSFWorkbook workbook = new XSSFWorkbook();
	            XSSFSheet sheet = workbook.createSheet("Reservations");

	            XSSFRow header = sheet.createRow(0);
	            header.createCell(0).setCellValue("ID");
	            header.createCell(1).setCellValue("Employee ID");
	            header.createCell(2).setCellValue("RESOURCE NAME");
	            header.createCell(3).setCellValue("Resource ID");
	            header.createCell(4).setCellValue("Start Time");
	            header.createCell(5).setCellValue("End Time");
	            header.createCell(6).setCellValue("Status");

	            int rowNum = 1;
	            for (Reservation reservation : reservations) {
	                XSSFRow row = sheet.createRow(rowNum++);
	                row.createCell(0).setCellValue(reservation.getId());
	                row.createCell(1).setCellValue(reservation.getEmployeeId());
	                row.createCell(2).setCellValue(reservation.getResourceName().toString());
	                row.createCell(3).setCellValue(reservation.getResourceId().toString());
	                row.createCell(4).setCellValue(reservation.getStartTime().toString());
	                row.createCell(5).setCellValue(reservation.getEndTime().toString());
	                row.createCell(6).setCellValue(reservation.getStatus().toString());
	            }

	            response.setContentType("application/vnd.ms-excel");
	            response.setHeader("Content-disposition", "attachment; filename=final_list_of_reservations.xlsx");
	            workbook.write(response.getOutputStream());
	            workbook.close();
	        } catch (IOException e) {
	            throw new RuntimeException("Error exporting reservations to Excel sheet", e);
	        }
	    }
		
	}

