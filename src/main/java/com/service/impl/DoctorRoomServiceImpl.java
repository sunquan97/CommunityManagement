package com.service.impl;


import com.dao.DoctorRoomMapper;
import com.pojo.DoctorRoom;
import com.pojo.User;
import com.service.DoctorRoomService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@Service
public class DoctorRoomServiceImpl implements DoctorRoomService {

    @Autowired
    private DoctorRoomMapper doctorRoomMapper;

    @Override
    public void addAppointment(String json, HttpServletRequest request) throws ParseException {
        JSONObject jsonObject = JSONObject.fromObject(json);
        String province = (String) jsonObject.get("province");
        String city = (String) jsonObject.get("city");
        String project = (String) jsonObject.get("project");
        String appointmentTime = (String) jsonObject.get("appointmentTime");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");//注意月份是MM
        Date date = simpleDateFormat.parse(appointmentTime);
        String address = (String) jsonObject.get("address");
        DoctorRoom doctorRoom=new DoctorRoom();
        doctorRoom.setProvince(province);
        doctorRoom.setCity(city);
        doctorRoom.setProject(project);
        doctorRoom.setAppointmentTime(date);
        doctorRoom.setAddress(address);
        HttpSession session=request.getSession();
        User user = (User) session.getAttribute("user");
        String userid = user.getUserid();
        doctorRoom.setUserId(userid);
        doctorRoomMapper.insertSelective(doctorRoom);
    }
}
