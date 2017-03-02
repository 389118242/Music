package com.music.biz;

import java.util.List;

import com.music.entity.Album;

public interface AlbumBiz {

	/**
	 * ����ר��id��ȡר��
	 * 
	 * @param albId
	 *            ר��id
	 * @return ����ר����Ϣ��Album�������򷵻�null
	 */
	Album getAlbumById(Integer albId);

	/**
	 * �����ض�ҳ���ÿҳ������ȡAlbum����
	 * 
	 * @param page
	 *            ҳ��
	 * @param count
	 *            ÿҳ��ʾ����
	 * @return ����ר����Ϣ��Album��List����
	 */
	List<Album> getAlbum(int page, int count);

	/**
	 * ���ݹؼ��ֻ�ȡAlbum����
	 * 
	 * @param key
	 *            �ؼ���
	 * @param page
	 *            ҳ��
	 * @param count
	 *            ����
	 * @return ����ר����Ϣ��Album��List���
	 */
	List<Album> getAlbumByKeyword(String key, int page, int count);

	/**
	 * ��ȡ�ؼ�����ר��������
	 * 
	 * @param key
	 *            �ؼ���
	 * @return ����
	 */
	int getAlbumCountByKeyword(String key);

	List<Integer> getSongIdByAlbumId(Integer albumId);

}
