package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.PageUtil;
import com.pojo.outinfor;

public interface outinforMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(outinfor record);

    int insertSelective(outinfor record);

    outinfor selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(outinfor record);

    int updateByPrimaryKey(outinfor record);
    
    int countByOutinfor();
    
    List<outinfor> getAllOutinfor(@Param("page1")PageUtil page1);
}