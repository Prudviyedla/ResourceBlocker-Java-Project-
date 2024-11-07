package com.CapstoneRB.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CapstoneRB.Model.Admin;
import com.CapstoneRB.Repository.AdminRepository;


@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminRepository adminRepository;

    @Override
    public Admin findByUsername(String username) {
        return adminRepository.findByUsername(username);
    }

    @Override
    public void save(Admin user) {
    	adminRepository.save(user);
    }
    

}


