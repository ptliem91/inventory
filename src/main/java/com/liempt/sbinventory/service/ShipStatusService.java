package com.liempt.sbinventory.service;

/**
 * @author Liem.pt - 2018/12/05 16:24:59
 *
 */
import java.util.List;

import com.liempt.sbinventory.entity.ShipStatus;

public interface ShipStatusService {

	ShipStatus createShipStatus(ShipStatus shipStatus);

	ShipStatus getShipStatus(Integer id);

	ShipStatus editShipStatus(ShipStatus shipStatus);

	void deleteShipStatus(ShipStatus shipStatus);

	void deleteShipStatus(Integer id);

	List<ShipStatus> getAllShipStatuss();

	long countShipStatuss();

}
