package com.music.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.biz.SongBiz;
import com.music.biz.SongListBiz;
import com.music.entity.Song;
import com.music.entity.SongList;
import com.music.entity.User;

@Controller
public class MyMusicController {
	@Autowired
	SongListBiz slb;
	@Autowired
	SongBiz sob;

	@RequestMapping("mymusic")
	public String mymusic(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (null == user)
			return "404";
		int userId = user.getUserId();
		List<SongList> sll;
		sll = slb.selectSongListByUserId(userId);
		// 取出第一个歌单信息
		SongList sl = sll.get(0);
		// 取出第一个歌单对应的歌曲信息
		List<Song> firstSongs = sob.getSongByListId(sl.getListId());
		model.addAttribute("songs", firstSongs);
		model.addAttribute("songListList", sll);
		return "myMusic";
	}

	@RequestMapping("showSongs")
	@ResponseBody
	public Map<String, Object> showSongList(String songListId) {
		Map<String, Object> ret = new HashMap<>();
		Integer listId = Integer.parseInt(songListId);
		List<Song> songs;
		songs = sob.getSongByListId(listId);
		ret.put("songs", songs);
		ret.put("listDetail", slb.selectSongListWithoutSong(listId));
		return ret;

	}

	@RequestMapping("deleteSongFromList")
	@ResponseBody
	public void deleteSongFromList(String songId, String songListId) {
		slb.removeSongFromSongList(Integer.parseInt(songListId), Integer.parseInt(songId));
	}

}
