package com.service.impl;

import java.math.BigDecimal;
import java.util.List;

import com.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ShopMapper;
import com.pojo.Shop;
@Service
public class ShopServiceImpl implements ShopService {
	@Autowired
	private ShopMapper mapper;
	@Override
	public int deleteByPrimaryKey(Integer shopid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Shop record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Shop record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

	@Override
	public Shop selectByPrimaryKey(Integer shopid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Shop record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Shop record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BigDecimal calculatedAmount(Integer shopid) {
		// TODO Auto-generated method stub
		return mapper.calculatedAmount(shopid);
	}

	@Override
	public List<Shop> selectByOrderid(Integer orderid) {
		// TODO Auto-generated method stub
		return mapper.selectByOrderid(orderid);
	}

}
