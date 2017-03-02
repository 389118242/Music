package com.music.biz;

import java.util.List;

import com.music.entity.Comment;

public interface CommentBiz {
	
	/**
	 * ���ר������
	 * 
	 * @param albId
	 *            ר��id
	 * @param com
	 *            ����������Ϣ��Comment����
	 * @return �Ƿ���ӳɹ�
	 */
	boolean addAlbumComment(Integer albId, Comment com);

	/**
	 * ��Ӹ赥����
	 * 
	 * @param slId
	 *            �赥id
	 * @param com
	 *            ����������Ϣ��Comment����
	 * @return �Ƿ���ӳɹ�
	 */
	boolean addSongListComment(Integer slId, Comment com);

	/**
	 * ��Ӹ�������
	 * 
	 * @param songId
	 *            ����id
	 * @param com
	 *            ����������Ϣ��Comment����
	 * @return �Ƿ���ӳɹ�
	 */
	boolean addSongComment(Integer songId, Comment com);

	/**
	 * �Ƴ�ר������
	 * 
	 * @param comId
	 *            ����id
	 * @return �Ƿ��Ƴ��ɹ�
	 */
	boolean removeAlbumComment(Integer comId);

	/**
	 * �Ƴ��赥����
	 * 
	 * @param comId
	 *            ����id
	 * @return �Ƿ��Ƴ��ɹ�
	 */
	boolean removeSongListComment(Integer comId);

	/**
	 * �Ƴ���������
	 * 
	 * @param comId
	 *            ����id
	 * @return �Ƿ��Ƴ��ɹ�
	 */
	boolean removeSongComment(Integer comId);

	/**
	 * ��ȡר������
	 * 
	 * @param albId
	 *            ר��id
	 * @param page
	 *            ҳ��
	 * @param count
	 *            ����
	 * @return ����������Ϣ��Comment�����List����
	 */
	List<Comment> getAlbumComment(Integer albId, int page, int count);

	/**
	 * ��ȡר�����۵�����
	 * 
	 * @param albId
	 *            ר��id
	 * @return ����
	 */
	int getAlbumCommentCount(Integer albId);

	/**
	 * ��ȡ�赥����
	 * 
	 * @param slId
	 *            �赥id
	 * @param page
	 *            ҳ��
	 * @param count
	 *            ����
	 * @return ����������Ϣ��Comment�����List����
	 */
	List<Comment> getSongListComment(Integer slId, int page, int count);

	/**
	 * ��ȡ�赥���۵�����
	 * 
	 * @param songListId
	 *            �赥id
	 * @return ����
	 */
	int getSongListCommentCount(Integer slId);

	/**
	 * ��ȡ��������
	 * 
	 * @param songId
	 *            ����id
	 * @param page
	 *            ҳ��
	 * @param count
	 *            ����
	 * @return ����������Ϣ��Comment�����List����
	 */
	List<Comment> getSongComment(Integer songId, int page, int count);

	/**
	 * ��ȡ�������۵�����
	 * 
	 * @param songId
	 *            ����id
	 * @return ����
	 */
	int getSongCommentCount(Integer songId);

	/**
	 * ��ȡר������
	 * 
	 * @param albId
	 *            ר��id
	 * @return ����������Ϣ��Comment�����List����
	 */
	List<Comment> getAlbumCommentOfWonderful(Integer albId);

	/**
	 * ��ȡ�赥����
	 * 
	 * @param slId
	 *            �赥id
	 * @return ����������Ϣ��Comment�����List����
	 */
	List<Comment> getSongListCommentOfWonderful(Integer slId);

	/**
	 * ��ȡ��������
	 * 
	 * @param songId
	 *            ����id
	 * @return ����������Ϣ��Comment�����List����
	 */
	List<Comment> getSongCommentOfWonderful(Integer songId);

	/**
	 * ���ޣ�+1��
	 * 
	 * @param comId
	 *            ����id
	 * @return �Ƿ�ɹ�
	 */
	boolean addLikeNum(Integer comId);
}
