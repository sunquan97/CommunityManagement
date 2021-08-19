package com.dao;

import java.math.BigDecimal;
import java.util.List;

import com.pojo.Shop;

public interface ShopMapper {
    int deleteByPrimaryKey(Integer shopid);

    int insert(Shop record);

    int insertSelective(Shop record);

    Shop selectByPrimaryKey(Integer shopid);

    int updateByPrimaryKeySelective(Shop record);

    int updateByPrimaryKey(Shop record);
    
    BigDecimal calculatedAmount(Integer shopid);
    
    List<Shop> selectByOrderid(Integer orderid);
}