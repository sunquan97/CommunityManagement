package com.controller;

import com.common.ResultEntity;
import com.constant.ResultEnum;
import com.pojo.CodeMap;
import com.service.AppointmentService;
import com.service.impl.AppointMentServiceImpl;
import com.service.newLoginService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/appointment", produces = "application/json;charset=UTF-8")
public class AppointmentController {


    @Autowired
    private AppointmentService appointmentService;

    @PostMapping(value = "/getProvinces")
    public String getProvinces(){
        ResultEntity resultEntity = new ResultEntity();
        try {
            resultEntity.setData(appointmentService.getProvinces());
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        }catch (Exception e){
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }


    @PostMapping(value = "/getCitys")
    public String getCitys(@RequestBody String json){
        ResultEntity resultEntity = new ResultEntity();
        try {
            resultEntity.setData(appointmentService.getCitys(json));
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        }catch (Exception e){
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }

    @PostMapping(value = "/getHospital")
    public String getHospital(){
        ResultEntity resultEntity = new ResultEntity();
        try {
            resultEntity.setData(appointmentService.getHospital());
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        }catch (Exception e){
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }

    @PostMapping(value = "/getDepartment")
    public String getDepartment(){
        ResultEntity resultEntity = new ResultEntity();
        try {
            resultEntity.setData(appointmentService.getDepartment());
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        }catch (Exception e){
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }

}
