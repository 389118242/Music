package com.music.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.biz.AlbumBiz;
import com.music.biz.SingerBiz;
import com.music.biz.SongBiz;
import com.music.biz.SongListBiz;

@Controller
public class SearchController {

	@Autowired
	private SongBiz songBiz;
	@Autowired
	private AlbumBiz albumBiz;
	@Autowired
	private SongListBiz songListBiz;
	@Autowired
	private SingerBiz singerBiz;

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String showView(@ModelAttribute("key") String key) {
		return "search";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> search(String type, String key,
			@RequestParam(required = false, defaultValue = "1") Integer page) {
		Map<String, Object> ret = new HashMap<>();
		int total = 0;
		int pageSize = 9;
		Object resultList = null;
		if ("song".equals(type)) {
			total = songBiz.getSongCountByKeyword(key);
			resultList = songBiz.getSongByKeyword(key, page, pageSize);
		} else if ("singer".equals(type)) {
			total = singerBiz.getSingerCountByKeyword(key);
			resultList = singerBiz.getSingerByKeyword(key, page, pageSize);
		} else if ("album".equals(type)) {
			total = albumBiz.getAlbumCountByKeyword(key);
			resultList = albumBiz.getAlbumByKeyword(key, page, pageSize);
		} else if ("songList".equals(type)) {
			total = songListBiz.getSongListCountByKeyword(key);
			resultList = songListBiz.getSongListByKeyword(key, page, pageSize);
		}
		int totalPage = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
		int beginPage = page - 2 > 1 ? page - 2 : 1;
		int endPage = beginPage + 5 < totalPage ? beginPage + 5 : totalPage;
		beginPage = endPage - 5 > 1 ? endPage - 5 : 1;
		ret.put("bp", beginPage);
		ret.put("ep", endPage);
		ret.put("page", page);
		ret.put("totalPage", totalPage);
		ret.put("resultList", resultList);
		return ret;
	}

}
