package com.liempt.sbinventory.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.liempt.sbinventory.entity.Product;
import com.liempt.sbinventory.repository.ProductRepository;
import com.liempt.sbinventory.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Override
	public Product createProduct(Product Product) {
		return productRepository.save(Product);
	}

	@Override
	public Product getProduct(Integer id) {
		return productRepository.getOne(id);
	}

	@Override
	public Product editProduct(Product Product) {
		return productRepository.save(Product);
	}

	@Override
	public void deleteProduct(Product Product) {
		productRepository.delete(Product);
	}

	@Override
	public void deleteProduct(Integer id) {
		productRepository.deleteById(id);
	}

	@Override
	public List<Product> getAllProducts() {
		return productRepository.findAll(Sort.by(Direction.ASC, "pid"));
	}

	@Override
	public long countProducts() {
		return productRepository.count();
	}

}
