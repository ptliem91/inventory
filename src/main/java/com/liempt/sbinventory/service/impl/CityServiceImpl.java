package com.liempt.sbinventory.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
	public City getCity(Long id) {
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
	public void deleteCity(Long id) {
		cityRepository.deleteById(id);
	}

	@SuppressWarnings("deprecation")
	@Override
	public List<City> getAllCities(int pageNumber, int pageSize) {
		return cityRepository.findAll(new PageRequest(pageNumber, pageSize)).getContent();
	}

	@Override
	public List<City> getAllCities() {
		return cityRepository.findAll();
	}

	@Override
	public long countCities() {
		return cityRepository.count();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<City> getAllCitiesPaging(Pageable pageable) {
		Pageable pageablee = PageRequest.of(0, 10, Sort.by("code").descending());

		return (List<City>) cityRepository.findAll(pageablee);
	}

}
