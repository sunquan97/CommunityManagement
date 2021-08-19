package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.VehiclefaresService;
import com.pojo.VehicleFares;

@Controller
public class VehiclefaresController {
	@Autowired 
	private VehiclefaresService ser;
	
	
	@RequestMapping("/addVehiclefares.action")
	@ResponseBody
	public int addVehiclefares(VehicleFares vehiclefares){
		VehicleFares vehiclefare=new VehicleFares();
		vehiclefare.setVehiclenumber(vehiclefares.getVehiclenumber());
		vehiclefare.setTime(vehiclefares.getTime());
		int amount=0;
		if(vehiclefares.getTime()<30){
			vehiclefare.setAmount(5);
			amount=5;
		}else if(vehiclefares.getTime()>30&&vehiclefares.getTime()<60){
			vehiclefare.setAmount(10);
			amount=10;
		}else if(vehiclefares.getTime()>60){
			vehiclefare.setAmount((vehiclefares.getTime()%60)*10);
			amount=(vehiclefares.getTime()%60)*10;
		}
		ser.insertSelective(vehiclefare);
		return amount;
	}
}
