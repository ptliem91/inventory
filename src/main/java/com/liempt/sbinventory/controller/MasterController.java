package com.liempt.sbinventory.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liempt.sbinventory.dao.CityDao;
import com.liempt.sbinventory.entity.City;

@Controller
public class MasterController {

	@Autowired
	CityDao cityDao;

	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public String getAllProducts(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("cities", cityDao.getAllCity());
		modelMap.addAttribute("sm", request.getParameter("sm"));
		modelMap.addAttribute("em", request.getParameter("em"));

		return "master/address";
	}

	@RequestMapping(value = "/addAddress", method = RequestMethod.POST)
	public String saveAddress(ModelMap modelMap, HttpServletRequest request) {
		City city = new City();
		city.setCode(request.getParameter("code"));
		city.setName(request.getParameter("name"));

		cityDao.saveCity(city);
		modelMap.addAttribute("sm", "City Info Saved Successfully");

		return "redirect:/address";
	}

	@RequestMapping(value = "/editAddress/{id}", method = RequestMethod.GET)
	public String editAddress(@PathVariable("id") String id, ModelMap modelMap) {
		City city = cityDao.findById(Integer.parseInt(id));

		modelMap.addAttribute("city", city);
		modelMap.addAttribute("cities", cityDao.getAllCity());
		return "master/address";
	}

	@RequestMapping(value = "/updateAddress", method = RequestMethod.POST)
	public String updateAddress(ModelMap modelMap, HttpServletRequest request) {
		City city = new City();
		city.setId(Integer.parseInt(request.getParameter("id")));
		city.setCode(request.getParameter("code"));
		city.setName(request.getParameter("name"));
		
		
		if(cityDao.findByCode(city.getCode()) != null) {
			modelMap.addAttribute("em", "City has already existed!");
			
			modelMap.addAttribute("city", city);
			modelMap.addAttribute("cities", cityDao.getAllCity());
			return "master/address";
		}

		cityDao.updateCity(city);
		modelMap.addAttribute("sm", "City Info Update Successfully");

		return "redirect:/address";
	}

	@RequestMapping(value = "/deleteAddress/{id}", method = RequestMethod.GET)
	public String deleteAddress(@PathVariable("id") String id, ModelMap modelMap) {
		cityDao.deleteCity(Integer.parseInt(id));

		modelMap.addAttribute("sm", "City Info Deleted Successfully");

		return "redirect:/address";
	}
}
