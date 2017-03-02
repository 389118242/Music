package com.music.biz;

import com.music.entity.User;
import com.music.entity.UserWithBLOBs;

public interface UserBiz {

	/**
	 * �ж��˺��Ƿ����
	 * 
	 * @param userAccount
	 *            �˺�
	 * @return ���ڷ���true
	 */
	boolean isExist(String userAccount);

	/**
	 * ע���û�
	 * 
	 * @param user
	 *            �����û�������Ϣ��User����
	 * @return ע��ɹ�����true
	 */
	boolean register(User user);

	/**
	 * ��¼
	 * 
	 * @param user
	 *            �����û��˺ź������User����
	 * @return ��¼�ɹ����ذ����û�������Ϣ��User����ʧ�ܷ���null
	 */
	User login(User user);

	/**
	 * ��ȡ�û���Ϣ
	 * 
	 * @param userId
	 *            �û�Id
	 * @return ���ذ����û���ϸ��Ϣ��UserWithBLOBs�Ķ����޸��û�����null
	 */
	UserWithBLOBs getUser(Integer userId);

	/**
	 * �޸ĸ�����Ϣ
	 * 
	 * @param user
	 *            �����û�id�����޸ĵ���Ϣ
	 * @return �Ƿ��޸ĳɹ�
	 */
	boolean updateUser(UserWithBLOBs user);

	/**
	 * ��ȡ�û�ͷ��
	 * 
	 * @param userId
	 *            �û�id
	 * @return ͼƬ��base64����
	 */
	String getUserImg(Integer userId);

}
