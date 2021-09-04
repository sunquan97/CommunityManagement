package com.service.impl;

import com.dao.HouseServiceMapper;
import com.pojo.HouseService;
import com.service.HouseKeepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HouseKeepServiceImpl implements HouseKeepService {
    @Autowired
    private HouseServiceMapper houseServiceMapper;


    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(HouseService record) {
        return 0;
    }

    @Override
    public int insertSelective(HouseService record) {
        return houseServiceMapper.insertSelective(record);
    }

    @Override
    public HouseService selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(HouseService record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(HouseService record) {
        return 0;
    }
}
