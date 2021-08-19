package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Food;
import com.pojo.PageUtil;

public interface FoodMapper {
    int deleteByPrimaryKey(Integer foodid);

    int insert(Food record);

    int insertSelective(Food record);

    Food selectByPrimaryKey(Integer foodid);

    int updateByPrimaryKeySelective(Food record);

    int updateByPrimaryKey(Food record);
    
    List<Food> getAllFood(@Param("page")PageUtil page);
    
    int countByFood();
}