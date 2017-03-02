package com.music.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.biz.SongListBiz;
import com.music.entity.SongList;
import com.music.entity.User;

@Controller
public class SongListController {

	@Autowired
	private SongListBiz slb;

	// չʾ�赥����
	@RequestMapping("songListDetail")
	public String showView(Integer songListId, Model model, HttpSession session) {
		if (null == songListId)
			return "404";
		// ���ݸ赥idȡ���赥�Լ������ĸ�����Ϣ
		SongList sl;
		sl = slb.selectSongList(songListId);
		if (null == sl)
			return "404";
		// ���ݸ赥idȡ���赥�Ĵ�����
		User u;
		u = slb.selectUserBySongListId(sl.getListId());

		model.addAttribute("user", u);
		model.addAttribute("songList", sl);
		model.addAttribute("listKid", slb.getSongListKindByListId(songListId));
		User user = (User) session.getAttribute("user");
		if (null != user && !user.getUserId().equals(u.getUserId())
				&& slb.isCollectionSongList(user.getUserId(), songListId)) {
			model.addAttribute("collection", "music");
		}
		return "songList";
	}

	// �ղظ������赥
	@RequestMapping("collectSong")
	@ResponseBody
	public void collectSong(String collectListId, String songId, HttpSession session, HttpServletResponse response) {
		// �Ѹ������뵽Ҫ�ղصĸ赥��
		slb.addSongToSongList(Integer.parseInt(collectListId), Integer.parseInt(songId));
	}

	@RequestMapping(value = "collectionSongList", method = RequestMethod.POST)
	@ResponseBody
	public boolean collecitonSongList(Integer userId, Integer slId) {
		return slb.collectionSongList(userId, slId);
	}

	@RequestMapping(value = "cancelCollection", method = RequestMethod.POST)
	@ResponseBody
	public boolean cancelCollection(Integer userId, Integer slId) {
		return slb.removeCollection(userId, slId);
	}
}
