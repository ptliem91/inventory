package com.liempt.sbinventory.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.liempt.sbinventory.entity.Product;
import com.liempt.sbinventory.service.ProductService;

@RestController
@RequestMapping("/products")
public class ProductRestController {

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/allProduct", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<Product> getAllProduct() {
		List<Product> listProduct = productService.getAllProducts();
		return listProduct;
	}

	@RequestMapping(value = "/getProductById/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public Product getProduct(@PathVariable("id") String id) {
		Product product = productService.getProduct(Integer.parseInt(id));
		return product;
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST, headers = "Accept=application/json")
	public Product saveProduct(@RequestBody Product p) {
		productService.createProduct(p);
		return p;
	}

	@RequestMapping(value = "/updateProduct", method = RequestMethod.PUT)
	public Product updateProduct(@RequestBody Product p) {
		productService.editProduct(p);
		return p;
	}

	@RequestMapping(value = "/deleteProduct/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
	public Product deleteProduct(@PathVariable("id") String id) {
		productService.deleteProduct(Integer.parseInt(id));
		Product p = new Product();
		return p;
	}

}
