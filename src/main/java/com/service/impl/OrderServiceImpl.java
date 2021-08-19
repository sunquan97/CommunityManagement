package com.service.impl;

import java.util.List;

import com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OrderMapper;
import com.pojo.Order;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderMapper mapper;
	@Override
	public int deleteByPrimaryKey(Integer orderid) {
		// TODO Auto-generated method stub
		return mapper.deleteByPrimaryKey(orderid);
	}

	@Override
	public int insert(Order record) {
		// TODO Auto-generated method stub
		return mapper.insert(record);
	}

	@Override
	public int insertSelective(Order record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

	@Override
	public Order selectByPrimaryKey(Integer orderid) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(orderid);
	}

	@Override
	public int updateByPrimaryKeySelective(Order record) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Order record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Order> getAllOrder() {
		// TODO Auto-generated method stub
		return mapper.getAllOrder();
	}

	@Override
	public List<Order> getMyOrder(String name) {
		// TODO Auto-generated method stub
		return mapper.getMyOrder(name);
	}

}
