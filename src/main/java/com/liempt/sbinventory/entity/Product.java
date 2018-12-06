package com.liempt.sbinventory.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "product")
@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class Product implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2686751558769758210L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pid", nullable = false, columnDefinition = "serial")
	private Integer pid;

	@Column
	private String code;

	@Column
	private String pname;

	@Column
	private double price;

	@Column(name = "price_sale")
	private double priceSale;

	@Column
	private int qty;

	@Column(name = "buy_date")
	@Temporal(TemporalType.DATE)
	private Date buyDate;

	@Column
	private Date createDate;

	@Column
	private Date updateDate;

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
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

	/**
	 * @return the buyDate
	 */

	public Date getBuyDate() {
		return buyDate;
	}

	/**
	 * @param buyDate the buyDate to set
	 */
	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	/**
	 * @return the createDate
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate the createDate to set
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return the updateDate
	 */
	public Date getUpdateDate() {
		return updateDate;
	}

	/**
	 * @param updateDate the updateDate to set
	 */
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "Product{" + "pid=" + pid + ", pname=" + pname + ", price=" + price + ", qty=" + qty + '}';
	}

}
