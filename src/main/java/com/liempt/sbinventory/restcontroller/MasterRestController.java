package com.liempt.sbinventory.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.liempt.sbinventory.entity.City;
import com.liempt.sbinventory.service.CityService;

@RestController
@RequestMapping("/master")
public class MasterRestController {

	@Autowired
	private CityService cityService;

	@RequestMapping(value = "/allCity", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<City> getAllCustomer() {
		return cityService.getAllCities();
	}

	@RequestMapping(value = "/addCity", method = RequestMethod.POST)
	public City saveCity(@RequestBody City city) {
		cityService.createCity(city);
		return city;
	}

	@RequestMapping(value = "/getCityById/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public City getCity(@PathVariable("id") String id) {
		return cityService.getCity(Integer.parseInt(id));
	}

	@RequestMapping(value = "/updateCity", method = RequestMethod.PUT)
	public City updateCity(@RequestBody City city) {
		cityService.editCity(city);
		return city;
	}

	@RequestMapping(value = "/deleteCity/{id}", method = RequestMethod.DELETE)
	public void deleteCity(@PathVariable("id") String id) {
		cityService.deleteCity(Integer.parseInt(id));
	}
}
