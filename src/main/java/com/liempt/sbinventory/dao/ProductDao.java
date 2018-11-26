package com.liempt.sbinventory.dao;

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

	@Autowired
	private EntityManager entityManager;

//	private DataSource dataSource;

//	private JdbcTemplate jdbcTemplate;

//	public DataSource getDataSource() {
//		return dataSource;
//	}

	/**
	 * Find by primary key (id)
	 * 
	 * @param id
	 * @return A product
	 */
	public Product findById(int id) {
		return this.entityManager.find(Product.class, id);
	}

	/**
	 * Get all products
	 * 
	 * @return product list
	 */
	@SuppressWarnings("unchecked")
	public List<Product> getAllProducts() {
		String sql = "Select new " + Product.class.getName() //
				+ "(e.pid, e.pname, e.price, e.qty) " //
				+ " from " + Product.class.getName() + " e ";

		Query query = entityManager.createQuery(sql, Product.class);
		return query.getResultList();
	}

//	@Autowired
//	public void setDataSource(DataSource dataSource) {
//		this.dataSource = dataSource;
//		this.jdbcTemplate = new JdbcTemplate(dataSource);
//	}

//	public List<Product> getAllProduct() {
//		String sql = "select * from product";
//		return jdbcTemplate.query(sql, new ProductMapper());
//	}

//	public Product getProduct(int id) {
//		String sql = "select * from product where pid=?";
//		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new ProductMapper());
//	}

//	public static class ProductMapper implements RowMapper<Product> {
//
//		@Override
//		public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
//			Product product = new Product();
//			product.setPid(rs.getInt("pid"));
//			product.setPname(rs.getString("pname"));
//			product.setPrice(rs.getDouble("price"));
//			product.setQty(rs.getInt("qty"));
//			return product;
//		}
//
//	}

	/**
	 * Create new a Product
	 * 
	 * @param product
	 */
	public void saveProduct(Product product) {
		entityManager.persist(product);
	}

	/**
	 * Update the Product
	 * 
	 * @param product
	 */
	public void updateProduct(Product product) {
		entityManager.merge(product);
	}

	/**
	 * Delete the product
	 * 
	 * @param id
	 */
	public void deleteProduct(int id) {
		Product productRemove = findById(id);
		if (productRemove != null) {
			entityManager.remove(productRemove);
		}
	}

}
