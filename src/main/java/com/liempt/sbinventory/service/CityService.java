package com.liempt.sbinventory.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.liempt.sbinventory.entity.City;

public interface CityService {

	City createCity(City city);

	City getCity(Long id);

	City editCity(City city);

	void deleteCity(City city);

	void deleteCity(Long id);

	List<City> getAllCities(int pageNumber, int pageSize);

	List<City> getAllCitiesPaging(Pageable pageable);

	List<City> getAllCities();

	long countCities();

}
