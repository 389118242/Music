package com.music.biz;

import java.util.List;

import com.music.entity.Message;

public interface MessageBiz {

	/**
	 * ��ȡ�û���Ϣ
	 * 
	 * @param userId
	 *            �û�id
	 * @return ���ذ����û���Ϣ�ļ��ϣ�����Ϣ�򷵻�null
	 */
	List<Message> getUserMessageById(Integer userId);

	/**
	 * �����Ϣ
	 *
	 * @param mess
	 *            ��Ϣ
	 * @return �Ƿ���ӳɹ�
	 */
	boolean addMessage(Message mess);

	/**
	 * ɾ����Ϣ
	 * 
	 * @param messId
	 *            ��Ϣid
	 * @return �Ƿ�ɾ���ɹ�
	 */
	boolean removeMessage(Integer messId);

	List<Message> messages(Integer userId, String messType);

	int updateByMessID(Integer messId);

	int getMessCountOfNoReadByReceiveUserId(Integer ruId);

	int getMessOfNoReadByUserId(Integer userId);

}
