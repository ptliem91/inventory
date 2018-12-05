package com.liempt.sbinventory.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.liempt.sbinventory.entity.Orders;

@Repository
@Transactional
public class OrderDao {

//	@Autowired
//	private EntityManager entityManager;
//
//	public String getOrderNo() {
//		String sql = "Select max(e.oid) " //
//				+ " from " + Orders.class.getName() + " e ";
//
//		Query query = entityManager.createQuery(sql, Integer.class);
//
//		String orderId = null;
//
//		if (query.getSingleResult() == null) {
//			orderId = "1";
//		} else {
//			orderId = String.valueOf((Integer) query.getSingleResult() + 1);
//		}
//
//		return orderId;
//	}
//
//	@SuppressWarnings("unchecked")
//	public List<Orders> getAllOrders() {
//		String sql = "Select new " + Orders.class.getName() //
//				+ "(e.oid, e.cid, e.total, e.orderType, e.orderDate) " //
//				+ " from " + Orders.class.getName() + " e " + " order by e.orderDate desc";
//
//		Query query = entityManager.createQuery(sql, Orders.class);
//		return query.getResultList();
//	}
//
//	public void saveOrder(Orders orders) {
//		entityManager.persist(orders);
//	}
}
