package com.music.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.music.biz.MessageBiz;
import com.music.biz.UserBiz;
import com.music.entity.User;

@Controller
public class IndexController {
	@Autowired
	private UserBiz userBiz;
	@Autowired
	private MessageBiz messBiz;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String showView(HttpSession session, Model model) {
		User u = (User) session.getAttribute("user");
		if (null != u) {
			String imgStr = userBiz.getUserImg(u.getUserId());
			String img = "images/user_default.png";
			if (null != imgStr)
				img = imgStr;
			model.addAttribute("img", img);
			model.addAttribute("noRead", messBiz.getMessCountOfNoReadByReceiveUserId(u.getUserId()));
		}
		return "index";
	}

}
