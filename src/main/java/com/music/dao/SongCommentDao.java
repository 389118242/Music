package com.music.dao;

import java.util.List;

import com.music.entity.Comment;

public interface SongCommentDao {

	int insert(Integer songId, Integer comId);

	int delete(Integer comId);

	// List<Comment> selectWonderful(Integer songId);

	List<Comment> select(Integer songId, int begin, int count);

	int selectCount(Integer songId);
}