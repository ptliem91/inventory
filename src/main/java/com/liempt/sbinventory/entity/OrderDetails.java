package com.liempt.sbinventory.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "orderdetails")
@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class OrderDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "odid", nullable = false, columnDefinition = "serial")
	private Integer odid;

	@Column
	private int oid;

	@Column
	private int pid;

	@Column
	private double price;

	@Column(name = "price_sale")
	private double priceSale;

	@Column
	private int qty;

	public Integer getOdid() {
		return odid;
	}

	public void setOdid(Integer odid) {
		this.odid = odid;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	/**
	 * @return the priceSale
	 */
	public double getPriceSale() {
		return priceSale;
	}

	/**
	 * @param priceSale the priceSale to set
	 */
	public void setPriceSale(double priceSale) {
		this.priceSale = priceSale;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
}
