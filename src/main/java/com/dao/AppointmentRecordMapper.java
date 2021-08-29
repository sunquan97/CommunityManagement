package com.dao;

import com.pojo.AppointmentRecord;

public interface AppointmentRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AppointmentRecord record);

    int insertSelective(AppointmentRecord record);

    AppointmentRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AppointmentRecord record);

    int updateByPrimaryKey(AppointmentRecord record);
}