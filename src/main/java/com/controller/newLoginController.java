package com.controller;

import com.common.ResultEntity;
import com.constant.ResultEnum;
import com.service.newLoginService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/newLogin", produces = "application/json;charset=UTF-8")
public class newLoginController {

    @Autowired
    private newLoginService newLoginService;

    @PostMapping(value = "/checkExistUser")
    public String addImplementer(@RequestBody String json){
        ResultEntity resultEntity = new ResultEntity();
        if (newLoginService.checkExistUser(json)){
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        }else {
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }
}
