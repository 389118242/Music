package com.music.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.biz.CommentBiz;
import com.music.dao.AlbumCommentDao;
import com.music.dao.CommentDao;
import com.music.dao.MessageDao;
import com.music.dao.SongCommentDao;
import com.music.dao.SongListCommentDao;
import com.music.dao.SongListDao;
import com.music.entity.Comment;
import com.music.entity.Message;
import com.music.entity.SongList;

@Service
public class CommentBizImpl implements CommentBiz {

	@Autowired
	private CommentDao commentDao;
	@Resource
	private AlbumCommentDao albumCommentDao;
	@Autowired
	private SongCommentDao songCommentDao;
	@Resource
	private SongListCommentDao songListCommentDao;
	@Resource(name = "messageDao")
	private MessageDao messDao;
	@Resource(name = "songListDao")
	private SongListDao slDao;

	@Override
	public boolean addAlbumComment(Integer albId, Comment com) {
		commentDao.insertSelective(com);
		Integer pId = com.getParentId();
		if (null != pId) {
			Comment messComm = commentDao.selectByPrimaryKey(com.getParentId());
			if (!com.getUserId().equals(messComm.getUserId())) {
				Message mess = new Message();
				mess.setMessContent(com.getComContent() + "<br/>回复我：<a href='album?album=" + albId + "'>"
						+ messComm.getComContent() + "</a>");
				mess.setReceiveUserId(messComm.getUserId());
				mess.setSendUserId(com.getUserId());
				mess.setMessType("回复");
				messDao.insertSelective(mess);
			}
		}
		return albumCommentDao.insert(albId, com.getComId()) > 0;
	}

	@Override
	public boolean addSongListComment(Integer slId, Comment com) {
		commentDao.insertSelective(com);
		Integer pId = com.getParentId();
		if (null != pId) {
			Comment messComm = commentDao.selectByPrimaryKey(pId);
			if (!com.getUserId().equals(messComm.getUserId())) {
				Message mess = new Message();
				mess.setMessContent(com.getComContent() + "<br/>回复我：<a href='songListDetail?songListId=" + slId + "'>"
						+ messComm.getComContent() + "</a>");
				mess.setReceiveUserId(messComm.getUserId());
				mess.setMessType("回复");
				mess.setSendUserId(com.getUserId());
				messDao.insertSelective(mess);
			}
		}
		SongList targetSL = slDao.selectWithNameAndId(slId);
		if (!targetSL.getUserId().equals(com.getUserId())) {
			Message mess = new Message();
			mess.setSendUserId(com.getUserId());
			mess.setReceiveUserId(targetSL.getUserId());
			mess.setMessType("评论");
			mess.setMessContent(com.getComContent() + "<br/>我的歌单：<a href='songListDetail?songListId=" + slId + "'>"
					+ targetSL.getListName() + "</a>");
			messDao.insertSelective(mess);
		}
		return songListCommentDao.insert(slId, com.getComId()) > 0;

	}

	@Override
	public boolean addSongComment(Integer songId, Comment com) {
		commentDao.insertSelective(com);
		Integer pId = com.getParentId();
		if (null != pId) {
			Comment messComm = commentDao.selectByPrimaryKey(pId);
			if (!com.getUserId().equals(messComm.getUserId())) {
				Message mess = new Message();
				mess.setMessContent(com.getComContent() + "<br/>回复我：<a href='song?songId=" + songId + "'>"
						+ messComm.getComContent() + "</a>");
				mess.setReceiveUserId(messComm.getUserId());
				mess.setMessType("回复");
				mess.setSendUserId(com.getUserId());
				messDao.insertSelective(mess);
			}
		}
		return songCommentDao.insert(songId, com.getComId()) > 0;
	}

	// 删除评论存在BUG
	@Override
	public boolean removeAlbumComment(Integer comId) {
		albumCommentDao.delete(comId);
		return commentDao.deleteByPrimaryKey(comId) > 0;
	}

	@Override
	public boolean removeSongListComment(Integer comId) {
		songListCommentDao.delete(comId);
		return commentDao.deleteByPrimaryKey(comId) > 0;
	}

	@Override
	public boolean removeSongComment(Integer comId) {
		songCommentDao.delete(comId);
		return commentDao.deleteByPrimaryKey(comId) > 0;
	}

	@Override
	public List<Comment> getAlbumComment(Integer albId, int page, int count) {
		return albumCommentDao.select(albId, (page - 1) * count, count);
	}

	@Override
	public int getAlbumCommentCount(Integer albId) {
		return albumCommentDao.selectCount(albId);
	}

	@Override
	public List<Comment> getSongListComment(Integer slId, int page, int count) {
		return songListCommentDao.select(slId, (page - 1) * count, count);
	}

	@Override
	public int getSongListCommentCount(Integer slId) {
		return songListCommentDao.selectCount(slId);
	}

	@Override
	public List<Comment> getSongComment(Integer songId, int page, int count) {
		return songCommentDao.select(songId, (page - 1) * count, count);
	}

	@Override
	public int getSongCommentCount(Integer songId) {
		return songCommentDao.selectCount(songId);
	}

	@Override
	public List<Comment> getAlbumCommentOfWonderful(Integer albId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> getSongListCommentOfWonderful(Integer slId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> getSongCommentOfWonderful(Integer songId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addLikeNum(Integer comId) {
		return false;
	}

}
