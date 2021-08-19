package com.service;

import com.pojo.VehicleFares;

public interface VehiclefaresService {
    int deleteByPrimaryKey(Integer fareid);

    int insert(VehicleFares record);

    int insertSelective(VehicleFares record);

    VehicleFares selectByPrimaryKey(Integer fareid);

    int updateByPrimaryKeySelective(VehicleFares record);

    int updateByPrimaryKey(VehicleFares record);
}
