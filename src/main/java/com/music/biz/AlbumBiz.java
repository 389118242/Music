package com.music.biz;

import java.util.List;

import com.music.entity.Album;

public interface AlbumBiz {

	/**
	 * 根据专辑id获取专辑
	 * 
	 * @param albId
	 *            专辑id
	 * @return 包含专辑信息的Album对象，无则返回null
	 */
	Album getAlbumById(Integer albId);

	/**
	 * 根据特定页码和每页数量获取Album集合
	 * 
	 * @param page
	 *            页码
	 * @param count
	 *            每页显示数量
	 * @return 包含专辑信息的Album的List集合
	 */
	List<Album> getAlbum(int page, int count);

	/**
	 * 根据关键字获取Album集合
	 * 
	 * @param key
	 *            关键字
	 * @param page
	 *            页码
	 * @param count
	 *            数量
	 * @return 包含专辑信息的Album的List结婚
	 */
	List<Album> getAlbumByKeyword(String key, int page, int count);

	/**
	 * 获取关键字下专辑的数量
	 * 
	 * @param key
	 *            关键字
	 * @return 数量
	 */
	int getAlbumCountByKeyword(String key);

	List<Integer> getSongIdByAlbumId(Integer albumId);

}
