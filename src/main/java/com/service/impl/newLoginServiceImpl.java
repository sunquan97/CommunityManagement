package com.service.impl;

import com.dao.UserMapper;
import com.service.newLoginService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class newLoginServiceImpl implements newLoginService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public Boolean checkExistUser(String json) {
        JSONObject jsonObject = JSONObject.fromObject(json);
        String userName = (String) jsonObject.get("userName");
        if (userMapper.checkExistUser(userName)==null) {
            return true;
        }else {
            return false;
        }
    }
}
