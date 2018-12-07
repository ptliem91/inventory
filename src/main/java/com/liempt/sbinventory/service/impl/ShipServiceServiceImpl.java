package com.liempt.sbinventory.service.impl;

/**
 * @author Liem.pt - 2018/12/05 16:24:59
 *
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.liempt.sbinventory.entity.ShipService;
import com.liempt.sbinventory.repository.ShipServiceRepository;
import com.liempt.sbinventory.service.ShipServiceService;

@Service
public class ShipServiceServiceImpl implements ShipServiceService {

	@Autowired
	private ShipServiceRepository shipServiceRepository;

	@Override
	public ShipService createShipService(ShipService shipService) {
		return shipServiceRepository.save(shipService);
	}

	@Override
	public ShipService getShipService(Integer id) {
		return shipServiceRepository.getOne(id);
	}

	@Override
	public ShipService editShipService(ShipService shipService) {
		return shipServiceRepository.save(shipService);
	}

	@Override
	public void deleteShipService(ShipService shipService) {
		shipServiceRepository.delete(shipService);
	}

	@Override
	public void deleteShipService(Integer id) {
		shipServiceRepository.deleteById(id);
	}

	@Override
	public List<ShipService> getAllShipServices() {
		return shipServiceRepository.findAll(Sort.by(Direction.DESC, "id"));
	}

	@Override
	public long countShipServices() {
		return shipServiceRepository.count();
	}

}
