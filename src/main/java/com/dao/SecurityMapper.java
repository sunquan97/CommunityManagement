package com.dao;

import com.pojo.Security;

public interface SecurityMapper {
    int deleteByPrimaryKey(Integer securityid);

    int insert(Security record);

    int insertSelective(Security record);

    Security selectByPrimaryKey(Integer securityid);

    int updateByPrimaryKeySelective(Security record);

    int updateByPrimaryKey(Security record);
}