package com.liempt.sbinventory.service;

import java.util.List;

import com.liempt.sbinventory.entity.OrderDetails;

public interface OrderDetailsService {

	OrderDetails createOrderDetails(OrderDetails orderDetails);

	OrderDetails getOrderDetails(Integer id);

	OrderDetails editOrderDetails(OrderDetails orderDetails);

	void deleteOrderDetails(OrderDetails orderDetails);

	void deleteOrderDetails(Integer id);

	List<OrderDetails> getAllOrderDetails();

	long countOrderDetails();
	
	List<OrderDetails> getAllOrderDetailsByOrderId(int oid);

}
