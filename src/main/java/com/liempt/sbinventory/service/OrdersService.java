package com.liempt.sbinventory.service;

import java.util.List;

import com.liempt.sbinventory.dto.OrdersDto;
import com.liempt.sbinventory.entity.Orders;

public interface OrdersService {

	Orders createOrders(Orders orders);

	Orders getOrders(Integer id);

	Orders editOrders(Orders orders);

	void deleteOrders(Orders orders);

	void deleteOrders(Integer id);

	List<Orders> getAllOrders();

	long countOrders();
	
	Integer getMaxId();
	
	List<OrdersDto> getSumByDate();
	
	List<OrdersDto> getSumByMonth();
}
