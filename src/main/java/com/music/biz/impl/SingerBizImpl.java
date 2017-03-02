package com.music.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.biz.SingerBiz;
import com.music.dao.AlbumDao;
import com.music.dao.SingerDao;
import com.music.dao.SongDao;
import com.music.entity.Album;
import com.music.entity.Singer;
import com.music.entity.Song;

@Service
public class SingerBizImpl implements SingerBiz {
	@Autowired
	SingerDao sid;// ¸èÊÖ
	@Autowired
	AlbumDao ad;// ×¨¼­
	@Autowired
	SongDao sond;

	@Override
	public List<Song> getSongTop50ySingerId(Integer singerId) {
		List<Song> songs = sond.selectSongBySingerId(singerId);
		return songs;
	}

	@Override
	public Singer getSingerById(Integer singerId) {
		Singer singer = sid.selectSingerMsg(singerId);
		return singer;
	}

	@Override
	public int getAlbumRowsum(Integer singerId) {
		int rowsum = ad.selectRowsumBySingerId(singerId);
		return rowsum;
	}

	@Override
	public List<Album> getAlbumBySingerId(Integer singerId, int albumPageNum, int albumPageSize) {
		albumPageNum = albumPageSize * (albumPageNum - 1);
		List<Album> albumList = ad.selectAlbumBySingerId(singerId, albumPageNum, albumPageSize);
		return albumList;
	}

	@Override
	public List<Singer> getSingerByKeyword(String key, int page, int count) {
		return sid.selectByKeyword(key, (page - 1) * count, count);
	}

	@Override
	public int getSingerCountByKeyword(String key) {
		return sid.selectRowsumByKeyword(key);
	}

}
