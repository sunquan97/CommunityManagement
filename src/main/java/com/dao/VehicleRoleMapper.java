package com.dao;

import com.pojo.VehicleRole;

public interface VehicleRoleMapper {
    int deleteByPrimaryKey(Integer vehicleroleid);

    int insert(VehicleRole record);

    int insertSelective(VehicleRole record);

    VehicleRole selectByPrimaryKey(Integer vehicleroleid);

    int updateByPrimaryKeySelective(VehicleRole record);

    int updateByPrimaryKey(VehicleRole record);
}