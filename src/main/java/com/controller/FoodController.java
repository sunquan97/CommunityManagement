package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.FoodService;
import com.pojo.Food;
import com.pojo.PageUtil;

@Controller
public class FoodController {
	@Autowired
	private FoodService ser;
	
	@RequestMapping("/getAllFood.action")
	public String getAllFood(Model model,HttpServletRequest request,Integer currentPage) {
		Integer curPage=1;
		if(currentPage!=null) {
			curPage=currentPage;
		}
		PageUtil page=new PageUtil(10, ser.countByFood(), curPage);
		List<Food> food=ser.getAllFood(page);
		model.addAttribute("food",food);
		model.addAttribute("page",page);
		return "jsp/necessities";
	}
}
