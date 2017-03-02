package com.music.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.music.entity.SongList;
import com.music.entity.User;

public interface SongListDao {
	int deleteByPrimaryKey(Integer listId);

	int insert(SongList record);

	int insertSelective(SongList record);

	// ����赥id���ظ赥�������������������ϸ��Ϣ��
	SongList selectByPrimaryKey(Integer listId);

	int updateByPrimaryKeySelective(SongList record);

	int updateByPrimaryKeyWithBLOBs(SongList record);

	int updateByPrimaryKey(SongList record);

	// ����赥id���ظ赥�����������������ϸ��Ϣ��
	SongList selectBySongListId(Integer listId);

	// �����û�idѡ����Ӧ�ĸ赥����(������������ϸ��Ϣ)
	List<SongList> selectByUserId(Integer userId);

	// �����û�idѡ����Ӧ�ĸ赥����(��������������ϸ��Ϣ)
	List<SongList> selectByUserIdWithoutSong(Integer userId);

	// �����û�idѡ�����ղصĵĸ赥����(��������������ϸ��Ϣ)
	List<SongList> selectCollectionByUserIdWithoutSong(Integer userId);

	// ���ݸ赥id�ҳ��佨������Ϣ
	User selectUser(Integer listId);

	int selectRowsumByKeyword(String key);

	List<SongList> selectBykeyword(String key, int begin, int count);

	int selectAllCount();

	List<SongList> selectAll(RowBounds rb);

	SongList selectWithNameAndId(Integer listId);

	/**
	 * ���¸赥�ղ�����
	 * 
	 * @param slId
	 *            �赥id
	 * @param tag
	 *            +1/-1
	 * @return
	 */
	int updateCollectionNum(Integer slId, int tag);

	int updatePlayNum(Integer slId);

}