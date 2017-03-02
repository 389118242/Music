package com.music.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.biz.SingerBiz;
import com.music.entity.Album;
import com.music.entity.Singer;
import com.music.entity.Song;

@Controller
public class SingerController {
	@Autowired
	private SingerBiz sib;// 歌手
	// 页面入口

	@RequestMapping("singer")
	public String showView(Integer singerId, Model model) {
		Singer singer = sib.getSingerById(singerId);
		List<Song> songTop50 = sib.getSongTop50ySingerId(singerId);
		model.addAttribute("singer", singer);
		model.addAttribute("songTop50", songTop50);
		return "singerDetail";
	}

	@RequestMapping(value = "/getAlbumsOfSinger", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAlbumsOfSinger(Integer singerId,Integer page) {
		Map<String, Object> ret = new HashMap<>();
		int pageSize = 9;

		List<Album> albums = sib.getAlbumBySingerId(singerId, page, pageSize);
		Integer total = sib.getAlbumRowsum(singerId);
		Integer totalPage = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
		ret.put("albums", albums);
		Integer beginPage = page - 2 > 1 ? page - 2 : 1;
		Integer endPage = beginPage + 4 < totalPage ? beginPage + 4 : totalPage;
		beginPage = endPage - 4 > 1 ? endPage - 4 : 1;
		ret.put("bp", beginPage);
		ret.put("ep", endPage);
		ret.put("present", page);
		ret.put("totalPage", totalPage);
		return ret;
	}

	// // 显示歌手信息（专辑+点击量前50的歌曲）
	// @RequestMapping("singermessage")
	// public String singermessage(Integer singerId, Model model, Integer
	// albumPage, Integer songPage) {
	// int albumPageNum = 1;
	// int albumPageSize = 2;// 专辑一页显示数
	// int albumRowSum = 0;
	// int albumTotalPages = 0;
	// int songPageNum = 1;
	// int songPageSize = 2;// 歌曲一页显示数
	// int songTotalPages = 0;
	// songPageNum = songPage;
	// albumPageNum = albumPage;
	// Singer singer = sib.getSingerById(singerId);// 获取歌手信息
	// List<Album> albumList = sib.getAlbumBySingerId(singerId, albumPageNum,
	// albumPageSize);// 获取专辑列表
	// albumRowSum = sib.getAlbumRowsum(singerId);// 获取专辑总数
	// // 获取总专辑页数
	// if (albumRowSum % albumPageSize == 0) {
	// albumTotalPages = albumRowSum / albumPageSize;
	// } else {
	// albumTotalPages = albumRowSum / albumPageSize + 1;
	// }
	// List<Song> songList = sib.getSongTop50ySingerId(singerId, songPageNum,
	// songPageSize);// 获取top50的歌曲列表
	//
	// // 获取总歌曲页数
	// if (50 % songPageSize == 0) {
	// songTotalPages = 50 / songPageSize;
	// } else {
	// songTotalPages = 50 / songPageSize + 1;
	// }
	// model.addAttribute("singer", singer);
	// model.addAttribute("albumList", albumList);
	// model.addAttribute("albumTotalPages", albumTotalPages);
	// model.addAttribute("albumPageNum", albumPageNum);
	// model.addAttribute("songTotalPages", songTotalPages);
	// model.addAttribute("songPageNum", songPageNum);
	// model.addAttribute("songList", songList);
	//
	// return "singerdetail";
	// }

}
