package com.music.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.music.entity.SongList;
import com.music.entity.User;

public interface SongListDao {
	int deleteByPrimaryKey(Integer listId);

	int insert(SongList record);

	int insertSelective(SongList record);

	// 传入歌单id返回歌单结果集（不包含歌曲详细信息）
	SongList selectByPrimaryKey(Integer listId);

	int updateByPrimaryKeySelective(SongList record);

	int updateByPrimaryKeyWithBLOBs(SongList record);

	int updateByPrimaryKey(SongList record);

	// 传入歌单id返回歌单结果集（包含歌曲详细信息）
	SongList selectBySongListId(Integer listId);

	// 根据用户id选出相应的歌单集合(包含歌曲的详细信息)
	List<SongList> selectByUserId(Integer userId);

	// 根据用户id选出相应的歌单集合(不包含歌曲的详细信息)
	List<SongList> selectByUserIdWithoutSong(Integer userId);

	// 根据用户id选出其收藏的的歌单集合(不包含歌曲的详细信息)
	List<SongList> selectCollectionByUserIdWithoutSong(Integer userId);

	// 根据歌单id找出其建立者信息
	User selectUser(Integer listId);

	int selectRowsumByKeyword(String key);

	List<SongList> selectBykeyword(String key, int begin, int count);

	int selectAllCount();

	List<SongList> selectAll(RowBounds rb);

	SongList selectWithNameAndId(Integer listId);

	/**
	 * 更新歌单收藏数量
	 * 
	 * @param slId
	 *            歌单id
	 * @param tag
	 *            +1/-1
	 * @return
	 */
	int updateCollectionNum(Integer slId, int tag);

	int updatePlayNum(Integer slId);

}