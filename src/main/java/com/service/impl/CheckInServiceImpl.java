package com.service.impl;

import com.service.CheckInService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.checkinMapper;
import com.pojo.checkin;
@Service
public class CheckInServiceImpl implements CheckInService {
	@Autowired
	private checkinMapper mapper;
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(checkin record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(checkin record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

	@Override
	public checkin selectByPrimaryKey(Integer userid) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(userid);
	}

	@Override
	public int updateByPrimaryKeySelective(checkin record) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(checkin record) {
		// TODO Auto-generated method stub
		return 0;
	}



}
