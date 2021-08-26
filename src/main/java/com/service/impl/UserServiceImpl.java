package com.service.impl;

import java.util.List;

import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pojo.User;
import com.dao.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper mapper;
	@Override
	public int deleteByPrimaryKey(String userid) {
		// TODO Auto-generated method stub
		return mapper.deleteByPrimaryKey(userid);
	}

	@Override
	public int insert(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

	@Override
	public User selectByPrimaryKey(String userid) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(userid);
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<User> allUsers() {
		// TODO Auto-generated method stub
		return mapper.allUsers();
	}

	@Override
	public int selectIdByUserName(String username) {
		// TODO Auto-generated method stub
		return mapper.selectIdByUserName(username);
	}

	@Override
	public User getUserByUserName(String username) {
		// TODO Auto-generated method stub
		return mapper.getUserByUserName(username);
	}

	@Override
	public int updateStopFlag(String userid) {
		// TODO Auto-generated method stub
		return mapper.updateStopFlag(userid);
	}

	@Override
	public int updateStartFlag(String userid) {
		// TODO Auto-generated method stub
		return mapper.updateStartFlag(userid);
	}

	@Override
	public List<User> AllSecuritys() {
		// TODO Auto-generated method stub
		return mapper.AllSecuritys();
	}

	@Override
	public List<User> searchUser(String search,String addtime) {
		// TODO Auto-generated method stub
		return mapper.searchUser(search,addtime);
	}

	@Override
	public List<User> searchSecurity(String search, String addtime) {
		// TODO Auto-generated method stub
		return mapper.searchSecurity(search, addtime);
	}

	@Override
	public int getAllUserSum() {
		// TODO Auto-generated method stub
		return mapper.getAllUserSum();
	}

	@Override
	public int getAllAdminSum() {
		// TODO Auto-generated method stub
		return mapper.getAllAdminSum();
	}

	@Override
	public int getAllSecuritySum() {
		// TODO Auto-generated method stub
		return mapper.getAllSecuritySum();
	}

	@Override
	public User selectPassword(String userid) {
		// TODO Auto-generated method stub
		return mapper.selectPassword(userid);
	}

}
