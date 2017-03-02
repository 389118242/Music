package com.music.dao;

import java.util.List;

import com.music.entity.Message;

public interface MessageDao {
	int deleteByPrimaryKey(Integer messId);

	int insert(Message record);

	int insertSelective(Message record);

	Message selectByPrimaryKey(Integer messId);

	int updateByPrimaryKeySelective(Message record);

	int updateByPrimaryKeyWithBLOBs(Message record);

	int updateByPrimaryKey(Message record);

	int updateByMessID(Integer record);// ������Ϣ״̬

	List<Message> selectMessagesByType(Integer userId, String messType);// ����message���ͻ�ȡ��Ϣ
	
	int selectCountOfNoReadByReceiveUserId(Integer ruId);
}