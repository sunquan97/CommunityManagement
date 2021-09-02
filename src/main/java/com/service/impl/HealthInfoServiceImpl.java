package com.service.impl;

import com.dao.HealthInfoMapper;
import com.pojo.HealthInfo;
import com.service.HealthInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HealthInfoServiceImpl implements HealthInfoService {
    @Autowired
    private HealthInfoMapper healthInfoMapper;


    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(HealthInfo record) {
        return 0;
    }

    @Override
    public int insertSelective(HealthInfo record) {
        return healthInfoMapper.insertSelective(record);
    }

    @Override
    public HealthInfo selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(HealthInfo record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(HealthInfo record) {
        return 0;
    }
}
