package com.music.biz.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.biz.SongListBiz;
import com.music.dao.CollectionDao;
import com.music.dao.RecommendSongListDao;
import com.music.dao.SlSongRelationDao;
import com.music.dao.SongListCommentDao;
import com.music.dao.SongListDao;
import com.music.dao.SongListKindDao;
import com.music.entity.ListKind;
import com.music.entity.RecommendSongList;
import com.music.entity.SongList;
import com.music.entity.User;

@Service
public class SongListBizImpl implements SongListBiz {

	@Autowired
	SongListDao sld;
	@Resource(name = "songListKindDao")
	private SongListKindDao slkd;
	@Autowired
	SlSongRelationDao ssrd;
	@Autowired
	private SongListCommentDao slcd;
	@Resource
	private CollectionDao collectionDao;
	@Autowired
	private RecommendSongListDao rsld;

	@Override
	public boolean addSongList(SongList songList) {
		int row = sld.insertSelective(songList);
		// if (row == 0)
		// return false;
		// else
		// return true;
		return row != 0;
	}

	@Override
	public boolean addSongToSongList(Integer slId, Integer songId) {
		int row = ssrd.insertSongToList(slId, songId);
		if (row == 0)
			return false;
		else
			return true;
	}

	@Override
	public boolean removeSongFromSongList(Integer slId, Integer songId) {
		return ssrd.delete(slId, songId) > 0;
	}

	@Override
	public boolean removeSongList(Integer slId) {
		ssrd.deleteBySongListId(slId);
		collectionDao.deleteBySongListId(slId);
		slkd.delete(slId);
		slcd.deleteBySongListId(slId);
		int row = sld.deleteByPrimaryKey(slId);
		if (row == 0)
			return false;
		else
			return true;
	}

	@Override
	public boolean collectionSongList(Integer userId, Integer slId) {
		return collectionDao.insert(userId, slId) > 0;
	}

	@Override
	public List<SongList> getSongListByKeyword(String key, int page, int count) {
		return sld.selectBykeyword(key, (page - 1) * count, count);
	}

	@Override
	public int getSongListCountByKeyword(String key) {
		return sld.selectRowsumByKeyword(key);
	}

	@Override
	public SongList selectSongList(Integer slId) {
		return sld.selectBySongListId(slId);
	}

	@Override
	public List<SongList> selectSongListByUserId(Integer uId) {
		List<SongList> sll = sld.selectByUserId(uId);
		return sll;
	}

	@Override
	public List<SongList> selectSongListByUserIdWithoutSong(Integer uId) {
		return sld.selectByUserIdWithoutSong(uId);
	}

	@Override
	public int selectSongSum(Integer slId) {
		return ssrd.selectSongSum(slId);
	}

	@Override
	public SongList selectSongListWithoutSong(Integer slId) {
		return sld.selectByPrimaryKey(slId);
	}

	@Override
	public List<SongList> selectCollectionSongListByUserIdWithoutSong(Integer uId) {
		return sld.selectCollectionByUserIdWithoutSong(uId);
	}

	@Override
	public User selectUserBySongListId(Integer slId) {
		return sld.selectUser(slId);
	}

	@Override
	public List<Integer> getSongIdOfSongListByListId(Integer listId) {
		return ssrd.selectSongIdBySlId(listId);
	}

	@Override
	public List<ListKind> getSongListKindByListId(Integer listId) {
		return slkd.selectKindByListId(listId);
	}

	@Override
	public boolean updateSongList(Map<String, Object> param) {
		SongList sl = new SongList();
		int ret = 0;
		sl.setListId(Integer.parseInt(param.get("listId").toString()));
		sl.setListName(param.get("listName").toString());
		sl.setListDetail(param.get("listDetail").toString());
		if (null != param.get("imgPath"))
			sl.setListImg(param.get("imgPath").toString());
		ret += sld.updateByPrimaryKeySelective(sl);
		@SuppressWarnings("unchecked")
		List<String> listkind = (List<String>) param.get("listKind");
		slkd.delete(sl.getListId());
		for (int i = 0; i < listkind.size(); i++) {
			ret += slkd.insert(sl.getListId(), Integer.parseInt(listkind.get(i)));
		}
		return ret > 0;
	}

	@Override
	public int getSongListCountByKindId(Integer kindId) {
		return kindId > 0 ? slkd.selectSongListCountByKindId(kindId) : sld.selectAllCount();
	}

	@Override
	public List<SongList> getSongListByKindId(Integer kindId, Integer page, Integer count) {
		RowBounds rb = new RowBounds((page - 1) * count, count);
		return kindId > 0 ? slkd.selectSongListByKindId(kindId, rb) : sld.selectAll(rb);
	}

	@Override
	public List<RecommendSongList> getRecommendSongList() {
		return rsld.select();
	}

	@Override
	public boolean isCollectionSongList(Integer userId, Integer slId) {
		return collectionDao.selectById(userId, slId) > 0;
	}

	@Override
	public boolean removeCollection(Integer userId, Integer slId) {
		return collectionDao.delete(userId, slId) > 0;
	}

}
