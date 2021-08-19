package com.service.impl;

import java.util.List;

import com.service.LoginRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.LoginRecordMapper;
import com.pojo.LoginRecord;
@Service
public class LoginRecordServiceImpl implements LoginRecordService {
	@Autowired
	private LoginRecordMapper mapper;
	
	@Override
	public int deleteByPrimaryKey(Integer recordid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(LoginRecord record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(LoginRecord record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

	@Override
	public LoginRecord selectByPrimaryKey(Integer recordid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(LoginRecord record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(LoginRecord record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<LoginRecord> getInformationByUserName(String username) {
		// TODO Auto-generated method stub
		return mapper.getInformationByUserName(username);
	}


}
