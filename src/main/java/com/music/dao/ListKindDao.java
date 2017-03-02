package com.music.dao;

import java.util.List;

import com.music.entity.ListKind;

public interface ListKindDao {
	int deleteByPrimaryKey(Integer kindId);

	int insert(ListKind record);

	int insertSelective(ListKind record);

	ListKind selectByPrimaryKey(Integer kindId);

	List<ListKind> select();

	int updateByPrimaryKeySelective(ListKind record);

	int updateByPrimaryKey(ListKind record);
}