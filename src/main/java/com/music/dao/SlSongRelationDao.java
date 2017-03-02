package com.music.dao;

import java.util.List;

public interface SlSongRelationDao {

	int selectSongSum(Integer slId);

	// ����������赥
	int insertSongToList(Integer listId, Integer songId);

	List<Integer> selectSongIdBySlId(Integer slId);

	int deleteBySongListId(Integer listId);

	int delete(Integer slId, Integer songId);
}
