package com.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pojo.User;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.FoodService;
import com.service.OrderService;
import com.service.ShopService;
import com.pojo.Food;
import com.pojo.Order;
import com.pojo.Shop;

@Controller
public class OrderController {
	@Autowired
	private OrderService ser;
	@Autowired
	private ShopService ser1;
	@Autowired
	private FoodService ser2;
	
	@ResponseBody
	@RequestMapping(value="/addOrder.action",produces = "text/plain;charset=UTF-8")
	public String addOrder(String  json,String realname ,String phonenumber,String address) {
		JSONObject object = new JSONObject(json);
		JSONArray shop = object.getJSONArray("shop");
		Order order = new Order();
		Date date=new Date();
		int orderid=(int)(1000000000*(Math.random()));
		order.setOrderid(orderid);
		order.setAddress(address);
		order.setName(realname);
		order.setNumber(phonenumber);
		order.setFlag(0);
		order.setCreatetime(date);
		String foodids="";
		for(int i=0;i<shop.length();i++){
            JSONObject object1=shop.getJSONObject(i);
            int id=object1.getInt("id");
            foodids=foodids+id+",";
            String price= (String) object1.get("price");
            int count=object1.getInt("count");
            Shop shop1=new Shop();
            shop1.setFoodid(id);
            shop1.setAmount(new BigDecimal(price));
            shop1.setCount(count);
            shop1.setOrderid(orderid);
            ser1.insertSelective(shop1);
        }
		order.setFoodids(foodids);
		order.setAmount(ser1.calculatedAmount(orderid));
		ser.insertSelective(order);
		String result="下单成功";
		return result;        
	}
	
	@RequestMapping(value="/getAllOrder.action")
	public String getAllOrder(Model model,HttpServletRequest request) {
		List<Order> orders=ser.getAllOrder();
		for(Order order:orders){
			String foodids="";
			String[] aa=order.getFoodids().split(",");
			for(int i=0;i<aa.length;i++){
				Food food=ser2.selectByPrimaryKey(Integer.parseInt(aa[i]));
				foodids=foodids+food.getFoodname()+",";
			}
			order.setFoodids(foodids);
		}
		model.addAttribute("orders",orders);
		return "jsp/Order";
	}
	
	@RequestMapping(value="/getMyOrder.action")
	public String getMyOrder(Model model,HttpServletRequest request,String name) {
		List<Order> orders=ser.getMyOrder(name);
		for(Order order:orders){
			String foodids="";
			String[] aa=order.getFoodids().split(",");
			for(int i=0;i<aa.length;i++){
				Food food=ser2.selectByPrimaryKey(Integer.parseInt(aa[i]));
				foodids=foodids+food.getFoodname()+",";
			}
			order.setFoodids(foodids);
		}
		model.addAttribute("orders",orders);
		return "jsp/myOrder";
	}
	
	@RequestMapping(value="/distribution.action")
	public String distribution(HttpServletRequest request,int orderid) {
		Order order=new Order();
		order.setOrderid(orderid);
		order.setFlag(1);
		ser.updateByPrimaryKeySelective(order);
		return "forward:getAllOrder.action";        
	}
	
	@RequestMapping(value="/del.action")
	public String del(HttpServletRequest request,int orderid) {
		ser.deleteByPrimaryKey(orderid);
		return "forward:getAllOrder.action";        
	}
	
	@RequestMapping(value="/sign.action")
	public String sign(HttpServletRequest request,int orderid) {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		Order order=new Order();
		order.setOrderid(orderid);
		order.setFlag(2);
		ser.updateByPrimaryKeySelective(order);
		return "forward:getMyOrder.action?name="+user.getRealname()+""; 
	}
	
	@RequestMapping(value="/cancel.action")
	public String cancel(HttpServletRequest request,int orderid) {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		Order order=new Order();
		order.setOrderid(orderid);
		order.setFlag(3);
		ser.updateByPrimaryKeySelective(order);
		return "forward:getMyOrder.action?name="+user.getRealname()+"";        
	}
}
