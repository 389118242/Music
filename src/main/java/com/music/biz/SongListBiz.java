package com.music.biz;

import java.util.List;
import java.util.Map;

import com.music.entity.ListKind;
import com.music.entity.RecommendSongList;
import com.music.entity.SongList;
import com.music.entity.User;

public interface SongListBiz {
	/**
	 * 从数据库中选出歌单(包含歌曲详细信息)
	 * 
	 * @param slId
	 *            歌单id
	 * @return 歌单
	 */
	SongList selectSongList(Integer slId);

	/**
	 * 从数据库中选出歌单(不包含歌曲详细信息)
	 * 
	 * @param slId
	 *            歌单id
	 * @return 歌单
	 */
	SongList selectSongListWithoutSong(Integer slId);

	/**
	 * 根据用户id从数据库中选出相应的歌单集合(包含歌曲详细信息)
	 * 
	 * @param uId
	 *            用户id
	 * @return 歌单集合
	 */
	List<SongList> selectSongListByUserId(Integer uId);

	/**
	 * 根据用户id从数据库中选出相应的歌单集合(不包含歌曲详细信息)
	 * 
	 * @param uId
	 *            用户id
	 * @return 歌单集合
	 */
	List<SongList> selectSongListByUserIdWithoutSong(Integer uId);

	/**
	 * 根据用户id从数据库中其收藏的歌单集合(不包含歌曲详细信息)
	 * 
	 * @param uId
	 *            用户id
	 * @return 歌单集合
	 */
	List<SongList> selectCollectionSongListByUserIdWithoutSong(Integer uId);

	/**
	 * 根据歌单id从数据库中选出相应歌单的歌曲总数
	 * 
	 * @param slId
	 *            歌单id
	 * 
	 * @return 歌曲总数
	 */
	int selectSongSum(Integer slId);

	/**
	 * 根据歌单id从数据库中查出出建立者信息
	 * 
	 * @param slId
	 *            歌单id
	 * 
	 * @return 用户
	 */
	User selectUserBySongListId(Integer slId);

	/**
	 * 创建歌单
	 * 
	 * @param songList
	 *            包含歌单基本信息的SongList对象
	 * @return 是否创建成功
	 */
	boolean addSongList(SongList songList);

	/**
	 * 向歌单中添加歌曲
	 * 
	 * @param slId
	 *            歌单id
	 * @param songId
	 *            歌曲id
	 * @return 是否添加成功
	 */
	boolean addSongToSongList(Integer slId, Integer songId);

	/**
	 * 从歌单中移除某个歌曲
	 * 
	 * @param slId
	 *            歌单
	 * @param songId
	 * @return
	 */
	boolean removeSongFromSongList(Integer slId, Integer songId);

	/**
	 * 删除歌单
	 * 
	 * @param slId
	 *            歌单id
	 * @return 是否成功
	 */
	boolean removeSongList(Integer slId);

	/**
	 * 收藏歌单
	 * 
	 * @param userId
	 *            用户id
	 * @param slId
	 *            歌单id
	 * @return 是否成功
	 */
	boolean collectionSongList(Integer userId, Integer slId);

	boolean removeCollection(Integer userId, Integer slId);

	boolean isCollectionSongList(Integer userId, Integer slId);

	/**
	 * 根据关键字获取SongList集合
	 * 
	 * @param key
	 *            关键字
	 * @param page
	 *            页码
	 * @param count
	 *            数量
	 * @return 包含专辑信息的SongList的List结婚
	 */
	List<SongList> getSongListByKeyword(String key, int page, int count);

	/**
	 * 获取关键字下歌单的数量
	 * 
	 * @param key
	 *            关键字
	 * @return 数量
	 */
	int getSongListCountByKeyword(String key);

	int getSongListCountByKindId(Integer kindId);

	List<Integer> getSongIdOfSongListByListId(Integer listId);

	List<ListKind> getSongListKindByListId(Integer listId);

	List<SongList> getSongListByKindId(Integer kindId, Integer page, Integer count);

	boolean updateSongList(Map<String, Object> param);

	List<RecommendSongList> getRecommendSongList();

}
