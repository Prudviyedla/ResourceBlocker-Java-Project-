package com.CapstoneRB.Service;

import java.util.List;

import com.CapstoneRB.Model.Resource;




public interface ResourceService {
	
	public String upsert(Resource resource);
	
	public Resource getById(Integer rid);
	
	public List<Resource> getAll();
	
	public String deleteById(Integer rid);
	
}
