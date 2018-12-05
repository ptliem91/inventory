package com.liempt.sbinventory.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.liempt.sbinventory.entity.OrderDetails;
import com.liempt.sbinventory.service.OrderDetailsService;

@RestController
@RequestMapping("/orderdetails")
public class OrderDetailsRestController {

	@Autowired
	private OrderDetailsService orderDetailsService;

	@RequestMapping(value = "/getAllOrderDetails", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<OrderDetails> getAllOrderDetails() {
		return orderDetailsService.getAllOrderDetails();
	}

	@RequestMapping(value = "/getOdDetailsByOID/{oid}", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<OrderDetails> getOdDetailsByOID(@PathVariable("oid") String oid) {
		return orderDetailsService.getAllOrderDetailsByOrderId(Integer.parseInt(oid));
	}

	@RequestMapping(value = "/orderdetail", method = RequestMethod.POST)
	public OrderDetails saveOrderDetails(@RequestBody OrderDetails orderDetails) {
		orderDetailsService.createOrderDetails(orderDetails);
		return orderDetails;
	}

}
