package com.music.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.biz.UserBiz;
import com.music.entity.User;
import com.music.entity.UserWithBLOBs;

@Controller
public class SettingComtroller {

	@Autowired
	private UserBiz userBiz;

	@RequestMapping(value = "setting", method = RequestMethod.GET)
	public String showView(HttpSession session, Model model) {
		User u = (User) session.getAttribute("user");
		if (null == u)
			return "404";
		UserWithBLOBs user = userBiz.getUser(u.getUserId());
		if (user.getUserImg() == null) {
			user.setUserImg("images/user_default.png");
		}
		if (null == user.getUserBirthDay()) {
			try {
				user.setUserBirthDay(new SimpleDateFormat("yyyy-MM-dd").parse("1999-09-09"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("settingUser", user);
		return "setting";
	}

	@RequestMapping(value = "setting", method = RequestMethod.POST)
	@ResponseBody
	public boolean alertUserInfo(@RequestBody UserWithBLOBs user, HttpSession session) {
		User u = (User) session.getAttribute("user");
		if (null == u)
			return false;
		user.setUserId(u.getUserId());
		boolean ret = false;
		ret = userBiz.updateUser(user);
		return ret;
	}

}
