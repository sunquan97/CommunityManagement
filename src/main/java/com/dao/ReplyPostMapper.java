package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.ReplyPost;

public interface ReplyPostMapper {
    int deleteByPrimaryKey(Integer replypostid);

    int insert(ReplyPost record);

    int insertSelective(ReplyPost record);

    ReplyPost selectByPrimaryKey(Integer replypostid);

    int updateByPrimaryKeySelective(ReplyPost record);

    int updateByPrimaryKey(ReplyPost record);
    
    List<ReplyPost> getReplyPostByPostId(int postid);
    
    int getReplyPostCount(int postid);
    
    int accept(@Param("replypostid")Integer replypostid);
}