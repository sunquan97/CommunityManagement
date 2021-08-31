package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.PageUtil;
import com.pojo.Post;

public interface PostMapper {
    int deleteByPrimaryKey(Integer postid);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(Integer postid);

    int updateByPrimaryKeySelective(Post post);

    int updateByPrimaryKey(Post record);
    
    List<Post> getPosts(@Param("page")PageUtil page);
    
    int countByPosts();
    
    int insertCount(@Param("count")int count,@Param("postid")int postid);
    
    int countBySearchPost(@Param("title")String title);
    
    List<Post> searchPost(@Param("page")PageUtil page,@Param("title")String title);
    
    List<Post> getBestPostByPost();
    
    int accept(@Param("postid")Integer postid);

    List<Post> getPostList();
    
}