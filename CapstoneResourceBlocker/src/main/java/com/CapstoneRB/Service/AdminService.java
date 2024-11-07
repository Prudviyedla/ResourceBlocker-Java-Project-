package com.CapstoneRB.Service;

import com.CapstoneRB.Model.Admin;

public interface AdminService {
   
	Admin findByUsername(String username);
	
    void save(Admin user);
    
}