package com.service;

import com.pojo.User;

import java.util.List;

public interface UserService {
    int deleteByPrimaryKey(String userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    //查询全部用户
    List<User> allUsers();
    
    User getUserByUserName(String username);
    
    int selectIdByUserName(String username);
    //用户逻辑删除
    int updateStopFlag(String userid);
    //用户逻辑添加
    int updateStartFlag(String userid);
    //全部安保人员
    List<User> AllSecuritys();
    
    List<User> searchUser(String search,String addtime);
    
    List<User> searchSecurity(String search,String addtime);
    
    int getAllUserSum();
    
    int getAllAdminSum();
    
    int getAllSecuritySum();
    //查询密码
    User selectPassword(String userid);
    
}
