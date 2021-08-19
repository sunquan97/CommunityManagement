package com.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.OutinforService;
import com.pojo.outinfor;


@Controller
public class OutinforController {
	@Autowired 
	private OutinforService ser;
	@ResponseBody
	@RequestMapping("/addOutinfor.action")
	public String addOutinfor(outinfor outinfor) {
		if(ser.selectByPrimaryKey(outinfor.getId())==null) {
			Date date=new Date();
			outinfor.setPubdatestr(date);
			ser.insertSelective(outinfor);
		}
		String i="";
		return i;
	}
	@RequestMapping(value="/infor.action")
	@ResponseBody
	public outinfor infor (int id,Model model){
		outinfor outinfor=ser.selectByPrimaryKey(id);
		return outinfor;
	}
}
