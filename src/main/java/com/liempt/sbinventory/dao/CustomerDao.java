package com.liempt.sbinventory.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.liempt.sbinventory.entity.Customer;

@Repository
@Transactional
public class CustomerDao {

	@Autowired
	private EntityManager entityManager;

//	private DataSource dataSource;
//
//	private JdbcTemplate jdbcTemplate;
//
//	public DataSource getDataSource() {
//		return dataSource;
//	}

//	@Autowired
//	public void setDataSource(DataSource dataSource) {
//		this.dataSource = dataSource;
//		this.jdbcTemplate = new JdbcTemplate(dataSource);
//	}

	/**
	 * Find by primary key (id)
	 * 
	 * @param id
	 * @return A Customer
	 */
	public Customer findById(int id) {
		return this.entityManager.find(Customer.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Customer> getAllCustomer() {
		String sql = "Select new " + Customer.class.getName() //
				+ "(e.cid, e.cname, e.phone) " //
				+ " from " + Customer.class.getName() + " e ";

		Query query = entityManager.createQuery(sql, Customer.class);
		return query.getResultList();
	}

//	public static class CustomerMapper implements RowMapper<Customer> {
//
//		@Override
//		public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
//			Customer customer = new Customer();
//			customer.setCid(rs.getInt("cid"));
//			customer.setCname(rs.getString("cname"));
//			customer.setPhone(rs.getString("phone"));
//			return customer;
//		}
//
//	}

	public void saveCustomer(Customer customer) {
		entityManager.persist(customer);
	}

	public void updateCustomer(Customer customer) {
		entityManager.merge(customer);
	}

	public void deleteCustomer(int id) {
		Customer customerDel = findById(id);
		if (customerDel != null) {
			entityManager.remove(customerDel);
		}
	}

}
