package com.liempt.sbinventory.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.liempt.sbinventory.entity.Orders;
import com.liempt.sbinventory.service.OrdersService;

@RestController
@RequestMapping("/orders")
public class OrdersRestController {

	@Autowired
	private OrdersService ordersService;

	@RequestMapping(value = "/order", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<Orders> getAllOrders() {
		return ordersService.getAllOrders();
	}

	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public Orders saveOrder(@RequestBody Orders orders) {
		ordersService.createOrders(orders);
		return orders;
	}
	
	@RequestMapping(value = "/updateOrder", method = RequestMethod.PUT)
	public Orders updateProduct(@RequestBody Orders p) {
		ordersService.editOrders(p);
		return p;
	}


}
