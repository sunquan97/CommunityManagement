package com.dao;

import java.util.List;

import com.pojo.LoginRecord;

public interface LoginRecordMapper {
    int deleteByPrimaryKey(Integer recordid);

    int insert(LoginRecord record);

    int insertSelective(LoginRecord record);

    LoginRecord selectByPrimaryKey(Integer recordid);

    int updateByPrimaryKeySelective(LoginRecord record);

    int updateByPrimaryKey(LoginRecord record);
    
    List<LoginRecord> getInformationByUserName(String username);
}