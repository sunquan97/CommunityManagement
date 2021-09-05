package com.service.impl;

import java.util.List;

import com.pojo.User;
import com.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.NoticeMapper;
import com.pojo.Notice;
import com.pojo.PageUtil;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper mapper;
	@Override
	public int deleteByPrimaryKey(Integer noticeid) {
		// TODO Auto-generated method stub
		return mapper.deleteByPrimaryKey( noticeid);
	}

	@Override
	public int insert(Notice record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Notice record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

	@Override
	public Notice selectByPrimaryKey(Integer noticeid) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(noticeid);
	}

	@Override
	public int updateByPrimaryKeySelective(Notice record) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective( record);
	}

	@Override
	public int updateByPrimaryKey(Notice record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Notice> getAllNotices(PageUtil page) {
		// TODO Auto-generated method stub
		return mapper.getAllNotices(page);
	}

	@Override
	public int countByNotices() {
		// TODO Auto-generated method stub
		return mapper.countByNotices();
	}

	@Override
	public int getAllNoticeSum() {
		// TODO Auto-generated method stub
		return mapper.getAllNoticeSum();
	}

	@Override
	public List<User> searchNotices(String search, String addtime) {
		return null;
	}


}
