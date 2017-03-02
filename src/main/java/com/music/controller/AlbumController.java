package com.music.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.music.biz.AlbumBiz;
import com.music.entity.Album;

@Controller
public class AlbumController {

	@Autowired
	private AlbumBiz ab;

	@RequestMapping(value = "album", method = RequestMethod.GET)
	public String showView(Integer albumId, Model model) {
		Album a = ab.getAlbumById(albumId);
		if (null == a) {
			return "404";
		}
		model.addAttribute("album", a);
		return "album";
	}

}
