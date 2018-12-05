package com.liempt.sbinventory.service;

import java.util.List;

import com.liempt.sbinventory.entity.Customer;

public interface CustomerService {

	Customer createCustomer(Customer product);

	Customer getCustomer(Integer id);

	Customer editCustomer(Customer product);

	void deleteCustomer(Customer product);

	void deleteCustomer(Integer id);

	List<Customer> getAllCustomers();

	long countCustomers();

}
