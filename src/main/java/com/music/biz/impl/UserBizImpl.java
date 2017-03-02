package com.music.biz.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.music.biz.UserBiz;
import com.music.dao.UserDao;
import com.music.entity.User;
import com.music.entity.UserWithBLOBs;

@Service
public class UserBizImpl implements UserBiz {

	@Resource
	private UserDao userDao;

	@Override
	public boolean isExist(String userAccount) {
		return userDao.selectByAccount(userAccount) > 0;
	}

	@Override
	public boolean register(User user) {
		return userDao.insertUser(user) > 0;
	}

	@Override
	public User login(User user) {
		return userDao.selectByAccountAndPassword(user);
	}

	@Override
	public UserWithBLOBs getUser(Integer userId) {
		return userDao.selectByPrimaryKey(userId);
	}

	@Override
	public boolean updateUser(UserWithBLOBs user) {
		return userDao.updateByPrimaryKeySelective(user) > 0;
	}

	@Override
	public String getUserImg(Integer userId) {
		return userDao.selectImgByPrimaryKey(userId);
	}

}
