package com.music.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.biz.SongBiz;
import com.music.dao.AlbumDao;
import com.music.dao.SingerDao;
import com.music.dao.SongDao;
import com.music.entity.Album;
import com.music.entity.Song;

@Service
public class SongBizImpl implements SongBiz {

	@Autowired
	private SongDao songDao;
	@Autowired
	private AlbumDao albumDao;
	@Autowired
	private SingerDao singerDao;

	@Override
	public Song getSongById(Integer songId) {
		return songDao.selectByPrimaryKey(songId);
	}

	@Override
	public void addPlayNum(Integer songId) {
		songDao.updateBySongid(songId);
	}

	@Override
	public List<Song> getSongByKeyword(String key, int page, int count) {
		return songDao.selectSongByKeyword(key, (page - 1) * count, count);
	}

	@Override
	public int getSongCountByKeyword(String key) {
		return songDao.selectSongCountByKeyword(key);
	}

	@Override
	public Song getSongWithLyricById(Integer songId) {
		return songDao.selectWithLyric(songId);
	}

	@Override
	public List<Song> getPaihangbangList() {
		return songDao.selectPaihangbang();
	}

	@Override
	public List<Song> getIndexList() {
		return songDao.selectindexlist();
	}

	@Override
	public String getSingerNameById(Integer singerId) {
		return singerDao.selectNameByid(singerId);
	}

	@Override
	public Album getAlbumnameAndImg(Integer albumId) {
		return albumDao.selectImgAndNameByid(albumId);
	}

	@Override
	public List<Song> getSongByListId(Integer songListId) {
		return songDao.selectSongByListId(songListId);
	}

}
