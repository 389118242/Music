package com.music.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.biz.SongListBiz;
import com.music.biz.UserBiz;
import com.music.entity.SongList;
import com.music.entity.User;

@Controller
public class RegisterController {

	@Autowired
	private UserBiz userBiz;
	@Resource(name = "songListBizImpl")
	private SongListBiz songListBiz;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String showView() {
		return "register";
	}

	@RequestMapping(value = "/accountIsExists", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkAccountIsExists(String userAccount) {
		Map<String, Object> ret = new HashMap<>();
		if (userBiz.isExist(userAccount)) {
			ret.put("ret", false);
		} else {
			ret.put("ret", true);
		}
		return ret;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(User user) {
		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.update(user.getUserPassword().getBytes());
			user.setUserPassword(new BigInteger(digest.digest()).toString(16));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		if (userBiz.register(user)) {
			SongList sl = new SongList();
			sl.setListImg("slImg/MyFavorite.jpg");
			sl.setListName("Œ“œ≤ª∂µƒ“Ù¿÷");
			sl.setUserId(user.getUserId());
			songListBiz.addSongList(sl);
			return "successRegister";
		} else {
			return "404";
		}
	}

}
