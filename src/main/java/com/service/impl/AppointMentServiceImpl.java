package com.service.impl;

import com.dao.CodeMapMapper;
import com.dao.DepartmentMapper;
import com.dao.HospitalMapper;
import com.pojo.CodeMap;
import com.pojo.Department;
import com.pojo.Hospital;
import com.service.AppointmentService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AppointMentServiceImpl implements AppointmentService {


    @Autowired
    private CodeMapMapper codeMapMapper;
    @Autowired
    private HospitalMapper hospitalMapper;
    @Autowired
    private DepartmentMapper departmentMapper;


    @Override
    public List<CodeMap> getProvinces() {
        return codeMapMapper.getProvinces();
    }

    @Override
    public List<CodeMap> getCitys(String json) {
        JSONObject jsonObject = JSONObject.fromObject(json);
        String id = (String) jsonObject.get("id");
        if(id!=null){
            return codeMapMapper.getCitys(Integer.valueOf(id));
        }else {
            return null;
        }

    }

    @Override
    public List<Hospital> getHospital() {
        return hospitalMapper.getHospital();
    }

    @Override
    public List<Department> getDepartment() {
        return departmentMapper.getDepartment();
    }

}
