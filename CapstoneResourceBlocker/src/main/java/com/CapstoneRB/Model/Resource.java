package com.CapstoneRB.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;



@Entity
@Table(name="resource")
public class Resource {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int rid;
	
	private String Location;
	
	private String type;
	
	private String rName;
	
	private int capacity;
	
	private String resourceId;

	public Resource() {

	}

	public Resource(int rId, String location, String type, String rName, int capacity, String resourceId) {
		super();
		this.rid = rId;
		this.Location = location;
		this.type = type;
		this.rName = rName;
		this.capacity = capacity;
		this.resourceId =resourceId;
	}

	public int getrId() {
		return rid;
	}

	public void setrId(int rId) {
		this.rid = rId;
	}

	public String getLocation() {
		return Location;
	}

	public void setLocation(String location) {
		Location = location;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}

	@Override
	public String toString() {
		return "Resource [rid=" + rid + ", Location=" + Location + ", type=" + type + ", rName=" + rName + ", capacity="
				+ capacity + ", resourceId=" + resourceId + "]";
	}

	

}
