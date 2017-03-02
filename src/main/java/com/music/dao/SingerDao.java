package com.music.dao;

import java.util.List;

import com.music.entity.Singer;

public interface SingerDao {

	Singer selectSingerMsg(Integer singerId);// 通过singId查找歌手信息

	int deleteByPrimaryKey(Integer singerId);

	int insert(Singer record);

	int insertSelective(Singer record);

	int updateByPrimaryKeySelective(Singer record);

	int updateByPrimaryKeyWithBLOBs(Singer record);

	int updateByPrimaryKey(Singer record);

	int selectRowsumByKeyword(String key);

	List<Singer> selectByKeyword(String key, int begin, int count);

	String selectNameByid(Integer singerId);
}