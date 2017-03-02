package com.music.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.music.biz.SongBiz;
import com.music.entity.Song;

@Controller
public class IndexFrameController {

	@Autowired
	SongBiz sob;

	@RequestMapping("indexFrame")
	public String showView(Model model) {
		// ��ʾ�����Ƽ�
		List<Song> songList = sob.getIndexList();
		// ��ʾ���а�
		List<Song> sList = sob.getPaihangbangList();
		model.addAttribute("sList", sList);
		model.addAttribute("songList", songList);
		return "indexFrame";
	}

}
