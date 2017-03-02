package com.music.biz;

import com.music.entity.User;
import com.music.entity.UserWithBLOBs;

public interface UserBiz {

	/**
	 * 判断账号是否存在
	 * 
	 * @param userAccount
	 *            账号
	 * @return 存在返回true
	 */
	boolean isExist(String userAccount);

	/**
	 * 注册用户
	 * 
	 * @param user
	 *            包含用户基本信息的User对象
	 * @return 注册成功返回true
	 */
	boolean register(User user);

	/**
	 * 登录
	 * 
	 * @param user
	 *            包含用户账号和密码的User对象
	 * @return 登录成功返回包含用户基本信息的User对象；失败返回null
	 */
	User login(User user);

	/**
	 * 获取用户信息
	 * 
	 * @param userId
	 *            用户Id
	 * @return 返回包含用户详细信息的UserWithBLOBs的对象；无该用户返回null
	 */
	UserWithBLOBs getUser(Integer userId);

	/**
	 * 修改个人信息
	 * 
	 * @param user
	 *            包含用户id和需修改的信息
	 * @return 是否修改成功
	 */
	boolean updateUser(UserWithBLOBs user);

	/**
	 * 获取用户头像
	 * 
	 * @param userId
	 *            用户id
	 * @return 图片的base64编码
	 */
	String getUserImg(Integer userId);

}
