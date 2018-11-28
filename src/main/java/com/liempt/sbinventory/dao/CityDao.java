package com.liempt.sbinventory.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.liempt.sbinventory.entity.City;
import com.liempt.sbinventory.entity.OrderDetails;

@Repository
@Transactional
public class CityDao {

	@Autowired
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	public List<City> getAllCity() {
		String sql = "Select new " + City.class.getName() //
				+ "(e.id, e.code, e.name) " //
				+ " from " + City.class.getName() + " e " + " order by e.id desc";

		Query query = entityManager.createQuery(sql, City.class);
		return query.getResultList();
	}

	public City findById(int id) {
		return this.entityManager.find(City.class, id);
	}

	public City findByCode(String code) {
		try {
			String sql = "Select new " + City.class.getName() //
					+ "(e.id, e.code, e.name) " //
					+ " from " + City.class.getName() + " e " + " where code = ? ";

			Query query = entityManager.createQuery(sql, City.class);
			query.setParameter(0, code);

			return (City) query.getSingleResult();
		} catch (NoResultException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	public void saveCity(City city) {
		entityManager.persist(city);
	}

	public void updateCity(City city) {
		entityManager.merge(city);
	}

	public void deleteCity(int id) {
		City cityDel = findById(id);
		if (cityDel != null) {
			entityManager.remove(cityDel);
		}
	}
}
