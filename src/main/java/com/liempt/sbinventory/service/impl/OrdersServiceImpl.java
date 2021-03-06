package com.liempt.sbinventory.service.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.liempt.sbinventory.dto.OrdersDto;
import com.liempt.sbinventory.entity.Orders;
import com.liempt.sbinventory.repository.OrdersRepository;
import com.liempt.sbinventory.service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	private OrdersRepository ordersRepository;

	@Autowired
	private EntityManager entityManager;

	@Override
	public Orders createOrders(Orders orders) {
		return ordersRepository.save(orders);
	}

	@Override
	public Orders getOrders(Integer id) {
		return ordersRepository.getOne(id);
	}

	@Override
	public Orders editOrders(Orders orders) {
		return ordersRepository.save(orders);
	}

	@Override
	public void deleteOrders(Orders orders) {
		ordersRepository.delete(orders);
	}

	@Override
	public void deleteOrders(Integer id) {
		ordersRepository.deleteById(id);
	}

	@Override
	public List<Orders> getAllOrders() {
		return ordersRepository.findAll(Sort.by(Direction.DESC, "oid"));
	}

	@Override
	public long countOrders() {
		return ordersRepository.count();
	}

	@Override
	public Integer getMaxId() {
		String sql = "Select max(e.oid) " //
				+ " from " + Orders.class.getName() + " e ";

		Query query = entityManager.createQuery(sql, Integer.class);

		Integer orderId = null;

		if (query.getSingleResult() == null) {
			orderId = 1;
		} else {
			orderId = ((Integer) query.getSingleResult()) + 1;
		}

		return orderId;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrdersDto> getSumByDate() {
		String sql = " SELECT new " + OrdersDto.class.getName() + //
				" (e.orderDate, sum(e.total)/1000, '' )" + //
				" FROM " + Orders.class.getName() + " e " + //
				" GROUP BY e.orderDate " + //
				" ORDER BY e.orderDate ";

		Query query = entityManager.createQuery(sql, OrdersDto.class);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrdersDto> getSumByMonth() {
		String sql = " SELECT new " + OrdersDto.class.getName() + //
				" (sum(e.total)/1000, to_char(date(e.orderDate),'YYYY-MM') )" + //
				" FROM " + Orders.class.getName() + " e " + //
				" GROUP BY to_char(date(e.orderDate),'YYYY-MM') " + //
				" ORDER BY to_char(date(e.orderDate),'YYYY-MM') ";

		Query query = entityManager.createQuery(sql, OrdersDto.class);
		return query.getResultList();
	}

}
