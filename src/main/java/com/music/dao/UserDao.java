package com.music.dao;

import com.music.entity.User;
import com.music.entity.UserWithBLOBs;

public interface UserDao {

	int deleteByPrimaryKey(Integer userId);

	int insert(UserWithBLOBs record);

	int insertUser(User record);

	int insertSelective(UserWithBLOBs record);

	UserWithBLOBs selectByPrimaryKey(Integer userId);

	int updateByPrimaryKeySelective(UserWithBLOBs record);

	int updateByPrimaryKeyWithBLOBs(UserWithBLOBs record);

	int updateByPrimaryKey(User record);

	int selectByAccount(String account);

	User selectByAccountAndPassword(User user);

	String selectImgByPrimaryKey(Integer userId);
}