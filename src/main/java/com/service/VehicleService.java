package com.service;

import java.util.Date;
import java.util.List;

import com.pojo.Vehicle;

public interface VehicleService {
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
    
    Date validityPeriod(int vehicleid);
    //是否是临时用户
    Vehicle isTempvalidity(String vehiclenumber);
    
    //临时用户停车时长
    Date tempvalidityPeriod(int vehicleid);
    
    List<Vehicle> searchVehicle(String vehiclenumber,String owner,String addtime);
    
    Vehicle checkVehicleNumber(String vehiclenumber);
}
