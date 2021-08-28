package com.service;

import com.pojo.CodeMap;
import com.pojo.Department;
import com.pojo.Hospital;

import java.util.List;

public interface AppointmentService {
    List<CodeMap> getProvinces ();

    List<CodeMap> getCitys(String json);

    List<Hospital>  getHospital();

    List<Department> getDepartment();
}
