package com.service.impl;

import java.util.Date;
import java.util.List;

import com.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.VehicleMapper;
import com.pojo.Vehicle;

@Service
public class VehicleServiceImpl implements VehicleService {
	@Autowired
	private VehicleMapper mapper;
	@Override
	public int deleteByPrimaryKey(Integer vehicleid) {
		// TODO Auto-generated method stub
		return mapper.deleteByPrimaryKey(vehicleid);
	}

	@Override
	public int insert(Vehicle record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Vehicle record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

	@Override
	public Vehicle selectByPrimaryKey(Integer vehicleid) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(vehicleid);
	}

	@Override
	public int updateByPrimaryKeySelective(Vehicle record) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Vehicle record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Vehicle> allVehicles() {
		// TODO Auto-generated method stub
		return mapper.allVehicles();
	}

	@Override
	public int updateStopFlag(int vehicleid) {
		// TODO Auto-generated method stub
		return mapper.updateStopFlag(vehicleid);
	}

	@Override
	public int updateStartFlag(int vehicleid) {
		// TODO Auto-generated method stub
		return mapper.updateStartFlag(vehicleid);
	}

	@Override
	public Vehicle selectByVehicleNumber(String vehiclenumber) {
		// TODO Auto-generated method stub
		return mapper.selectByVehicleNumber(vehiclenumber);
	}

	@Override
	public Date validityPeriod(int vehicleid) {
		// TODO Auto-generated method stub
		return mapper.validityPeriod(vehicleid);
	}

	@Override
	public Vehicle isTempvalidity(String vehiclenumber) {
		// TODO Auto-generated method stub
		return mapper.isTempvalidity(vehiclenumber);
	}

	@Override
	public Date tempvalidityPeriod(int vehicleid) {
		// TODO Auto-generated method stub
		return mapper.tempvalidityPeriod(vehicleid);
	}

	@Override
	public List<Vehicle> searchVehicle(String vehiclenumber, String owner, String addtime) {
		// TODO Auto-generated method stub
		return mapper.searchVehicle(vehiclenumber, owner, addtime);
	}

	@Override
	public Vehicle checkVehicleNumber(String vehiclenumber) {
		// TODO Auto-generated method stub
		return mapper.checkVehicleNumber(vehiclenumber);
	}

}
