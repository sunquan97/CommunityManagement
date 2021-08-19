package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);
    
    int updateStopFlag(int userid);
    
    int updateStartFlag(int userid);
    
    int updateByPrimaryKey(User record);
    //查询全部用户
    List<User> allUsers();
    
    int selectIdByUserName(String username);
    
    User getUserByUserName(String username);
    
    List<User> AllSecuritys();
    
    List<User> searchUser(@Param("search")String search,@Param("addtime")String addtime);
    
    List<User> searchSecurity(@Param("search")String search,@Param("addtime")String addtime);
    
    int getAllUserSum();
    
    int getAllAdminSum();
    
    int getAllSecuritySum();
    
    User selectPassword(Integer userid);
    
}