package com.music.dao;

public interface CollectionDao {

	int insert(Integer userId, Integer listId);

	int delete(Integer userId, Integer listId);

	int deleteBySongListId(Integer listId);

	int selectById(Integer userId, Integer listId);

}
