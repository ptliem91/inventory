package com.liempt.sbinventory.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liempt.sbinventory.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	
//	@Autowired
//	private CityDao cityDao;

	@RequestMapping(value = "/customers", method = RequestMethod.GET)
	public String customerList(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("sm", request.getParameter("sm"));
		modelMap.addAttribute("em", request.getParameter("em"));
		
		modelMap.addAttribute("customers", customerService.getAllCustomers());
		return "customers";
	}

//	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
//	public String saveCustomer(ModelMap modelMap, HttpServletRequest request) {
//		Customer customer = new Customer();
//		customer.setCname(request.getParameter("cname"));
//		customer.setPhone(request.getParameter("phone"));
//		
//		City city = cityDao.findById(Integer.parseInt(request.getParameter("city")));
//		customer.setCity(city);
//
//		customerDao.saveCustomer(customer);
//		modelMap.addAttribute("sm", "Customer Info Saved Successfully");
//
//		return "redirect:/customers";
//	}
//
//	@RequestMapping(value = "/editCustomer/{id}", method = RequestMethod.GET)
//	public String editCustomer(@PathVariable("id") String id, ModelMap modelMap) {
//		Customer customer = customerDao.findById(Integer.parseInt(id));
//		
//		modelMap.addAttribute("customer", customer);
//		modelMap.addAttribute("customers", customerDao.getAllCustomer());
//		return "customers";
//	}
//
//	@RequestMapping(value = "/updateCustomer", method = RequestMethod.POST)
//	public String updateCustomer(ModelMap modelMap, HttpServletRequest request) {
//		Customer customer = customerDao.findById(Integer.parseInt(request.getParameter("cid")));
//		
////		customer.setCid(Integer.parseInt(request.getParameter("cid")));
//		customer.setCname(request.getParameter("cname"));
//		customer.setPhone(request.getParameter("phone"));
//		
//		City city = cityDao.findById(Integer.parseInt(request.getParameter("city")));
//		customer.setCity(city);
//
//		customerDao.updateCustomer(customer);
//		modelMap.addAttribute("sm", "Customer Info Update Successfully");
//
//		return "redirect:/customers";
//	}
//
//	@RequestMapping(value = "/deleteCustomer/{id}", method = RequestMethod.GET)
//	public String deleteCustomer(@PathVariable("id") String id, ModelMap modelMap) {
//		customerDao.deleteCustomer(Integer.parseInt(id));
//		modelMap.addAttribute("sm", "Customer Info Deleted Successfully");
//
//		return "redirect:/customers";
//	}

}
