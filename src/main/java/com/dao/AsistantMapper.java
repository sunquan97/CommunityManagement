package com.dao;

import com.pojo.Asistant;

public interface AsistantMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Asistant record);

    int insertSelective(Asistant record);

    Asistant selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Asistant record);

    int updateByPrimaryKey(Asistant record);
}