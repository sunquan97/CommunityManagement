package com.dao;

import com.pojo.checkin;

public interface checkinMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(checkin record);

    int insertSelective(checkin record);

    checkin selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(checkin record);

    int updateByPrimaryKey(checkin record);
    
}