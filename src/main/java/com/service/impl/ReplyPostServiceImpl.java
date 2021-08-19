package com.service.impl;

import java.util.List;

import com.service.ReplyPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ReplyPostMapper;
import com.pojo.ReplyPost;

@Service
public class ReplyPostServiceImpl implements ReplyPostService {
	@Autowired
	private ReplyPostMapper mapper;

	@Override
	public int deleteByPrimaryKey(Integer replypostid) {
		// TODO Auto-generated method stub
		return mapper.deleteByPrimaryKey(replypostid);
	}

	@Override
	public int insert(ReplyPost record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(ReplyPost record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

	@Override
	public ReplyPost selectByPrimaryKey(Integer replypostid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(ReplyPost record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(ReplyPost record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReplyPost> getReplyPostByPostId(int postid) {
		// TODO Auto-generated method stub
		return mapper.getReplyPostByPostId(postid);
	}

	@Override
	public int getReplyPostCount(int postid) {
		// TODO Auto-generated method stub
		return mapper.getReplyPostCount(postid);
	}

	@Override
	public int accept(Integer replypostid) {
		// TODO Auto-generated method stub
		return mapper.accept(replypostid);
	}
	
	
}
