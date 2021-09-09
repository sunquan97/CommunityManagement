package com.service.impl;

import com.dao.AsistantMapper;
import com.pojo.Asistant;
import com.service.AssistantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AssistantServiceImpl implements AssistantService {
    @Autowired
    private AsistantMapper asistantMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(Asistant record) {
        return 0;
    }

    @Override
    public int insertSelective(Asistant record) {
        return asistantMapper.insertSelective(record);
    }

    @Override
    public Asistant selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Asistant record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Asistant record) {
        return 0;
    }
}
