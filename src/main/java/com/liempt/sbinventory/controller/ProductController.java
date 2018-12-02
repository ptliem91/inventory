package com.liempt.sbinventory.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liempt.sbinventory.dao.ProductDao;
import com.liempt.sbinventory.entity.Product;

@Controller
public class ProductController {

	@Autowired
	ProductDao productDao;

//	@RequestMapping(value = "/product", method = RequestMethod.GET)
//	public String getAllProduct(ModelMap modelMap, HttpServletRequest request) {
//		modelMap.addAttribute("products", productDao.getAllProduct());
//		modelMap.addAttribute("sm", request.getParameter("sm"));
//		modelMap.addAttribute("em", request.getParameter("em"));
//		return "product";
//	}

	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public String getAllProducts(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("products", productDao.getAllProducts());
		modelMap.addAttribute("sm", request.getParameter("sm"));
		modelMap.addAttribute("em", request.getParameter("em"));
		return "products";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String saveProduct(ModelMap modelMap, HttpServletRequest request) throws ParseException {
		Product product = new Product();
		product.setPname(request.getParameter("pname"));
		product.setPrice(Double.parseDouble(request.getParameter("price")));
		product.setPriceSale(Double.parseDouble(request.getParameter("priceSale")));
		product.setQty(Integer.parseInt(request.getParameter("qty")));
		
		Date buyDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("buyDate"));
		product.setBuyDate(buyDate);

		productDao.saveProduct(product);
		modelMap.addAttribute("sm", "Product Info Saved Successfully");

		return "redirect:/products";
	}

	@RequestMapping(value = "/editProduct/{id}", method = RequestMethod.GET)
	public String editProduct(@PathVariable("id") String id, ModelMap modelMap) {
		Product product = productDao.findById(Integer.parseInt(id));
		modelMap.addAttribute("product", product);
		modelMap.addAttribute("products", productDao.getAllProducts());
		return "products";
	}

	/**
	 * Update product
	 * 
	 * @param modelMap
	 * @param request
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
	public String updateProduct(ModelMap modelMap, HttpServletRequest request) throws ParseException {
		Product product = productDao.findById(Integer.parseInt(request.getParameter("pid")));
		
//		product.setPid(Integer.parseInt(request.getParameter("pid")));
		product.setPname(request.getParameter("pname"));
		product.setPrice(Double.parseDouble(request.getParameter("price")));
		product.setPriceSale(Double.parseDouble(request.getParameter("priceSale")));
		product.setQty(Integer.parseInt(request.getParameter("qty")));
		
		Date buyDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("buyDate"));
		product.setBuyDate(buyDate);

		productDao.updateProduct(product);
		modelMap.addAttribute("sm", "Product Info Update Successfully");

		return "redirect:/products";
	}

	/**
	 * Delete the product
	 * @param id
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/deleteProduct/{id}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable("id") String id, ModelMap modelMap) {
		productDao.deleteProduct(Integer.parseInt(id));
		modelMap.addAttribute("sm", "Product Info Deleted Successfully");

		return "redirect:/products";
	}

}
