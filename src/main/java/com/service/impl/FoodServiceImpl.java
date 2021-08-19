package com.service.impl;

import java.util.List;

import com.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.FoodMapper;
import com.pojo.Food;
import com.pojo.PageUtil;
@Service
public class FoodServiceImpl implements FoodService {
	@Autowired
	private FoodMapper mapper;

	@Override
	public int deleteByPrimaryKey(Integer foodid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Food record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Food record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Food selectByPrimaryKey(Integer foodid) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(foodid);
	}

	@Override
	public int updateByPrimaryKeySelective(Food record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Food record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Food> getAllFood(PageUtil page) {
		// TODO Auto-generated method stub
		return mapper.getAllFood(page);
	}

	@Override
	public int countByFood() {
		// TODO Auto-generated method stub
		return mapper.countByFood();
	}

}
