package com.service.impl;

import com.service.VehiclefaresService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.VehicleFaresMapper;
import com.pojo.VehicleFares;

@Service
public class VehicleFaresServiceImpl implements VehiclefaresService {
	@Autowired
	private VehicleFaresMapper mapper;

	@Override
	public int deleteByPrimaryKey(Integer fareid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(VehicleFares record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(VehicleFares record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

	@Override
	public VehicleFares selectByPrimaryKey(Integer fareid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(VehicleFares record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(VehicleFares record) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
