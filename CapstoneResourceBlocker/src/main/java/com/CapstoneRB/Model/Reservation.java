package com.CapstoneRB.Model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "reservations")
public class Reservation {
	

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    @Column(name = "employee_id")
	    private Long employeeId;

	    @Column(name = "resource_id")
	    private String resourceId;

	    @Column(name = "start_time")
	    private LocalDateTime startTime;

	    @Column(name = "end_time")
	    private LocalDateTime endTime;
	    
	    @Column(name = "resource_name")
	    private String resourceName;

	    @Enumerated(EnumType.STRING)
	    private ReservationStatus status;
	    
	    public enum ReservationStatus {
	        PENDING, APPROVED, REJECTED
	    }

		public Reservation() {
			
		}

		public Reservation(Long id, Long employeeId, String resourceId, LocalDateTime startTime, LocalDateTime endTime,
				String resourceName, ReservationStatus status) {
			super();
			this.id = id;
			this.employeeId = employeeId;
			this.resourceId = resourceId;
			this.startTime = startTime;
			this.endTime = endTime;
			this.resourceName = resourceName;
			this.status = status;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public Long getEmployeeId() {
			return employeeId;
		}

		public void setEmployeeId(Long employeeId) {
			this.employeeId = employeeId;
		}

		public String getResourceId() {
			return resourceId;
		}

		public void setResourceId(String resourceId) {
			this.resourceId = resourceId;
		}

		public LocalDateTime getStartTime() {
			return startTime;
		}

		public void setStartTime(LocalDateTime startTime) {
			this.startTime = startTime;
		}

		public LocalDateTime getEndTime() {
			return endTime;
		}

		public void setEndTime(LocalDateTime endTime) {
			this.endTime = endTime;
		}

		public String getResourceName() {
			return resourceName;
		}

		public void setResourceName(String resourceName) {
			this.resourceName = resourceName;
		}

		public ReservationStatus getStatus() {
			return status;
		}

		public void setStatus(ReservationStatus status) {
			this.status = status;
		}

		@Override
		public String toString() {
			return "Reservation [id=" + id + ", employeeId=" + employeeId + ", resourceId=" + resourceId
					+ ", startTime=" + startTime + ", endTime=" + endTime + ", resourceName=" + resourceName
					+ ", status=" + status + "]";
		}

	

		
	}

