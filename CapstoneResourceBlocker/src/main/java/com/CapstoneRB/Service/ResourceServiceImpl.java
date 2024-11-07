package com.CapstoneRB.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CapstoneRB.Model.Resource;
import com.CapstoneRB.Repository.ResourceRepository;


@Service
public class ResourceServiceImpl implements ResourceService{
		
	@Autowired
	private ResourceRepository resourceRepo;

	@Override
	public List<Resource> getAll() {
		return resourceRepo.findAll();
	}
	
	@Override
	public Resource getById(Integer rid) {
		Optional<Resource> findById = resourceRepo.findById(rid);
		if(findById.isPresent()) {
			return findById.get();
		}
		return null;
	}
	
	@Override
	public String upsert(Resource resource) {
		resourceRepo.save(resource);
		return "Success";
	}
	
	@Override
	public String deleteById(Integer rid) {
		if(resourceRepo.existsById(rid)) {
			resourceRepo.deleteById(rid);
			return "Deleted Successfully";
		}
		else {
				return "No Record Found";
		}
	}


}
