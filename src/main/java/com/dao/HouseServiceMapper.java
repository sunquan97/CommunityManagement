package com.dao;

import com.pojo.HouseService;

public interface HouseServiceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(HouseService record);

    int insertSelective(HouseService record);

    HouseService selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HouseService record);

    int updateByPrimaryKey(HouseService record);
}