package com.music.biz;

import java.util.List;
import java.util.Map;

import com.music.entity.ListKind;
import com.music.entity.RecommendSongList;
import com.music.entity.SongList;
import com.music.entity.User;

public interface SongListBiz {
	/**
	 * �����ݿ���ѡ���赥(����������ϸ��Ϣ)
	 * 
	 * @param slId
	 *            �赥id
	 * @return �赥
	 */
	SongList selectSongList(Integer slId);

	/**
	 * �����ݿ���ѡ���赥(������������ϸ��Ϣ)
	 * 
	 * @param slId
	 *            �赥id
	 * @return �赥
	 */
	SongList selectSongListWithoutSong(Integer slId);

	/**
	 * �����û�id�����ݿ���ѡ����Ӧ�ĸ赥����(����������ϸ��Ϣ)
	 * 
	 * @param uId
	 *            �û�id
	 * @return �赥����
	 */
	List<SongList> selectSongListByUserId(Integer uId);

	/**
	 * �����û�id�����ݿ���ѡ����Ӧ�ĸ赥����(������������ϸ��Ϣ)
	 * 
	 * @param uId
	 *            �û�id
	 * @return �赥����
	 */
	List<SongList> selectSongListByUserIdWithoutSong(Integer uId);

	/**
	 * �����û�id�����ݿ������ղصĸ赥����(������������ϸ��Ϣ)
	 * 
	 * @param uId
	 *            �û�id
	 * @return �赥����
	 */
	List<SongList> selectCollectionSongListByUserIdWithoutSong(Integer uId);

	/**
	 * ���ݸ赥id�����ݿ���ѡ����Ӧ�赥�ĸ�������
	 * 
	 * @param slId
	 *            �赥id
	 * 
	 * @return ��������
	 */
	int selectSongSum(Integer slId);

	/**
	 * ���ݸ赥id�����ݿ��в������������Ϣ
	 * 
	 * @param slId
	 *            �赥id
	 * 
	 * @return �û�
	 */
	User selectUserBySongListId(Integer slId);

	/**
	 * �����赥
	 * 
	 * @param songList
	 *            �����赥������Ϣ��SongList����
	 * @return �Ƿ񴴽��ɹ�
	 */
	boolean addSongList(SongList songList);

	/**
	 * ��赥����Ӹ���
	 * 
	 * @param slId
	 *            �赥id
	 * @param songId
	 *            ����id
	 * @return �Ƿ���ӳɹ�
	 */
	boolean addSongToSongList(Integer slId, Integer songId);

	/**
	 * �Ӹ赥���Ƴ�ĳ������
	 * 
	 * @param slId
	 *            �赥
	 * @param songId
	 * @return
	 */
	boolean removeSongFromSongList(Integer slId, Integer songId);

	/**
	 * ɾ���赥
	 * 
	 * @param slId
	 *            �赥id
	 * @return �Ƿ�ɹ�
	 */
	boolean removeSongList(Integer slId);

	/**
	 * �ղظ赥
	 * 
	 * @param userId
	 *            �û�id
	 * @param slId
	 *            �赥id
	 * @return �Ƿ�ɹ�
	 */
	boolean collectionSongList(Integer userId, Integer slId);

	boolean removeCollection(Integer userId, Integer slId);

	boolean isCollectionSongList(Integer userId, Integer slId);

	/**
	 * ���ݹؼ��ֻ�ȡSongList����
	 * 
	 * @param key
	 *            �ؼ���
	 * @param page
	 *            ҳ��
	 * @param count
	 *            ����
	 * @return ����ר����Ϣ��SongList��List���
	 */
	List<SongList> getSongListByKeyword(String key, int page, int count);

	/**
	 * ��ȡ�ؼ����¸赥������
	 * 
	 * @param key
	 *            �ؼ���
	 * @return ����
	 */
	int getSongListCountByKeyword(String key);

	int getSongListCountByKindId(Integer kindId);

	List<Integer> getSongIdOfSongListByListId(Integer listId);

	List<ListKind> getSongListKindByListId(Integer listId);

	List<SongList> getSongListByKindId(Integer kindId, Integer page, Integer count);

	boolean updateSongList(Map<String, Object> param);

	List<RecommendSongList> getRecommendSongList();

}
