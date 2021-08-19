package com.service.impl;

import java.util.List;

import com.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ReplyMapper;
import com.pojo.Reply;
@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper mapper;
	
	@Override
	public int deleteByPrimaryKey(Integer replyid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Reply record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Reply record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

	@Override
	public Reply selectByPrimaryKey(Integer replyid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Reply record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Reply record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Reply> getAllReplys() {
		// TODO Auto-generated method stub
		return mapper.getAllReplys();
	}

}
