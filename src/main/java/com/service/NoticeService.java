package com.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Notice;
import com.pojo.PageUtil;

public interface NoticeService {
    int deleteByPrimaryKey(Integer noticeid);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(Integer noticeid);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKey(Notice record);
    
    List<Notice> getAllNotices(@Param("page")PageUtil page);
    
    int countByNotices();
    
    int getAllNoticeSum();
}
