package com.liempt.sbinventory.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userid", nullable = false)
	private Long userId;

	@Column(name = "username")
	private String userName;

	@Column
	private String password;

	@Column(name = "Encryted_Password", length = 128, nullable = false)
	private String encrytedPassword;

	public Users() {
	}

	public Users(Long userId, String userName, String password, String encrytedPassword) {
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.encrytedPassword = encrytedPassword;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEncrytedPassword() {
		return encrytedPassword;
	}

	public void setEncrytedPassword(String encrytedPassword) {
		this.encrytedPassword = encrytedPassword;
	}

	@Override
	public String toString() {
		return "Users{" + "userId=" + userId + ", userName=" + userName + ", password=" + password + '}';
	}

}
