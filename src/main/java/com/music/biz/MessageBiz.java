package com.music.biz;

import java.util.List;

import com.music.entity.Message;

public interface MessageBiz {

	/**
	 * 获取用户消息
	 * 
	 * @param userId
	 *            用户id
	 * @return 返回包含用户消息的集合，无消息则返回null
	 */
	List<Message> getUserMessageById(Integer userId);

	/**
	 * 添加消息
	 *
	 * @param mess
	 *            消息
	 * @return 是否添加成功
	 */
	boolean addMessage(Message mess);

	/**
	 * 删除消息
	 * 
	 * @param messId
	 *            消息id
	 * @return 是否删除成功
	 */
	boolean removeMessage(Integer messId);

	List<Message> messages(Integer userId, String messType);

	int updateByMessID(Integer messId);

	int getMessCountOfNoReadByReceiveUserId(Integer ruId);

	int getMessOfNoReadByUserId(Integer userId);

}
