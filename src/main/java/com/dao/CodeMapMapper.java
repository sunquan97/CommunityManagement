package com.dao;

import com.pojo.CodeMap;

import java.util.List;

public interface CodeMapMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CodeMap record);

    int insertSelective(CodeMap record);

    CodeMap selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CodeMap record);

    int updateByPrimaryKey(CodeMap record);

    List<CodeMap> getProvinces();

    List<CodeMap> getCitys(Integer id);
}