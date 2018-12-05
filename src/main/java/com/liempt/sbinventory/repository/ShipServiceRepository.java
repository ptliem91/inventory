package com.liempt.sbinventory.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.liempt.sbinventory.entity.ShipService;

@Repository
public interface ShipServiceRepository extends JpaRepository<ShipService, Integer> {

}
