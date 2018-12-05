package com.liempt.sbinventory.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.liempt.sbinventory.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

}
