package com.music.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.music.entity.Comment;

public interface AlbumCommentDao {

	int insert(@Param("albId") Integer albId, @Param("comId") Integer comId);

	int delete(@Param("comId") Integer comId);

	// List<Comment> selectWonderful(@Param("albId") Integer albId);

	List<Comment> select(@Param("albId") Integer albId, @Param("begin") int begin, @Param("count") int count);

	int selectCount(@Param("albId") Integer albId);

}
