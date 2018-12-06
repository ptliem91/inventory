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

import com.liempt.sbinventory.entity.ShipStatus;
import com.liempt.sbinventory.repository.ShipStatusRepository;
import com.liempt.sbinventory.service.ShipStatusService;

@Service
public class ShipStatusServiceImpl implements ShipStatusService {

	@Autowired
	private ShipStatusRepository shipStatusRepository;

	@Override
	public ShipStatus createShipStatus(ShipStatus shipStatus) {
		return shipStatusRepository.save(shipStatus);
	}

	@Override
	public ShipStatus getShipStatus(Integer id) {
		return shipStatusRepository.getOne(id);
	}

	@Override
	public ShipStatus editShipStatus(ShipStatus shipStatus) {
		return shipStatusRepository.save(shipStatus);
	}

	@Override
	public void deleteShipStatus(ShipStatus shipStatus) {
		shipStatusRepository.delete(shipStatus);
	}

	@Override
	public void deleteShipStatus(Integer id) {
		shipStatusRepository.deleteById(id);
	}

	@Override
	public List<ShipStatus> getAllShipStatuss() {
		return shipStatusRepository.findAll(Sort.by(Direction.ASC, "id"));
	}

	@Override
	public long countShipStatuss() {
		return shipStatusRepository.count();
	}

}
