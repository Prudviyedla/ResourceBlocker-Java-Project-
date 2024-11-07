package com.CapstoneRB.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.CapstoneRB.Model.Admin;
import com.CapstoneRB.Repository.AdminRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminRepository adminService;


    @GetMapping("/login")
    public ModelAndView login() {
    	ModelAndView mv=new ModelAndView("login");
        return mv;
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session, Model model) {
        Admin admin = adminService.findByUsername(username);
        if (admin != null && admin.getPassword().equals(password)) {
            session.setAttribute("admin", admin);
            return "redirect:/welcome";
        } else {
            return "error";
        }
    }

    @RequestMapping("/welcome")
	public ModelAndView welcome() {
		ModelAndView mv=new ModelAndView("Welcome");
		return mv;
	}
	

    @GetMapping("/welcome")
    public String welcome(HttpSession session, Model model) {
    	Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            model.addAttribute("username", admin.getUsername());
            return "welcome";
        } else {
            return "redirect:/login";
        }
    }
    
    
    @GetMapping("/updatepassword")
    public ModelAndView updatePassword(ModelAndView mv) {
    	mv=new ModelAndView("updatepassword");
        return mv;
    }

    @PostMapping("/updatepassword")
    public String updatePassword(HttpSession session, @RequestParam String oldPassword, @RequestParam String newPassword, Model model) {
    	Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null && admin.getPassword().equals(oldPassword) && !admin.getPassword().equals(newPassword)) {
        	admin.setPassword(newPassword);
        	adminService.save(admin);
            session.removeAttribute("admin");
            model.addAttribute("message", "Password updated successfully, please login again");
            return "login";
        } 
        else if(oldPassword.equals(newPassword)) {
            model.addAttribute("error", "Both are same");
        	return "updatepassword";
        }
        
        else {
            model.addAttribute("error", "Invalid password");
            return "updatepassword";
        }
    }
    
    

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
