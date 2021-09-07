package com.service.impl;

import com.dao.AppointmentRecordMapper;
import com.dao.CodeMapMapper;
import com.dao.DepartmentMapper;
import com.dao.HospitalMapper;
import com.pojo.*;
import com.service.AppointmentService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class AppointmentServiceImpl implements AppointmentService {


    @Autowired
    private CodeMapMapper codeMapMapper;
    @Autowired
    private HospitalMapper hospitalMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private AppointmentRecordMapper appointmentRecordMapper;


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

    @Override
    public void addAppointment(String json, HttpServletRequest request) throws ParseException {
        JSONObject jsonObject = JSONObject.fromObject(json);
        String province = (String) jsonObject.get("province");
        String city = (String) jsonObject.get("city");
        String hospital = (String) jsonObject.get("hospital");
        String department = (String) jsonObject.get("department");
        String doctor = (String) jsonObject.get("doctor");
        String date = (String) jsonObject.get("date");
        String time = (String) jsonObject.get("time");
        AppointmentRecord appointmentRecord =new AppointmentRecord();
//        appointmentRecord.setProvince("上海市");
        appointmentRecord.setProvince(province);
        appointmentRecord.setCity(city);
        appointmentRecord.setHospital(hospital);
        appointmentRecord.setDepartment(department);
        appointmentRecord.setDoctor(doctor);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");//注意月份是MM
        appointmentRecord.setDatetime(simpleDateFormat.parse(date+" "+time));
        HttpSession session=request.getSession();
        User user = (User) session.getAttribute("user");
        String userid = user.getUserid();
        appointmentRecord.setUserId(userid);
        appointmentRecordMapper.insertSelective(appointmentRecord);
    }

    @Override
    public List<CodeMap> getProjects() {
        return codeMapMapper.getProjects();
    }

    @Override
    public List<CodeMap> getCares() {
        return codeMapMapper.getCares();
    }

}
