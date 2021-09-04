package com.controller;

import com.common.ResultEntity;
import com.constant.ResultEnum;
import com.pojo.HouseService;
import com.service.HouseKeepService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;
import java.text.SimpleDateFormat;

@RestController
@RequestMapping(value = "/houseService", produces = "application/json;charset=UTF-8")
public class HouseKeepController {

    @Autowired
    private HouseKeepService houseKeepService;

    @PostMapping(value = "/addAppointment")
    public String addImplementer(@RequestBody String json) throws ParseException {
        JSONObject jsonObject = JSONObject.fromObject(json);
        String name = (String) jsonObject.get("name");
        String appointmentTime = (String) jsonObject.get("appointmentTime");
        String address = (String) jsonObject.get("address");
        String type = (String) jsonObject.get("type");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");//注意月份是MM
        HouseService houseService=new HouseService();
        houseService.setAppointmentTime(simpleDateFormat.parse(appointmentTime));
        houseService.setAddress(address);
        houseService.setServiecName(name);
        houseService.setType(type);
        ResultEntity resultEntity = new ResultEntity();
        try {
            houseKeepService.insertSelective(houseService);
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        }catch(Exception e){
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }
}
