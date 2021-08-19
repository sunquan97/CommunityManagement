package com.service;

import java.util.List;

import com.pojo.ReplyPost;

public interface ReplyPostService {
    int deleteByPrimaryKey(Integer replypostid);

    int insert(ReplyPost record);

    int insertSelective(ReplyPost record);

    ReplyPost selectByPrimaryKey(Integer replypostid);

    int updateByPrimaryKeySelective(ReplyPost record);

    int updateByPrimaryKey(ReplyPost record);
    
    List<ReplyPost> getReplyPostByPostId(int postid);
    
    int getReplyPostCount(int postid);
    //采纳
    int accept(Integer replypostid);
}
