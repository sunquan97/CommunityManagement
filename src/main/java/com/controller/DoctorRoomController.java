package com.controller;

import com.common.ResultEntity;
import com.constant.ResultEnum;
import com.service.DoctorRoomService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;


@RestController
@RequestMapping(value = "/doctorRoom", produces = "application/json;charset=UTF-8")
public class DoctorRoomController {

    @Autowired
    private DoctorRoomService doctorRoomService;

    @RequestMapping(value = "/confirm")
    public String confirm(@RequestBody String json,HttpServletRequest request){
        ResultEntity resultEntity = new ResultEntity();
        try {
            doctorRoomService.addAppointment(json,request);
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
