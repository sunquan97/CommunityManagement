package com.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.PageUtil;
import com.pojo.Post;

public interface PostService {
    int deleteByPrimaryKey(Integer postid);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(Integer postid);

    int updateByPrimaryKeySelective(Post post);

    int updateByPrimaryKey(Post record);
    
    List<Post> getPosts(@Param("page")PageUtil page);
    
    int countByPosts();
    
    int insertCount(int count,int postid);
    
    int countBySearchPost(String title);
    
    List<Post> searchPost(@Param("page")PageUtil page,@Param("title")String title);
    
    List<Post> getBestPostByPost();
    //采纳
    int accept(Integer postid);
    
}
