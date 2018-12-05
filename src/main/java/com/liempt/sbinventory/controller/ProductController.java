package com.liempt.sbinventory.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liempt.sbinventory.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public String getAllProducts(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("products", productService.getAllProducts());
		
		modelMap.addAttribute("sm", request.getParameter("sm"));
		modelMap.addAttribute("em", request.getParameter("em"));
		return "products";
	}

//	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
//	public String saveProduct(ModelMap modelMap, HttpServletRequest request) throws ParseException {
//		Product product = new Product();
//		product.setPname(request.getParameter("pname"));
//		product.setPrice(Double.parseDouble(request.getParameter("price")));
//		product.setPriceSale(Double.parseDouble(request.getParameter("priceSale")));
//		product.setQty(Integer.parseInt(request.getParameter("qty")));
//		
//		Date buyDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("buyDate"));
//		product.setBuyDate(buyDate);
//
//		productService.createProduct(product);
//		modelMap.addAttribute("sm", "Product Info Saved Successfully");
//
//		return "redirect:/products";
//	}
//
//	@RequestMapping(value = "/editProduct/{id}", method = RequestMethod.GET)
//	public String editProduct(@PathVariable("id") String id, ModelMap modelMap) {
//		Product product = productService.getProduct(Integer.parseInt(id));
//		modelMap.addAttribute("product", product);
//		modelMap.addAttribute("products", productService.getAllProducts());
//		return "products";
//	}
//
//	/**
//	 * Update product
//	 * 
//	 * @param modelMap
//	 * @param request
//	 * @return
//	 * @throws ParseException 
//	 */
//	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
//	public String updateProduct(ModelMap modelMap, HttpServletRequest request) throws ParseException {
//		Product product = productService.getProduct(Integer.parseInt(request.getParameter("pid")));
//		
////		product.setPid(Integer.parseInt(request.getParameter("pid")));
//		product.setPname(request.getParameter("pname"));
//		product.setPrice(Double.parseDouble(request.getParameter("price")));
//		product.setPriceSale(Double.parseDouble(request.getParameter("priceSale")));
//		product.setQty(Integer.parseInt(request.getParameter("qty")));
//		
//		Date buyDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("buyDate"));
//		product.setBuyDate(buyDate);
//
//		productService.editProduct(product);
//		modelMap.addAttribute("sm", "Product Info Update Successfully");
//
//		return "redirect:/products";
//	}
//
//	/**
//	 * Delete the product
//	 * @param id
//	 * @param modelMap
//	 * @return
//	 */
//	@RequestMapping(value = "/deleteProduct/{id}", method = RequestMethod.GET)
//	public String deleteProduct(@PathVariable("id") String id, ModelMap modelMap) {
//		productService.deleteProduct(Integer.parseInt(id));
//		modelMap.addAttribute("sm", "Product Info Deleted Successfully");
//
//		return "redirect:/products";
//	}

}
