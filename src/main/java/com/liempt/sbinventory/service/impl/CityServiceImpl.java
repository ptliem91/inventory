package com.liempt.sbinventory.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.liempt.sbinventory.entity.City;
import com.liempt.sbinventory.repository.CityRepository;
import com.liempt.sbinventory.service.CityService;

@Service
public class CityServiceImpl implements CityService {

	@Autowired
	private CityRepository cityRepository;

	@Override
	public City createCity(City city) {
		return cityRepository.save(city);
	}

	@Override
	public City getCity(Integer id) {
		return cityRepository.getOne(id);
	}

	@Override
	public City editCity(City city) {
		return cityRepository.save(city);
	}

	@Override
	public void deleteCity(City city) {
		cityRepository.delete(city);
	}

	@Override
	public void deleteCity(Integer id) {
		cityRepository.deleteById(id);
	}

	@Override
	public List<City> getAllCities() {
		return cityRepository.findAll(Sort.by(Direction.ASC, "id"));
	}

	@Override
	public long countCities() {
		return cityRepository.count();
	}

}
