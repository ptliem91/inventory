package com.liempt.sbinventory.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.liempt.sbinventory.entity.Customer;
import com.liempt.sbinventory.repository.CustomerRepository;
import com.liempt.sbinventory.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerRepository customerRepository;

	@Override
	public Customer createCustomer(Customer Customer) {
		return customerRepository.save(Customer);
	}

	@Override
	public Customer getCustomer(Integer id) {
		return customerRepository.getOne(id);
	}

	@Override
	public Customer editCustomer(Customer Customer) {
		return customerRepository.save(Customer);
	}

	@Override
	public void deleteCustomer(Customer Customer) {
		customerRepository.delete(Customer);
	}

	@Override
	public void deleteCustomer(Integer id) {
		customerRepository.deleteById(id);
	}

	@Override
	public List<Customer> getAllCustomers() {
		return customerRepository.findAll(Sort.by(Direction.DESC, "cid"));
	}

	@Override
	public long countCustomers() {
		return customerRepository.count();
	}

}
