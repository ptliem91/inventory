package com.liempt.sbinventory.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liempt.sbinventory.entity.City;
import com.liempt.sbinventory.service.CityService;

@Controller
public class MasterController {

	@Autowired
	CityService cityService;

	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public String getAllProducts(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("cities", cityService.getAllCities());

		modelMap.addAttribute("sm", request.getParameter("sm"));
		modelMap.addAttribute("em", request.getParameter("em"));

		return "master/address";
	}

	@RequestMapping(value = "/addAddress", method = RequestMethod.POST)
	public String saveAddress(ModelMap modelMap, HttpServletRequest request) {
		City city = new City();
		city.setCode(request.getParameter("code"));
		city.setName(request.getParameter("name"));

		cityService.createCity(city);
		modelMap.addAttribute("sm", "City Info Saved Successfully");

		return "redirect:/address";
	}

	@RequestMapping(value = "/editAddress/{id}", method = RequestMethod.GET)
	public String editAddress(@PathVariable("id") String id, ModelMap modelMap) {
		City city = cityService.getCity(Integer.parseInt(id));

		modelMap.addAttribute("city", city);
		modelMap.addAttribute("cities", cityService.getAllCities());
		return "master/address";
	}

	@RequestMapping(value = "/updateAddress", method = RequestMethod.POST)
	public String updateAddress(ModelMap modelMap, HttpServletRequest request) {
		City city = cityService.getCity(Integer.parseInt(request.getParameter("id")));

		city.setId(Integer.parseInt(request.getParameter("id")));
		city.setCode(request.getParameter("code"));
		city.setName(request.getParameter("name"));

//		if(cityService.findByCode(city.getCode()) != null) {
//			modelMap.addAttribute("em", "City has already existed!");
//			
//			modelMap.addAttribute("city", city);
//			modelMap.addAttribute("cities", cityService.getAllCities());
//			return "master/address";
//		}

		cityService.editCity(city);
		modelMap.addAttribute("sm", "City Info Update Successfully");

		return "redirect:/address";
	}

	@RequestMapping(value = "/deleteAddress/{id}", method = RequestMethod.GET)
	public String deleteAddress(@PathVariable("id") String id, ModelMap modelMap) {
		cityService.deleteCity(Integer.parseInt(id));

		modelMap.addAttribute("sm", "City Info Deleted Successfully");

		return "redirect:/address";
	}
}
