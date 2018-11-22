package com.liempt.sbinventory.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liempt.sbinventory.dao.CustomerDao;
import com.liempt.sbinventory.dao.OrderDao;
import com.liempt.sbinventory.dao.ProductDao;

@Controller
public class PageController {

	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private CustomerDao customerDao;

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

	@RequestMapping(value = "/order_add", method = RequestMethod.GET)
	public String orderAddPage(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("orderNo", orderDao.getOrderNo());
		modelMap.addAttribute("products", productDao.getAllProduct());
		modelMap.addAttribute("customers", customerDao.getAllCustomer());
		modelMap.addAttribute("em", request.getParameter("em"));
		return "order_add";
	}

	@RequestMapping("/product_server/{id}")
	public String productServerPage(ModelMap modelMap, @PathVariable("id") String id, HttpServletRequest request) {
		// modelMap.addAttribute("val", id);
		request.setAttribute("val", id);
		return "product_server";
	}
}
