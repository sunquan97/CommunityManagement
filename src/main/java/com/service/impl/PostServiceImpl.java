package com.service.impl;

import java.util.List;

import com.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PostMapper;
import com.pojo.PageUtil;
import com.pojo.Post;
@Service
public class PostServiceImpl implements PostService {
	@Autowired
	private PostMapper mapper;
	
	
	@Override
	public int deleteByPrimaryKey(Integer postid) {
		// TODO Auto-generated method stub
		return mapper.deleteByPrimaryKey(postid);
	}

	@Override
	public int insert(Post record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Post record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

	@Override
	public Post selectByPrimaryKey(Integer postid) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(postid);
	}

	@Override
	public int updateByPrimaryKeySelective(Post post) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(post);
	}

	@Override
	public int updateByPrimaryKey(Post record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Post> getPosts(PageUtil page) {
		// TODO Auto-generated method stub
		return mapper.getPosts(page);
	}

	@Override
	public int countByPosts() {
		// TODO Auto-generated method stub
		return mapper.countByPosts();
	}

	@Override
	public int insertCount(int count,int postid) {
		// TODO Auto-generated method stub
		return mapper.insertCount(count,postid);
	}

	@Override
	public List<Post> getBestPostByPost() {
		// TODO Auto-generated method stub
		return mapper.getBestPostByPost();
	}

	@Override
	public int accept(Integer postid) {
		// TODO Auto-generated method stub
		return mapper.accept(postid);
	}

	@Override
	public int countBySearchPost(String title) {
		// TODO Auto-generated method stub
		return mapper.countBySearchPost(title);
	}

	@Override
	public List<Post> searchPost(PageUtil page, String title) {
		// TODO Auto-generated method stub
		return mapper.searchPost(page, title);
	}


}
