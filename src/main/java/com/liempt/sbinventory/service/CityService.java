package com.liempt.sbinventory.service;

import java.util.List;

import com.liempt.sbinventory.entity.City;

public interface CityService {

	City createCity(City city);

	City getCity(Integer id);

	City editCity(City city);

	void deleteCity(City city);

	void deleteCity(Integer id);

	List<City> getAllCities();

	long countCities();

}
