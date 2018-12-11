package com.liempt.sbinventory.dto;

import java.io.Serializable;
import java.util.Date;

import com.liempt.sbinventory.entity.Orders;

/**
 * @author Liem.pt - 2018/12/11 16:09:46
 *
 */
public class OrdersDto extends Orders implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3692254143829914862L;

	private double sumByDate;

	private Date orderDate;

	public OrdersDto(Date orderDate, double sumByDate) {
		this.orderDate = orderDate;
		this.sumByDate = sumByDate;
	}

	/**
	 * @return the sumByDate
	 */
	public double getSumByDate() {
		return sumByDate;
	}

	/**
	 * @param sumByDate the sumByDate to set
	 */
	public void setSumByDate(double sumByDate) {
		this.sumByDate = sumByDate;
	}

	/**
	 * @return the orderDate
	 */
	public Date getOrderDate() {
		return orderDate;
	}

	/**
	 * @param orderDate the orderDate to set
	 */
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

}