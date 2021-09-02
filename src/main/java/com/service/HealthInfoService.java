package com.service;

import com.pojo.HealthInfo;

public interface HealthInfoService {
    int deleteByPrimaryKey(Integer id);

    int insert(HealthInfo record);

    int insertSelective(HealthInfo record);

    HealthInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HealthInfo record);

    int updateByPrimaryKey(HealthInfo record);
}
