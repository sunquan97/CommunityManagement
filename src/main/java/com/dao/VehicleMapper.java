package com.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Vehicle;

public interface VehicleMapper {
    int deleteByPrimaryKey(Integer vehicleid);

    int insert(Vehicle record);

    int insertSelective(Vehicle record);

    Vehicle selectByPrimaryKey(Integer vehicleid);

    int updateByPrimaryKeySelective(Vehicle record);

    int updateByPrimaryKey(Vehicle record);
    
    List<Vehicle> allVehicles();
    
    //用户逻辑删除
    int updateStopFlag(int vehicleid);
    //用户逻辑添加
    int updateStartFlag(int vehicleid);
    
    Vehicle selectByVehicleNumber(String vehiclenumber);
    //普通用户车辆有效期
    Date validityPeriod(int vehicleid);
    //是否是临时用户
    Vehicle isTempvalidity(String vehiclenumber);
    
    Date tempvalidityPeriod(int vehicleid);
    
    List<Vehicle> searchVehicle(@Param("vehiclenumber")String vehiclenumber,@Param("owner")String owner,@Param("addtime")String addtime);
    
    Vehicle checkVehicleNumber(String vehiclenumber);
}