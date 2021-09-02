package com.controller;

import com.common.ResultEntity;
import com.constant.ResultEnum;
import com.pojo.HealthInfo;
import com.service.HealthInfoService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@RequestMapping(value = "/healthInfo", produces = "application/json;charset=UTF-8")
public class HealthInfoController {

    @Autowired
    private HealthInfoService healthInfoService;


    @PostMapping(value = "/addHealthInfo")
    public String confirm(@RequestBody JSONObject json){
        ResultEntity resultEntity = new ResultEntity();
        try {
            String name = (String) json.get("name");
            String idnumber = (String) json.get("idNumber");
            String phonenumber = (String) json.get("phoneNumber");
            String physicalcondition = (String) json.get("PhysicalCondition");
            String temperature = (String) json.get("temperature");
            String iscontact = (String) json.get("isContact");
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//注意月份是MM
            Date filltime = simpleDateFormat.parse((String) json.get("fillTime"));
            HealthInfo healthInfo=new HealthInfo();
            healthInfo.setName(name);
            healthInfo.setIdnumber(idnumber);
            healthInfo.setPhonenumber(phonenumber);
            healthInfo.setPhysicalcondition(physicalcondition);
            healthInfo.setTemperature(temperature);
            healthInfo.setIscontact(iscontact);
            healthInfo.setFilltime(filltime);
            healthInfoService.insertSelective(healthInfo);
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
