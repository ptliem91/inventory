package com.liempt.sbinventory.service;

/**
 * @author Liem.pt - 2018/12/05 16:24:59
 *
 */
import java.util.List;

import com.liempt.sbinventory.entity.ShipService;

public interface ShipServiceService {

	ShipService createShipService(ShipService shipService);

	ShipService getShipService(Integer id);

	ShipService editShipService(ShipService shipService);

	void deleteShipService(ShipService shipService);

	void deleteShipService(Integer id);

	List<ShipService> getAllShipServices();

	long countShipServices();

}
