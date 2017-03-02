package com.music.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.music.biz.SongListBiz;

@Controller
public class RecommendSongListController {

	@Autowired
	private SongListBiz songListBiz;

	@RequestMapping("recommend")
	public String showView(Model model) {
		model.addAttribute("rsl", songListBiz.getRecommendSongList());
		return "recommendSongList";
	}
}
