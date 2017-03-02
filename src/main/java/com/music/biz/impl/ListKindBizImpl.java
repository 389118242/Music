package com.music.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.music.biz.ListKindBiz;
import com.music.dao.ListKindDao;
import com.music.entity.ListKind;

@Service
public class ListKindBizImpl implements ListKindBiz {

	@Resource
	private ListKindDao listKindDao;

	@Override
	public List<ListKind> getAllListKind() {
		return listKindDao.select();
	}

}
