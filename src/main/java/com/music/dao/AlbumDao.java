package com.music.dao;

import java.util.List;

import com.music.entity.Album;

public interface AlbumDao {

	int selectRowsumBySingerId(Integer singerId);// ͨ��singerId����ר��������

	int selectRowsumByKeyword(String key);

	List<Album> selectAlbumBySingerId(Integer singerId, int pageNum, int pageSize);// ͨ��singerId����ר����ҳ

	List<Album> selectAlbumByKeyword(String key, int begin, int count);

	int deleteByPrimaryKey(Integer albumId);

	int insert(Album record);

	int insertSelective(Album record);

	Album selectByPrimaryKey(Integer albumId);
	
	Album selectByAlbumId(Integer albumId);

	int updateByPrimaryKeySelective(Album record);

	int updateByPrimaryKeyWithBLOBs(Album record);

	int updateByPrimaryKey(Album record);

	Album selectImgAndNameByid(Integer albumId);

}