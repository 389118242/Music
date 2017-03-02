package com.music.dao;

import java.util.List;

import com.music.entity.RecommendSongList;

public interface RecommendSongListDao {

	List<RecommendSongList> select();
}
