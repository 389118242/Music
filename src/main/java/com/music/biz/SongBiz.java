package com.music.biz;

import java.util.List;

import com.music.entity.Album;
import com.music.entity.Song;

public interface SongBiz {

	/**
	 * ��ȡ������Ϣ
	 * 
	 * @param songId
	 *            ����id
	 * @return ����������Ϣ��ϸ��
	 */
	Song getSongById(Integer songId);

	/**
	 * ��ȡ������Ϣ
	 * 
	 * @param songId
	 *            ����id
	 * @return ������ʡ�������Ϣ��Song����
	 */
	Song getSongWithLyricById(Integer songId);

	/**
	 * ���Ӹ������Ŵ�����ÿ��+1��
	 * 
	 * @param songId
	 *            ����id
	 */
	void addPlayNum(Integer songId);

	/**
	 * ���ݹؼ��ֻ�ȡSong����
	 * 
	 * @param key
	 *            �ؼ���
	 * @param page
	 *            ҳ��
	 * @param count
	 *            ����
	 * @return ����ר����Ϣ��Song��List���
	 */
	List<Song> getSongByKeyword(String key, int page, int count);

	/**
	 * ��ȡ�ؼ����¸���������
	 * 
	 * @param key
	 *            �ؼ���
	 * @return ����
	 */
	int getSongCountByKeyword(String key);

	/**
	 * ��ȡ���а����
	 * 
	 * @return List<Song>
	 */
	List<Song> getPaihangbangList();

	/**
	 * ��ȡ��ҳ��������
	 * 
	 * @return
	 */
	List<Song> getIndexList();

	String getSingerNameById(Integer singerId);

	Album getAlbumnameAndImg(Integer albumId);

	/**
	 * ���ݸ赥idȡ������Ӧ����
	 * 
	 * @param songListId
	 * @return list
	 */
	List<Song> getSongByListId(Integer songListId);
}
