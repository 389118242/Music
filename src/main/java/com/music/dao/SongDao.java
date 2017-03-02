package com.music.dao;

import java.util.List;

import com.music.entity.Song;

public interface SongDao {
	int deleteByPrimaryKey(Integer songId);

	int insert(Song record);

	int insertSelective(Song record);

	Song selectByPrimaryKey(Integer songId);

	int updateByPrimaryKeySelective(Song record);

	int updateByPrimaryKeyWithBLOBs(Song record);

	int updateByPrimaryKey(Song record);

	int updateBySongid(Integer songId);

	List<Song> selectSongBySingerId(Integer singerId);// 通过singerI'd查找点击数量前五十的歌曲

	int selectSongCountByKeyword(String key);

	Song selectWithLyric(Integer songId);

	List<Song> selectSongByKeyword(String key, int begin, int count);

	List<Song> selectPaihangbang();

	List<Song> selectindexlist();

	List<Song> selectSongByListId(Integer songListId);

	List<Integer> selectSongIdByAlbumId(Integer albumId);

}