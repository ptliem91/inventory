package com.liempt.sbinventory.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.liempt.sbinventory.dao.CityDao;
import com.liempt.sbinventory.entity.City;

@RestController
@RequestMapping("/master")
public class MasterRestController {

	@Autowired
	private CityDao cityDao;

	@RequestMapping(value = "/allCity", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<City> getAllCustomer() {
		return cityDao.getAllCity();
	}

	@RequestMapping(value = "/addCity", method = RequestMethod.POST)
	public City saveCity(@RequestBody City city) {
		cityDao.saveCity(city);
		return city;
	}

	@RequestMapping(value = "/getCityById/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public City getCity(@PathVariable("id") String id) {
		return cityDao.findById(Integer.parseInt(id));
	}
	
	@RequestMapping(value = "/updateCity", method = RequestMethod.PUT)
	public City updateCity(@RequestBody City city) {
		cityDao.updateCity(city);
		return city;
	}
	
	@RequestMapping(value = "/deleteCity/{id}", method = RequestMethod.DELETE)
	public void deleteCity(@PathVariable("id") String id) {
		cityDao.deleteCity(Integer.parseInt(id));
	}
}
