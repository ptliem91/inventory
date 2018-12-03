package com.liempt.sbinventory.repository;

import org.springframework.stereotype.Repository;

import com.liempt.sbinventory.entity.City;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface CityRepository extends JpaRepository<City, Long> {

}
