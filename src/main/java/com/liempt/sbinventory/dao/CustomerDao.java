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
