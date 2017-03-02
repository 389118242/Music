package com.music.dao;

import java.util.List;

import com.music.entity.Comment;

public interface SongListCommentDao {

	int insert(Integer slId, Integer comId);

	int delete(Integer comId);

	int deleteBySongListId(Integer slId);

	// List<Comment> selectWonderful(Integer slId);

	List<Comment> select(Integer slId, int begin, int count);

	int selectCount(Integer slId);

}
