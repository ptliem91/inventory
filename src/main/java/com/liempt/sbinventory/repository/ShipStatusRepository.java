package com.liempt.sbinventory.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.liempt.sbinventory.entity.ShipStatus;

@Repository
public interface ShipStatusRepository extends JpaRepository<ShipStatus, Integer> {

}
