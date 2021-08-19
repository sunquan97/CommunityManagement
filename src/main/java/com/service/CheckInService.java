package com.service;

import com.pojo.checkin;

public interface CheckInService {
    int deleteByPrimaryKey(Integer id);

    int insert(checkin record);

    int insertSelective(checkin record);

    checkin selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(checkin record);

    int updateByPrimaryKey(checkin record);
    
}
