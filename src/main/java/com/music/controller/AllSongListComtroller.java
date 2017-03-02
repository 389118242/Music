package com.music.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.biz.ListKindBiz;
import com.music.biz.SongListBiz;

@Controller
public class AllSongListComtroller {

	@Autowired
	private ListKindBiz listKindBiz;
	@Autowired
	private SongListBiz songListBiz;

	@RequestMapping(value = "alllist")
	public String showView(Model model) {
		model.addAttribute("listKinds", listKindBiz.getAllListKind());
		return "allList";
	}

	@RequestMapping(value = "/getSongListByKind", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getSongList(Integer kindId, Integer page) {
		Map<String, Object> ret = new HashMap<>();
		int total = 0;
		int pageSize = 18;
		total = songListBiz.getSongListCountByKindId(kindId);
		int temp = total % pageSize == 0 ? total / pageSize : (total / pageSize + 1);
		int totalPage = temp == 0 ? 1 : temp;
		int beginPage = page - 2 > 1 ? page - 2 : 1;
		int endPage = beginPage + 5 < totalPage ? beginPage + 5 : totalPage;
		beginPage = endPage - 5 > 1 ? endPage - 5 : 1;
		ret.put("bp", beginPage);
		ret.put("ep", endPage);
		ret.put("page", page);
		ret.put("totalPage", totalPage);
		ret.put("songList", songListBiz.getSongListByKindId(kindId, page, pageSize));
		return ret;
	}
}
