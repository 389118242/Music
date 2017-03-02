package com.music.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.music.entity.ListKind;
import com.music.entity.SongList;

public interface SongListKindDao {

	public abstract int insert(Integer slId, Integer lkId);

	public abstract int delete(Integer slId);

	public abstract List<ListKind> selectKindByListId(Integer slId);

	public abstract int selectSongListCountByKindId(Integer kindId);

	public abstract List<SongList> selectSongListByKindId(Integer kindId, RowBounds rb);

}
