package com.service;

import com.pojo.HouseService;

public interface HouseKeepService {
    int deleteByPrimaryKey(Integer id);

    int insert(HouseService record);

    int insertSelective(HouseService record);

    HouseService selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HouseService record);

    int updateByPrimaryKey(HouseService record);
}
