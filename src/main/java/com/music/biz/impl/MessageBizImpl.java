package com.music.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.music.biz.MessageBiz;
import com.music.dao.MessageDao;
import com.music.entity.Message;

@Service("messageBiz")
public class MessageBizImpl implements MessageBiz {

	@Resource(name = "messageDao")
	private MessageDao messDao;

	@Override
	public List<Message> getUserMessageById(Integer userId) {
		return null;
	}

	@Override
	public boolean addMessage(Message mess) {
		return false;
	}

	@Override
	public boolean removeMessage(Integer messId) {
		return false;
	}

	@Override
	public List<Message> messages(Integer userId, String messType) {
		return messDao.selectMessagesByType(userId, messType);
	}

	@Override
	public int updateByMessID(Integer messId) {
		return messDao.updateByMessID(messId);
	}

	@Override
	public int getMessCountOfNoReadByReceiveUserId(Integer ruId) {
		return messDao.selectCountOfNoReadByReceiveUserId(ruId);
	}

	@Override
	public int getMessOfNoReadByUserId(Integer userId) {
		return messDao.selectCountOfNoReadByReceiveUserId(userId);
	}

}
