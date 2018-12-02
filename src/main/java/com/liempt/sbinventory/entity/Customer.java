package com.liempt.sbinventory.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "customer")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cid", nullable = false)
	private int cid;

	@Column
	private String cname;

	@Column
	private String phone;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "city", nullable = true)
	private City city;

	public Customer() {
	}

	public Customer(int cid, String cname, String phone, int city) {
		this.cid = cid;
		this.cname = cname;
		this.phone = phone;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the city
	 */
	public City getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(City city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Customer{" + "cid=" + cid + ", cname=" + cname + ", phone=" + phone + '}';
	}

}
