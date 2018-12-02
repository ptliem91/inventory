package com.liempt.sbinventory.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.liempt.sbinventory.entity.Users;

@Repository
@Transactional
public class UsersDao {

	@Autowired
	private EntityManager entityManager;

	public Users findUserByUserName(String userName) {
		try {
			String sql = "Select e from " + Users.class.getName() + " e " //
					+ " Where e.userName = :userName ";

			Query query = entityManager.createQuery(sql, Users.class);
			query.setParameter("userName", userName);

			return (Users) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	public Users getUser(String userName, String password) {
		String sql = "Select new " + Users.class.getName() //
				+ "(e.userId, e.userName, e.password, e.encrytedPassword) " //
				+ " from " + Users.class.getName() + " e " + " where userName = ? and password = ? ";

		Query query = entityManager.createQuery(sql, Users.class);
		query.setParameter(0, userName);
		query.setParameter(1, password);

		if (query.getSingleResult() != null) {
			return (Users) query.getSingleResult();
		}

		return null;
	}

}
