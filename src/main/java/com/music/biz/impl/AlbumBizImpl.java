package com.music.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.biz.AlbumBiz;
import com.music.dao.AlbumDao;
import com.music.dao.SongDao;
import com.music.entity.Album;

@Service
public class AlbumBizImpl implements AlbumBiz {

	@Autowired
	private AlbumDao albumDao;
	@Resource
	private SongDao songDao;

	@Override
	public Album getAlbumById(Integer albId) {
		return albumDao.selectByAlbumId(albId);
	}

	@Override
	public List<Album> getAlbum(int page, int count) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Album> getAlbumByKeyword(String key, int page, int count) {
		return albumDao.selectAlbumByKeyword(key, (page - 1) * count, count);
	}

	@Override
	public int getAlbumCountByKeyword(String key) {
		return albumDao.selectRowsumByKeyword(key);
	}

	@Override
	public List<Integer> getSongIdByAlbumId(Integer albumId) {
		return songDao.selectSongIdByAlbumId(albumId);
	}

}
