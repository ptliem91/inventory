package com.liempt.sbinventory.service.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liempt.sbinventory.entity.OrderDetails;
import com.liempt.sbinventory.repository.OrderDetailsRepository;
import com.liempt.sbinventory.service.OrderDetailsService;

@Service
public class OrderDetailsServiceImpl implements OrderDetailsService {

	@Autowired
	private OrderDetailsRepository orderDetailsRepository;

	@Autowired
	private EntityManager entityManager;

	@Override
	public OrderDetails createOrderDetails(OrderDetails orderDetails) {
		return orderDetailsRepository.save(orderDetails);
	}

	@Override
	public OrderDetails getOrderDetails(Integer id) {
		return orderDetailsRepository.getOne(id);
	}

	@Override
	public OrderDetails editOrderDetails(OrderDetails orderDetails) {
		return orderDetailsRepository.save(orderDetails);
	}

	@Override
	public void deleteOrderDetails(OrderDetails orderDetails) {
		orderDetailsRepository.delete(orderDetails);
	}

	@Override
	public void deleteOrderDetails(Integer id) {
		orderDetailsRepository.deleteById(id);
	}

	@Override
	public List<OrderDetails> getAllOrderDetails() {
		return orderDetailsRepository.findAll();
	}

	@Override
	public long countOrderDetails() {
		return orderDetailsRepository.count();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderDetails> getAllOrderDetailsByOrderId(int oid) {
		String sql = "Select e from " + OrderDetails.class.getName() + " e " + " where oid = :oid ";

		Query query = entityManager.createQuery(sql, OrderDetails.class);
		query.setParameter("oid", oid);

		return query.getResultList();
	}

}
