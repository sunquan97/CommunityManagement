package com.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.VehicleService;
import com.pojo.Vehicle;

@Controller
public class VehicleController {
	@Autowired
	private VehicleService ser;
	
	@RequestMapping("/searchVehicle.action")
	public String searchVehicle(Model model,String vehiclenumber,String owner,String addtime){
		List<Vehicle> vehicles=ser.searchVehicle(vehiclenumber,owner,addtime);
		model.addAttribute("vehicles",vehicles);
		model.addAttribute("vehiclenumber",vehiclenumber);
		model.addAttribute("owner",owner);
		return "jsp/Vehicle_List";
	}
	@RequestMapping("/getAllVehicles.action")
	public String getAllUsers(Model model){
		List<Vehicle> vehicles=ser.allVehicles();
		int size=vehicles.size();
		model.addAttribute("size",size);
		model.addAttribute("vehicles",vehicles);
		return "jsp/Vehicle_List";
	}
	@RequestMapping("/addVehicle.action")
	public String addVehicle(Model model,Vehicle vehicle){
		Date date = new Date(); 
		vehicle.setCreatetime(date);
		if(vehicle.getVehicleroleid()==0){
			Calendar   calendar   =   new   GregorianCalendar(); 
		    calendar.setTime(date); 
		    calendar.add(calendar.YEAR, 1);
		    Date date1=calendar.getTime();
		    vehicle.setFinite_time(date1);
		}
		ser.insertSelective(vehicle);
		return "forward:getAllVehicles.action";
	}
	
	@RequestMapping("/stopVehicle.action")
	public String stopVehicle(Model model,int vehicleid){
		ser.updateStopFlag(vehicleid);
		return "forward:getAllVehicles.action";
	}
	
	@RequestMapping("/startVehicle.action")
	public String startVehicle(Model model,int vehicleid){
		ser.updateStartFlag(vehicleid);
		return "forward:getAllVehicles.action";
	}
	@RequestMapping("/delVehicle.action")
	public String delVehicle(Model model,int vehicleid){
		ser.deleteByPrimaryKey(vehicleid);
		return "forward:getAllVehicles.action";
	}
	@RequestMapping("/getVehicleById.action")
	@ResponseBody
	public Vehicle getVehicleById(int vehicleid){
		Vehicle vehicle=ser.selectByPrimaryKey(vehicleid);
		return vehicle;
	}
	
	@RequestMapping("/updateVehicle.action")
	public String updateVehicle(Vehicle vehicle){
		ser.updateByPrimaryKeySelective(vehicle);
		return "forward:getAllVehicles.action";
	}
	
	@RequestMapping(value="/vehicle.action",produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String vehicle(String vehiclenumber){
		int result=0;
		//?????????????????????????????????
		Vehicle vehicle=ser.selectByVehicleNumber(vehiclenumber);
		if(vehicle!=null){
			//????????????????????????????????????
			int id1=vehicle.getVehicleid();
			Date date3 = new Date(); 
			Date date4 = vehicle.getFinite_time();
			result=(int) ((date4.getTime()-date3.getTime())/(1000*60*60*24));
			String json="{'car': '????????????','time':"+result+"}";
			return json;
		}else{
			//??????????????????????????????????????????
			Vehicle Vehicle1=new Vehicle();
			Vehicle1=ser.isTempvalidity(vehiclenumber);
			if(Vehicle1!=null){
				//??????
				Date date = new Date(); 
				Vehicle1.setFinite_time(date);
				ser.updateByPrimaryKeySelective(Vehicle1);
				int id2=Vehicle1.getVehicleid();
				Vehicle Vehicle2=ser.selectByPrimaryKey(id2);
				Date date1=Vehicle2.getCreatetime();
				Date date2=Vehicle2.getFinite_time();
				result=(int) ((date2.getTime()-date1.getTime())/(1000*60));
				String json="{'car': '????????????','time':"+result+"}";
				return json;
			}else{
				//??????
				Vehicle tempVehicle=new Vehicle();
				tempVehicle.setVehiclenumber(vehiclenumber); 
				Date date = new Date(); 
				tempVehicle.setCreatetime(date);
				tempVehicle.setOwner("????????????");
				tempVehicle.setVehicleroleid(1);
				ser.insertSelective(tempVehicle);
				String json="{'car': '????????????','time':0}";
				return json;
			}
		}
	}
	
	
	
	@RequestMapping(value="/checkVehicleNumber.action",produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String checkVehicleNumber(String vehiclenumber){
		String result="";
		Vehicle vehicle=ser.checkVehicleNumber(vehiclenumber);
		if(vehicle==null){
			result="???";
			return result;
		}else{
			result="?????????";
			return result;
		}
	}
	
}
