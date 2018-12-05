package com.liempt.sbinventory.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liempt.sbinventory.dao.OrderDao;
import com.liempt.sbinventory.service.CustomerService;
import com.liempt.sbinventory.service.OrdersService;
import com.liempt.sbinventory.service.ProductService;

@Controller
public class PageController {

	@Autowired
	private OrdersService ordersService;

	@Autowired
	private ProductService productService;

	@Autowired
	private CustomerService customerService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest request) {
		HttpSession session = request.getSession();

		if (session.getAttribute("user_id") != null) {
			return "home";
		}
		return "index";
	}

	@RequestMapping("/home")
	public String homePage() {
		return "home";
	}

	@RequestMapping("/order_details")
	public String orderDetailsPage() {
		return "order_details";
	}

	@RequestMapping("/order_detail")
	public String orderDetailPage() {
		return "order_detail";
	}

	/**
	 * Get data for Add order page
	 * 
	 * @param modelMap
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/order_add", method = RequestMethod.GET)
	public String orderAddPage(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("orderNo", ordersService.getMaxId());

		modelMap.addAttribute("products", productService.getAllProducts());

		modelMap.addAttribute("customers", customerService.getAllCustomers());

		modelMap.addAttribute("em", request.getParameter("em"));
		return "order_add";
	}

	@RequestMapping("/403")
	public String pageNotFound() {
		return "403";
	}
}
