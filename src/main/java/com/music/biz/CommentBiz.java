package com.music.biz;

import java.util.List;

import com.music.entity.Comment;

public interface CommentBiz {
	
	/**
	 * 添加专辑评论
	 * 
	 * @param albId
	 *            专辑id
	 * @param com
	 *            包含评论信息的Comment对象
	 * @return 是否添加成功
	 */
	boolean addAlbumComment(Integer albId, Comment com);

	/**
	 * 添加歌单评论
	 * 
	 * @param slId
	 *            歌单id
	 * @param com
	 *            包含评论信息的Comment对象
	 * @return 是否添加成功
	 */
	boolean addSongListComment(Integer slId, Comment com);

	/**
	 * 添加歌曲评论
	 * 
	 * @param songId
	 *            歌曲id
	 * @param com
	 *            包含评论信息的Comment对象
	 * @return 是否添加成功
	 */
	boolean addSongComment(Integer songId, Comment com);

	/**
	 * 移除专辑评论
	 * 
	 * @param comId
	 *            评论id
	 * @return 是否移除成功
	 */
	boolean removeAlbumComment(Integer comId);

	/**
	 * 移除歌单评论
	 * 
	 * @param comId
	 *            评论id
	 * @return 是否移除成功
	 */
	boolean removeSongListComment(Integer comId);

	/**
	 * 移除歌曲评论
	 * 
	 * @param comId
	 *            评论id
	 * @return 是否移除成功
	 */
	boolean removeSongComment(Integer comId);

	/**
	 * 获取专辑评论
	 * 
	 * @param albId
	 *            专辑id
	 * @param page
	 *            页码
	 * @param count
	 *            数量
	 * @return 包含评论信息的Comment对象的List集合
	 */
	List<Comment> getAlbumComment(Integer albId, int page, int count);

	/**
	 * 获取专辑评论的数量
	 * 
	 * @param albId
	 *            专辑id
	 * @return 数量
	 */
	int getAlbumCommentCount(Integer albId);

	/**
	 * 获取歌单评论
	 * 
	 * @param slId
	 *            歌单id
	 * @param page
	 *            页码
	 * @param count
	 *            数量
	 * @return 包含评论信息的Comment对象的List集合
	 */
	List<Comment> getSongListComment(Integer slId, int page, int count);

	/**
	 * 获取歌单评论的数量
	 * 
	 * @param songListId
	 *            歌单id
	 * @return 数量
	 */
	int getSongListCommentCount(Integer slId);

	/**
	 * 获取歌曲评论
	 * 
	 * @param songId
	 *            歌曲id
	 * @param page
	 *            页码
	 * @param count
	 *            数量
	 * @return 包含评论信息的Comment对象的List集合
	 */
	List<Comment> getSongComment(Integer songId, int page, int count);

	/**
	 * 获取歌曲评论的数量
	 * 
	 * @param songId
	 *            歌曲id
	 * @return 数量
	 */
	int getSongCommentCount(Integer songId);

	/**
	 * 获取专辑评论
	 * 
	 * @param albId
	 *            专辑id
	 * @return 包含评论信息的Comment对象的List集合
	 */
	List<Comment> getAlbumCommentOfWonderful(Integer albId);

	/**
	 * 获取歌单评论
	 * 
	 * @param slId
	 *            歌单id
	 * @return 包含评论信息的Comment对象的List集合
	 */
	List<Comment> getSongListCommentOfWonderful(Integer slId);

	/**
	 * 获取歌曲评论
	 * 
	 * @param songId
	 *            歌曲id
	 * @return 包含评论信息的Comment对象的List集合
	 */
	List<Comment> getSongCommentOfWonderful(Integer songId);

	/**
	 * 点赞（+1）
	 * 
	 * @param comId
	 *            评论id
	 * @return 是否成功
	 */
	boolean addLikeNum(Integer comId);
}
