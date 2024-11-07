package com.CapstoneRB.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.CapstoneRB.Model.Resource;
import com.CapstoneRB.Service.ResourceService;


@RestController
public class ResourceController {

	@Autowired
	ResourceService resourceService;
	
	@RequestMapping("/ResourceOperations")
	public ModelAndView ResourcePage(ModelAndView mv) {
		mv=new ModelAndView("Resource");
		return mv;
	}
	
	@RequestMapping("/addResource")
	public ModelAndView addResourcePage(ModelAndView mv) {
		mv=new ModelAndView("AddResource");
		mv.addObject("resource", new Resource());
		return mv;
	}
	
	@PostMapping("/resource")
	public ResponseEntity<String> addResource(@ModelAttribute("resource") @RequestBody Resource resource){
		String status= resourceService.upsert(resource);
		return new ResponseEntity<>(status,HttpStatus.CREATED);
	}

	@GetMapping("/resources")
	public ModelAndView getAllCategories(ModelAndView mv){
		mv=new ModelAndView("AllResource");
		List<Resource> allResource = resourceService.getAll();
		mv.addObject("resources", allResource);
		return mv;	
	}
	@RequestMapping("/resource/{rid}")
	public ResponseEntity<String> deleteResource(@ModelAttribute("resources") @PathVariable Integer rid){
		String status= resourceService.deleteById(rid);
		return new ResponseEntity<>(status,HttpStatus.OK);	
	}
 
	@GetMapping("/updateResource")
	public ModelAndView updateResourcePage() {
	    ModelAndView mv = new ModelAndView("UpdateResource");
	    mv.addObject("resource", new Resource());
	    return mv;
	}
	@RequestMapping("/updateResource")
	public ResponseEntity<String> updateResourcePage(@ModelAttribute("resource") @RequestBody Resource resource ) {
		String status= resourceService.upsert(resource);
		return new ResponseEntity<>(status,HttpStatus.CREATED);
	}



	}



