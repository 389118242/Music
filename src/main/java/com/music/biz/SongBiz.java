package com.music.biz;

import java.util.List;

import com.music.entity.Album;
import com.music.entity.Song;

public interface SongBiz {

	/**
	 * 获取歌曲信息
	 * 
	 * @param songId
	 *            歌曲id
	 * @return 包含歌曲信息详细的
	 */
	Song getSongById(Integer songId);

	/**
	 * 获取歌曲信息
	 * 
	 * @param songId
	 *            歌曲id
	 * @return 包含歌词、歌手信息的Song对象
	 */
	Song getSongWithLyricById(Integer songId);

	/**
	 * 增加歌曲播放次数（每次+1）
	 * 
	 * @param songId
	 *            歌曲id
	 */
	void addPlayNum(Integer songId);

	/**
	 * 根据关键字获取Song集合
	 * 
	 * @param key
	 *            关键字
	 * @param page
	 *            页码
	 * @param count
	 *            数量
	 * @return 包含专辑信息的Song的List结婚
	 */
	List<Song> getSongByKeyword(String key, int page, int count);

	/**
	 * 获取关键字下歌曲的数量
	 * 
	 * @param key
	 *            关键字
	 * @return 数量
	 */
	int getSongCountByKeyword(String key);

	/**
	 * 获取排行榜歌曲
	 * 
	 * @return List<Song>
	 */
	List<Song> getPaihangbangList();

	/**
	 * 获取主页歌曲集合
	 * 
	 * @return
	 */
	List<Song> getIndexList();

	String getSingerNameById(Integer singerId);

	Album getAlbumnameAndImg(Integer albumId);

	/**
	 * 根据歌单id取出其相应歌曲
	 * 
	 * @param songListId
	 * @return list
	 */
	List<Song> getSongByListId(Integer songListId);
}
