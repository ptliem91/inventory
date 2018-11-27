package com.liempt.sbinventory.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.liempt.sbinventory.entity.Roles;
import com.liempt.sbinventory.entity.UserRole;

@Repository
@Transactional
public class RolesDao {

	@Autowired
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	public List<String> getRoleNames(Long userId) {
		String sql = "Select ur.role.roleName from " + UserRole.class.getName() + " ur " //
				+ " where ur.user.userId = :userId ";

		Query query = this.entityManager.createQuery(sql, String.class);
		query.setParameter("userId", userId);

		return query.getResultList();
	}
}
