package com.service.impl;

import java.util.List;

import com.service.OutinforService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.outinforMapper;
import com.pojo.PageUtil;
import com.pojo.outinfor;
@Service
public class OutinforServiceImpl implements OutinforService {
	@Autowired
	private outinforMapper mapper;
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(outinfor record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(outinfor record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

	@Override
	public outinfor selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(outinfor record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(outinfor record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countByOutinfor() {
		// TODO Auto-generated method stub
		return mapper.countByOutinfor();
	}

	@Override
	public List<outinfor> getAllOutinfor(PageUtil page1) {
		// TODO Auto-generated method stub
		return mapper.getAllOutinfor(page1);
	}

}
