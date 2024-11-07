package com.CapstoneRB.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.CapstoneRB.Model.Admin;


@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {
   
	Admin findByUsername(String username);
	
}