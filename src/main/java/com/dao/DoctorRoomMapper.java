package com.dao;

import com.pojo.DoctorRoom;

public interface DoctorRoomMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DoctorRoom record);

    int insertSelective(DoctorRoom record);

    DoctorRoom selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DoctorRoom record);

    int updateByPrimaryKey(DoctorRoom record);

}