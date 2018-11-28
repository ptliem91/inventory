package com.liempt.sbinventory.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.liempt.sbinventory.dao.CityDao;
import com.liempt.sbinventory.entity.City;

@RestController
@RequestMapping("/master")
public class MasterRestController {

	@Autowired
	private CityDao cityDao;

	@RequestMapping(value = "/allCity", method = RequestMethod.GET, headers = "Accept=application/json")
    public List<City> getAllCustomer(){
        return cityDao.getAllCity();
    }

}
