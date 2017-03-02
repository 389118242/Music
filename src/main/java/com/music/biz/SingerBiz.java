package com.music.biz;

import java.util.List;

import com.music.entity.Album;
import com.music.entity.Singer;
import com.music.entity.Song;

public interface SingerBiz {

	/**
	 * ��ȡ���ֲ�����ǰ50�ĸ���
	 * 
	 * @param singerId
	 *            ����id
	 * @return ����������Ϣ��Song�����List����
	 */
	List<Song> getSongTop50ySingerId(Integer singerId);

	/**
	 * ��ȡ���ֵ�ר��
	 * 
	 * @param singerId
	 *            ����id
	 * @return ����ר����Ϣ��Album�����List����
	 */
	List<Album> getAlbumBySingerId(Integer singerId, int pageNum, int pageSize);

	/**
	 * ��ȡ������Ϣ
	 * 
	 * @param singerId
	 *            ����id
	 * @return ����������Ϣ��Singer����
	 */
	Singer getSingerById(Integer singerId);

	/**
	 * ��ȡ����ר��������
	 * 
	 * @param singerId
	 * 
	 * @param ������
	 */
	int getAlbumRowsum(Integer singerId);

	/**
	 * ���ݹؼ��ֻ�ȡSinger����
	 * 
	 * @param key
	 *            �ؼ���
	 * @param page
	 *            ҳ��
	 * @param count
	 *            ����
	 * @return ����ר����Ϣ��Singer��List���
	 */
	List<Singer> getSingerByKeyword(String key, int page, int count);

	/**
	 * ��ȡ�ؼ����¸��ֵ�����
	 * 
	 * @param key
	 *            �ؼ���
	 * @return ����
	 */
	int getSingerCountByKeyword(String key);

}
