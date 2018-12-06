package com.liempt.sbinventory.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "ship_status")
@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class ShipStatus implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5884865589364873472L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, columnDefinition = "serial")
	private Integer id;

	@Column
	private String status;

	public ShipStatus() {
	}

	public ShipStatus(Integer id, String status) {
		this.id = id;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

}
