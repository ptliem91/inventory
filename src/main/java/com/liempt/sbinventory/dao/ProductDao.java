package com.liempt.sbinventory.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.liempt.sbinventory.entity.Product;

@Repository
@Transactional
public class ProductDao {

//	@Autowired
//	private EntityManager entityManager;
//
//	/**
//	 * Find by primary key (id)
//	 * 
//	 * @param id
//	 * @return A product
//	 */
//	public Product findById(int id) {
//		return this.entityManager.find(Product.class, id);
//	}
//
//	/**
//	 * Get all products
//	 * 
//	 * @return product list
//	 */
//	@SuppressWarnings("unchecked")
//	public List<Product> getAllProducts() {
//		String sql = "Select new " + Product.class.getName() //
//				+ "(e.pid, e.pname, e.price, e.priceSale, e.qty, e.buyDate) " //
//				+ " from " + Product.class.getName() + " e ";
//
//		Query query = entityManager.createQuery(sql, Product.class);
//		return query.getResultList();
//	}
//
//	/**
//	 * Create new a Product
//	 * 
//	 * @param product
//	 */
//	public void saveProduct(Product product) {
//		product.setCreateDate(new Date());
//		product.setUpdateDate(new Date());
//		
//		entityManager.persist(product);
//	}
//
//	/**
//	 * Update the Product
//	 * 
//	 * @param product
//	 */
//	public void updateProduct(Product product) {
//		product.setUpdateDate(new Date());
//		
//		entityManager.merge(product);
//	}
//
//	/**
//	 * Delete the product
//	 * 
//	 * @param id
//	 */
//	public void deleteProduct(int id) {
//		Product productRemove = findById(id);
//		if (productRemove != null) {
//			entityManager.remove(productRemove);
//		}
//	}

}
