package com.liempt.sbinventory.service;

import java.util.List;

import com.liempt.sbinventory.entity.Product;

public interface ProductService {

	Product createProduct(Product product);

	Product getProduct(Integer id);

	Product editProduct(Product product);

	void deleteProduct(Product product);

	void deleteProduct(Integer id);

	List<Product> getAllProducts();

	long countProducts();

}
