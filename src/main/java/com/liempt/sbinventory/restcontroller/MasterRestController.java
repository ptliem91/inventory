package com.liempt.sbinventory.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.liempt.sbinventory.entity.City;
import com.liempt.sbinventory.entity.ShipService;
import com.liempt.sbinventory.entity.ShipStatus;
import com.liempt.sbinventory.service.CityService;
import com.liempt.sbinventory.service.ShipServiceService;
import com.liempt.sbinventory.service.ShipStatusService;

@RestController
@RequestMapping("/master")
public class MasterRestController {

	@Autowired
	private CityService cityService;

	@Autowired
	private ShipServiceService shipServiceService;

	@Autowired
	private ShipStatusService shipStatusService;

	@RequestMapping(value = "/allCity", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<City> getAllCustomer() {
		return cityService.getAllCities();
	}

	@RequestMapping(value = "/addCity", method = RequestMethod.POST)
	public City saveCity(@RequestBody City city) {
		cityService.createCity(city);
		return city;
	}

	@RequestMapping(value = "/getCityById/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public City getCity(@PathVariable("id") String id) {
		return cityService.getCity(Integer.parseInt(id));
	}

	@RequestMapping(value = "/updateCity", method = RequestMethod.PUT)
	public City updateCity(@RequestBody City city) {
		cityService.editCity(city);
		return city;
	}

	@RequestMapping(value = "/deleteCity/{id}", method = RequestMethod.DELETE)
	public void deleteCity(@PathVariable("id") String id) {
		cityService.deleteCity(Integer.parseInt(id));
	}

	/* ========== SHIP SERVICE ========== */
	@RequestMapping(value = "/allShipService", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<ShipService> getAllShipService() {
		return shipServiceService.getAllShipServices();
	}

	@RequestMapping(value = "/addShipService", method = RequestMethod.POST)
	public ShipService saveShipService(@RequestBody ShipService shipService) {
		shipServiceService.createShipService(shipService);
		return shipService;
	}

	@RequestMapping(value = "/getShipServiceById/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ShipService getShipService(@PathVariable("id") String id) {
		return shipServiceService.getShipService(Integer.parseInt(id));
	}

	@RequestMapping(value = "/updateShipService", method = RequestMethod.PUT)
	public ShipService updateCity(@RequestBody ShipService shipService) {
		shipServiceService.editShipService(shipService);
		return shipService;
	}

	@RequestMapping(value = "/deleteShipService/{id}", method = RequestMethod.DELETE)
	public void deleteShipService(@PathVariable("id") String id) {
		shipServiceService.deleteShipService(Integer.parseInt(id));
	}

	/* ========== SHIP STATUS ========== */
	@RequestMapping(value = "/allShipStatus", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<ShipStatus> getAllShipStatus() {
		return shipStatusService.getAllShipStatuss();
	}

	@RequestMapping(value = "/addShipStatus", method = RequestMethod.POST)
	public ShipStatus saveShipStatus(@RequestBody ShipStatus shipStatus) {
		shipStatusService.createShipStatus(shipStatus);
		return shipStatus;
	}

	@RequestMapping(value = "/getShipStatusById/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ShipStatus getShipStatus(@PathVariable("id") String id) {
		return shipStatusService.getShipStatus(Integer.parseInt(id));
	}

	@RequestMapping(value = "/updateShipStatus", method = RequestMethod.PUT)
	public ShipStatus updateCity(@RequestBody ShipStatus shipStatus) {
		shipStatusService.editShipStatus(shipStatus);
		return shipStatus;
	}

	@RequestMapping(value = "/deleteShipStatus/{id}", method = RequestMethod.DELETE)
	public void deleteShipStatus(@PathVariable("id") String id) {
		shipStatusService.deleteShipStatus(Integer.parseInt(id));
	}
}
