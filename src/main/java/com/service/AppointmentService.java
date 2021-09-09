package com.service;

import com.pojo.CodeMap;
import com.pojo.Department;
import com.pojo.Hospital;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;

public interface AppointmentService {
    List<CodeMap> getProvinces ();

    List<CodeMap> getCitys(String json);

    List<Hospital>  getHospital();

    List<Department> getDepartment();

    void addAppointment(String json, HttpServletRequest request) throws ParseException;

    List<CodeMap> getProjects();

    List<CodeMap> getCares();

    List<CodeMap> getAssistant();
}
