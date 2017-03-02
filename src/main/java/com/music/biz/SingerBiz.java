package com.music.biz;

import java.util.List;

import com.music.entity.Album;
import com.music.entity.Singer;
import com.music.entity.Song;

public interface SingerBiz {

	/**
	 * 获取歌手播放量前50的歌曲
	 * 
	 * @param singerId
	 *            歌手id
	 * @return 包含歌曲信息的Song对象的List集合
	 */
	List<Song> getSongTop50ySingerId(Integer singerId);

	/**
	 * 获取歌手的专辑
	 * 
	 * @param singerId
	 *            歌手id
	 * @return 包含专辑信息的Album对象的List集合
	 */
	List<Album> getAlbumBySingerId(Integer singerId, int pageNum, int pageSize);

	/**
	 * 获取歌手信息
	 * 
	 * @param singerId
	 *            歌手id
	 * @return 包含歌手信息的Singer对象
	 */
	Singer getSingerById(Integer singerId);

	/**
	 * 获取歌手专辑总行数
	 * 
	 * @param singerId
	 * 
	 * @param 总行数
	 */
	int getAlbumRowsum(Integer singerId);

	/**
	 * 根据关键字获取Singer集合
	 * 
	 * @param key
	 *            关键字
	 * @param page
	 *            页码
	 * @param count
	 *            数量
	 * @return 包含专辑信息的Singer的List结婚
	 */
	List<Singer> getSingerByKeyword(String key, int page, int count);

	/**
	 * 获取关键字下歌手的数量
	 * 
	 * @param key
	 *            关键字
	 * @return 数量
	 */
	int getSingerCountByKeyword(String key);

}
