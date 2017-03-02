package com.music.dao;

import com.music.entity.RecordCompany;

public interface RecordCompanyDao {
    int deleteByPrimaryKey(Integer rcId);

    int insert(RecordCompany record);

    int insertSelective(RecordCompany record);

    RecordCompany selectByPrimaryKey(Integer rcId);

    int updateByPrimaryKeySelective(RecordCompany record);

    int updateByPrimaryKey(RecordCompany record);
}